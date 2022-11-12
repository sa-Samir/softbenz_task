import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  final String imageName;
  const CustomBanner({
    super.key,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 200,
        child: Image.asset(
          'assets/images/$imageName',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
