import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/screens/subscription/subscription_controller.dart';
import 'package:education/presentation/widgets/empty_screen.dart';
import 'package:education/presentation/widgets/error_screen.dart';
import 'package:education/presentation/widgets/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_prefs.dart';
import '../../../core/di.dart';
import '../../widgets/require_log_in_view.dart';

class SubscriptionScreen extends StatelessWidget {
  SubscriptionScreen({super.key});

  final AppPreferences _appPreferences = instance<AppPreferences>();
  final SubscriptionController _controller = instance<SubscriptionController>();

  @override
  Widget build(BuildContext context) {
    _controller.getSubscription();
    return FutureBuilder(
        future: _appPreferences.isUserLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // if (snapshot.data == true) {
              // User logged in
              return Obx(() {
                if (_controller.isLoading.value) {
                  return const LoadingScreen();
                } else if (_controller.error.value != '') {
                  return ErrorScreen(error: _controller.error.value);
                } else if (_controller.courses.isEmpty) {
                  return const EmptyScreen(emptyString: 'لا يوجد اشتراكات');
                } else {
                  final courses = _controller.courses;
                  return ListView.builder(
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(courses[index].name),
                          ),
                        );
                      }
                  );
                }
              });
            // } else {
            //   // User not logged in
            //   return const RequireLogInView();
            // }
          } else {
            return Container();
          }
        }
    );
  }
}
