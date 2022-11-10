import 'package:flutter/material.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  const ProductsByCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('This is the products by category page.'),
      ),
    );
  }
}
