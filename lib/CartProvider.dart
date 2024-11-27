import 'package:flutter/material.dart';
import 'Product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cart = [];

  List<Map<String, dynamic>> get cart => List.unmodifiable(_cart);

  void addToCart(Product product) {
    final index = _cart.indexWhere((item) => item['product'].id == product.id);
    if (index == -1) {
      _cart.add({'product': product, 'quantity': 1});
    } else {
      _cart[index]['quantity']++;
    }
    notifyListeners();
    saveCartToStorage();
  }

  void removeFromCart(Product product) {
    _cart.removeWhere((item) => item['product'].id == product.id);
    notifyListeners();
    saveCartToStorage();
  }

  void updateQuantity(Product product, int quantity) {
    final index = _cart.indexWhere((item) => item['product'].id == product.id);
    if (index != -1) {
      _cart[index]['quantity'] = quantity;
      if (quantity <= 0) {
        _cart.removeAt(index);
      }
    }
    notifyListeners();
    saveCartToStorage();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
    clearStoredCart();
  }

  Future<void> saveCartToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('cart', jsonEncode(_cart.map((item) {
      return {
        'product': item['product'].toJson(),
        'quantity': item['quantity'],
      };
    }).toList()));
  }

  Future<void> loadCartFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final storedCart = prefs.getString('cart');
    if (storedCart != null) {
      _cart.clear();
      final List<dynamic> decoded = jsonDecode(storedCart);
      _cart.addAll(decoded.map((item) {
        return {
          'product': Product.fromJson(item['product']),
          'quantity': item['quantity'],
        };
      }).toList());
      notifyListeners();
    }
  }

  Future<void> clearStoredCart() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('cart');
  }
}
