import 'package:flutter/material.dart';

class NewArrivalScreen extends StatelessWidget {
  const NewArrivalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('This is the New Arrival page.'),
      ),
    );
  }
}
