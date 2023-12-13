import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/widgets/dialogs/choose_marhala_dialog.dart';
import 'package:flutter/material.dart';

import '../../domain/models/HomeUI.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required HomeUI item}) : _item = item;

  final HomeUI _item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppPadding.p16),
        child: Stack(
          children: [
            const WaveBackground(baseColor: ColorManager.primary, waveColor: ColorManager.lightPrimary),
            Positioned(
              right: 0,
              left: 0,
              top: 0,
              bottom: 0,
              child: InkWell(
              onTap: () {
                if (
                _item.name == AppStrings.recordedCourses ||
                _item.name == AppStrings.examsAndBanks ||
                _item.name == AppStrings.printedNotes
                ) {
                  showChooseMarhalaDialog(context, (marhala, saff) {
                    _item.action(marhala, saff);
                  });
                } else {
                  _item.action('', '');
                };
                },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(_item.icon, scale: AppSize.s8,),
                  const SizedBox(height: AppSize.s16,),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Text(
                      _item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: AppSize.s16,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.white
                      ),
                    ),
                  ),
                ],
              ),
                        ),
            )],
        ),
      ),
    );
  }
}




















// كلاس مخصص لتحديد شكل الموجة
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
