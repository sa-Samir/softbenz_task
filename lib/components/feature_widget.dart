import 'package:flutter/material.dart';
import 'package:softbenz_task/utils/constants.dart';

class FeatureWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const FeatureWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Constants.pColor,
            ),
          ),
          child: Icon(
            icon,
            color: Constants.pColor,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 10,
            height: 1.1,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
