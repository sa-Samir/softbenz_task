import 'package:flutter/material.dart';

class FeaturedProductScreen extends StatelessWidget {
  const FeaturedProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('This is the featured products page.'),
      ),
    );
  }
}
