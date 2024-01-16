import 'package:education/domain/models/courses/course.dart';
import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/resources/font_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/widgets/bookmark_course.dart';
import 'package:education/presentation/widgets/buy_widget.dart';
import 'package:education/presentation/widgets/empty_screen.dart';
import 'package:education/presentation/widgets/error_screen.dart';
import 'package:education/presentation/widgets/loading_screen.dart';
import 'package:education/presentation/widgets/price_widget.dart';
import 'package:education/presentation/widgets/rate_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../../../resources/assets_manager.dart';
import '../controller/fav_controller.dart';

class TabCourses extends StatelessWidget {
  const TabCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<FavController>(
      builder: (FavController controller) {
        List<Course> favCourses = controller.courses;
        if (controller.status.isLoading) {
          return const LoadingScreen();
        } else if (controller.status.isError) {
          return ErrorScreen(error: controller.status.errorMessage ?? '');
        } else if (favCourses.isEmpty) {
          return const Expanded(child: EmptyScreen(emptyString: AppStrings.emptyFav));
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: favCourses.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffF2F2F2),
                            width: 1,
                          ),
                        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              ImageAssets.course,
                              height: 88,
                              width: 86,
                              fit: BoxFit.fitHeight,
                            ),
                            const SizedBox(width: 2.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  favCourses[index].name,
                                  style: getLargeStyle(
                                      fontSize: FontSize.s14,
                                      color: ColorManager.secondary
                                  ),
                                ),
                                Text(
                                  'وليد أبو قمر',
                                  style: getSmallStyle(fontSize: 13),
                                ),
                                const SizedBox(height: 16.0,),
                                Row(
                                  children: [
                                    RateWidget(rate: favCourses[index].rate),
                                    const SizedBox(width: 12.0,),
                                    PriceWidget(price: favCourses[index].term),
                                  ],
                                )
                              ],
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        left: 0,
                        child: BookmarkCourse(course: favCourses[index])
                    ),
                    Positioned(
                        bottom: 8,
                        left: 12,
                        child: BuyWidget(course: favCourses[index], width: 100,)
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
