import 'dart:math' as math;
import 'package:flutter/material.dart';

/// الكلـاس المسؤول عن قصّ الشكل المُمَوَّج للشارة الخضراء
class _BadgeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const int waves = 8;                 // عدد التموجات (يمكن تغييره)
    final center = Offset(size.width / 2, size.height / 2);
    final outerR = size.width / 2;       // نصف القطر الخارجي
    final innerR = outerR * 0.83;        // نصف القطر الداخلي (يحدّد عمق التموج)

    final path = Path()..moveTo(size.width, center.dy); // ابدأ من اليمين

    // ارسم التموجات باستخدام نقاط نصف قطر متبدِّلة
    for (int i = 1; i <= waves * 2; i++) {
      final isEven = i.isEven;
      final r = isEven ? innerR : outerR;
      final angle = (i * math.pi) / waves;
      final point = Offset(
        center.dx + r * math.cos(angle),
        center.dy + r * math.sin(angle),
      );
      path.lineTo(point.dx, point.dy);
    }

    return path..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

/// ودجِت جاهز للاستخدام
class VerifiedAvatar extends StatelessWidget {
  const VerifiedAvatar({
    super.key,
    this.size = 90,               // قُطر الدائرة الرمادية
    this.badgeSize = 30,           // قُطر الشارة الخضراء
  });

  final double size;
  final double badgeSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // الدائرة الرمادية
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300,
            ),
          ),

          // الشارة الخضراء
          Positioned(
            right: -badgeSize * 0.1,   // محاذاة بسيطة بحيث تتداخل قليلًا
            bottom: -badgeSize * 0.1,
            child: ClipPath(
              clipper: _BadgeClipper(),
              child: Container(
                width: badgeSize,
                height: badgeSize,
                color: const Color(0xFF3BA286),           // الأخضر المستخدم في المثال
                alignment: Alignment.center,
                child: const Icon(Icons.check,
                    size: 22, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
