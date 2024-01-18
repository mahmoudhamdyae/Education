import 'package:education/presentation/screens/home/widgets/home_not_authenticated/widgets/saff_item.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../resources/strings_manager.dart';
import '../../../../../resources/styles_manager.dart';

class Sfoof extends StatelessWidget {

  final List<String> sfoof;
  const Sfoof({super.key, required this.sfoof});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            AppStrings.homeSfoof,
            style: getLargeStyle(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sfoof.length,
              itemBuilder: (BuildContext context, int index) {
                return SaffItem(saff: sfoof[index],);
              },
            ),
          ),
        ),
        const SizedBox(height: 16.0,),
      ],
    );
  }
}
