import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CartProvider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: cartProvider.cart.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
        itemCount: cartProvider.cart.length,
        itemBuilder: (context, index) {
          final cartItem = cartProvider.cart[index];
          final product = cartItem['product'];
          final quantity = cartItem['quantity'];

          return ListTile(
            leading: Image.network(product.image),
            title: Text(product.name),
            subtitle: Text('\$${product.price.toString()} x $quantity'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    cartProvider.updateQuantity(product, quantity - 1);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    cartProvider.updateQuantity(product, quantity + 1);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    cartProvider.removeFromCart(product);
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: cartProvider.cart.isEmpty
          ? null
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            cartProvider.clearCart();
          },
          child: const Text('Clear Cart'),
        ),
      ),
    );
  }
}
