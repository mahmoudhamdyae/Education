import 'package:education/data/remote/remote_data_source.dart';
import 'package:education/data/repository/repository_impl.dart';
import 'package:education/domain/repository/repository.dart';
import 'package:education/presentation/screens/subscription/controller/subscription_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/network_info.dart';
import '../data/remote/account_service.dart';
import '../presentation/screens/home/recorded_courses/controller/recorded_courses_controller.dart';
import '../presentation/screens/home/subject/controller/subject_controller.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // App module, its a module where we put all generic dependencies

  // Shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // App prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // Network info
  instance.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(InternetConnectionChecker()));

  // AccountService
  instance.registerLazySingleton<AccountService>(
          () => AccountServiceImpl(instance<AppPreferences>(), instance<NetworkInfo>()));

  // Remote Data Source
  instance.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSource());

  // Repository
  instance.registerLazySingleton<Repository>(
          () => RepositoryImpl(instance<RemoteDataSource>()));

  // Controllers
  instance.registerLazySingleton<RecordedCoursesController>(
          () => RecordedCoursesController(instance<Repository>()));
  instance.registerLazySingleton<SubscriptionController>(
          () => SubscriptionController(instance<Repository>()));
  instance.registerLazySingleton<SubjectController>(
          () => SubjectController(instance<Repository>()));
}