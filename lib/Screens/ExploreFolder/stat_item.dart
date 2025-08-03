import 'package:flutter/material.dart';

const kPrimaryGreen = Color(0xFF247C66);
const kIconCircle = Color(0xFFF1F1F1);


class StatItem extends StatelessWidget {
  const StatItem({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value; // مثال: 7,500+
  final String label; // مثال: Customer

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: const BoxDecoration(
            color: kIconCircle,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 28, color: kPrimaryGreen),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: kPrimaryGreen,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}