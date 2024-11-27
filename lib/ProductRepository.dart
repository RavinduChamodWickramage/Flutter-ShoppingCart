import 'dart:async';
import 'dart:io';
import 'Product.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      return [
        Product(
          id: '1',
          name: 'Apple iPhone 14',
          price: 999.99,
          image: 'assets/images/iphone14.png',
          description: 'The latest Apple smartphone with A15 Bionic chip.',
        ),
        Product(
          id: '2',
          name: 'Samsung Galaxy S23',
          price: 849.99,
          image: 'assets/images/samsunggalaxys23.png',
          description: 'Flagship Android smartphone with Snapdragon processor.',
        ),
        Product(
          id: '3',
          name: 'Sony WH-1000XM5 Headphones',
          price: 399.99,
          image: 'assets/images/SonyWH1000XM5Headphones.png',
          description: 'Industry-leading noise-canceling wireless headphones.',
        ),
        Product(
          id: '4',
          name: 'Dell XPS 13 Laptop',
          price: 1199.99,
          image: 'assets/images/DellXPS13Laptop.png',
          description: 'Ultra-thin, high-performance laptop with InfinityEdge display.',
        ),
        Product(
          id: '5',
          name: 'Apple AirPods Pro 2nd Gen',
          price: 249.99,
          image: 'assets/images/AppleAirPodsPro.png',
          description: 'Premium wireless earbuds with active noise cancellation.',
        ),
        Product(
          id: '6',
          name: 'Fitbit Charge 5',
          price: 149.99,
          image: 'assets/images/FitbitCharge.png',
          description: 'Advanced fitness tracker with health and wellness monitoring.',
        ),
        Product(
          id: '7',
          name: 'Google Nest Hub 2nd Gen',
          price: 99.99,
          image: 'assets/images/GoogleNestHub.png',
          description: 'Smart display for home automation and Google Assistant.',
        ),
        Product(
          id: '8',
          name: 'Logitech MX Master 3 Mouse',
          price: 99.99,
          image: 'assets/images/LogitechMouse.png',
          description: 'Ergonomic wireless mouse with precise scrolling and tracking.',
        ),
        Product(
          id: '9',
          name: 'Nintendo Switch OLED',
          price: 349.99,
          image: 'assets/images/NintendoSwitch.png',
          description: 'Gaming console with an enhanced OLED display.',
        ),
        Product(
          id: '10',
          name: 'Sony PlayStation 5',
          price: 499.99,
          image: 'assets/images/SonyPlayStation5.png',
          description: 'Next-gen gaming console with stunning 4K graphics.',
        ),
      ];
    } on SocketException {
      throw Exception('Network error: Unable to fetch products');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
