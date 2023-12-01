import 'package:get_it/get_it.dart';
import 'package:jumush_tapp/core/repository/user_repository.dart';
import 'package:jumush_tapp/product/constants/general_functions.dart';
import 'package:jumush_tapp/services/fire_store_service.dart';
import 'package:jumush_tapp/services/firebase_auth_service.dart';
import 'package:jumush_tapp/services/job_service.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => FireStoreService());
  locator.registerLazySingleton(() => JobService());
  locator.registerLazySingleton(() => GeneralFunction());
}
