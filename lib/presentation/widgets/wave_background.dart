// كلاس مخصص لتحديد شكل الموجة
import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  // دالة لإرجاع مسار الشكل
  @override
  Path getClip(Size size) {
    // إنشاء كائن مسار جديد
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height - 100, size.width / 2, size.height - 50);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);

    // إغلاق المسار
    path.close();
    // إرجاع المسار
    return path;
  }

  // دالة لتحديد إذا كان يجب إعادة رسم الشكل
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // إرجاع false لأن الشكل ثابت
    return false;
  }
}

// ويدجت لعرض شكل الموجة كخلفية
class WaveBackground extends StatelessWidget {
  // اللون الأساسي للخلفية
  final Color baseColor;
  // اللون الثانوي للخلفية
  final Color waveColor;

  // البناء مع تحديد الألوان
  const WaveBackground({
    Key? key,
    this.baseColor = Colors.blue,
    this.waveColor = Colors.white,
  }) : super(key: key);

  // دالة لبناء الويدجت
  @override
  Widget build(BuildContext context) {
    // إرجاع حاوية مرنة تملأ كل المساحة المتاحة
    return Flexible(
      // إرجاع حاوية ملونة باللون الأساسي
      child: Container(
        color: baseColor,
        // إرجاع ويدجت لقص الخلفية بشكل موجة
        child: ClipPath(
          // استخدام الكلاس المخصص لتحديد شكل الموجة
          clipper: WaveClipper(),
          // إرجاع حاوية ملونة باللون الثانوي
          child: Container(
            color: waveColor,
          ),
        ),
      ),
    );
  }
}