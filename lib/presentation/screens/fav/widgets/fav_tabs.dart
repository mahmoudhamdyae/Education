import 'package:education/presentation/screens/fav/widgets/tab_courses.dart';
import 'package:education/presentation/screens/fav/widgets/tab_videos.dart';
import 'package:flutter/material.dart';

class FavTabs extends StatefulWidget {
  const FavTabs({super.key});

  @override
  State<FavTabs> createState() => _FavTabsState();
}

class _FavTabsState extends State<FavTabs> {

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //   child: Row(
        //     children: [
        //       Expanded(
        //           child: InkWell(
        //             onTap: () {
        //               setState(() {
        //                 selectedTab = 0;
        //               });
        //             },
        //             child: Padding(
        //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //               child: Center(
        //                 child: Text(
        //                   AppStrings.favCourses,
        //                   style: selectedTab == 0 ? getLargeStyle() : getLargeStyle(color: ColorManager.grey),
        //                 ),
        //               ),
        //             ),
        //           )
        //       ),
        //       Expanded(
        //           child: InkWell(
        //             onTap: () {
        //               setState(() {
        //                 selectedTab = 1;
        //               });
        //             },
        //             child: Center(
        //               child: Text(
        //                 AppStrings.favVideos,
        //                 style: selectedTab == 1 ? getLargeStyle() : getLargeStyle(color: ColorManager.grey),
        //               ),
        //             ),
        //           )
        //       ),
        //     ],
        //   ),
        // ),
        // Stack(
        //   children: [
        //     const Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 16.0),
        //       child: Divider(),
        //     ),
        //     Row(
        //       children: [
        //         Expanded(
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //             child: selectedTab == 0 ? const Divider(
        //               color: ColorManager.primary,
        //               thickness: 3,
        //             ) : Container(),
        //           ),
        //         ),
        //         Expanded(
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //             child: selectedTab == 1 ? const Divider(
        //               color: ColorManager.primary,
        //               thickness: 3,
        //             ) : Container(),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        // const SizedBox(height: 16,),
        selectedTab == 0 ? const TabCourses() : const TabVideos(),
      ],
    );
  }
}
