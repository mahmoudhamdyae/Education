import 'package:education/domain/models/returned_video.dart';
import 'package:education/presentation/screens/fav/controller/video_controller.dart';
import 'package:education/presentation/screens/fav/widgets/videos_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../../../resources/strings_manager.dart';
import '../../../widgets/empty_screen.dart';
import '../../../widgets/error_screen.dart';
import '../../../widgets/loading_screen.dart';

class TabVideos extends StatelessWidget {
  const TabVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetX<VideoController>(
        builder: (VideoController controller) {
          List<ReturnedVideo> returnedVideos = controller.courses;
          if (controller.status.isLoading) {
            return const LoadingScreen();
          } else if (controller.status.isError) {
            return ErrorScreen(error: controller.status.errorMessage ?? '');
          } else if (returnedVideos.isEmpty) {
            return const EmptyScreen(emptyString: AppStrings.emptyVideos);
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Expanded(
              child: VideosList(courses: returnedVideos,),
            ),
          );
        },
      ),
    );
  }
}
