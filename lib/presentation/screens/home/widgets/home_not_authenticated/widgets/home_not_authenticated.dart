import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/screens/home/widgets/home_not_authenticated/widgets/sfoof.dart';
import 'package:flutter/cupertino.dart';

class HomeNotAuthenticated extends StatelessWidget {
  const HomeNotAuthenticated({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Sfoof(sfoof: [
          AppStrings.saff1,
          AppStrings.saff2,
          AppStrings.saff3,
          AppStrings.saff4,
          AppStrings.saff5,
          AppStrings.saff6,
          AppStrings.saff7,
          AppStrings.saff8,
          AppStrings.saff9,
          AppStrings.saff10,
          AppStrings.saff11,
          AppStrings.saff12,
        ]),
      ],
    );
  }
}
