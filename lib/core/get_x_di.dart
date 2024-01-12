import 'package:dio/dio.dart';
import 'package:education/core/app_prefs.dart';
import 'package:education/core/di.dart';
import 'package:education/data/remote/account_service.dart';
import 'package:education/data/remote/remote_data_source.dart';
import 'package:education/data/repository/repository_impl.dart';
import 'package:education/domain/repository/repository.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../data/network_info.dart';
import '../presentation/screens/home/recorded_courses/controller/recorded_courses_controller.dart';
import '../presentation/screens/home/subject/controller/subject_controller.dart';
import '../presentation/screens/subscription/controller/subscription_controller.dart';

class GetXDi implements Bindings {

  @override
  void dependencies() async {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

    Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()), fenix: true);
    Get.put<Dio>(dio);

    Get.lazyPut<AccountService>(() => AccountServiceImpl(instance<AppPreferences>(), Get.find<NetworkInfo>(), Get.find<Dio>()), fenix: true);
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSource(Get.find<NetworkInfo>(), Get.find<Dio>()), fenix: true);
    Get.lazyPut<Repository>(() => RepositoryImpl(Get.find<RemoteDataSource>()), fenix: true);

    Get.lazyPut<RecordedCoursesController>(() => RecordedCoursesController(Get.find<Repository>()), fenix: true);
    Get.lazyPut<SubjectController>(() => SubjectController(Get.find<Repository>()), fenix: true);
    Get.lazyPut<SubscriptionController>(() => SubscriptionController(Get.find<Repository>()), fenix: true);
  }
}