import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:template_for_flutter/core/network/dio_config.dart';
import 'network/api_handler.dart';
import '../core/network/network_info.dart';
import '../features/example_feature/data/data_sources/example_remote_datasource.dart';
import '../features/example_feature/data/repositories/example_repositories_impl.dart';
import '../features/example_feature/domain/repositories/example_repository.dart';
import '../features/example_feature/domain/usecases/example_usecase.dart';

final sl = GetIt.instance;

/// Initialize all dependencies for the app.
/// Call `await init();` in main() before runApp()
Future<void> init() async {
  //! ---------------------------
  //! Core
  //! ---------------------------
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => Connectivity());

  //! Dio
  sl.registerLazySingleton<Dio>(() => DioConfig.createDio());

  //! ApiHandler
  sl.registerLazySingleton(() => ApiHandler());

  //! ---------------------------
  //! Features: Example Feature
  //! ---------------------------

  // Use Cases
  sl.registerLazySingleton(() => GetExample(sl()));

  // Repository
  sl.registerLazySingleton<ExampleRepository>(
    () => ExampleRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
      apiHandler: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<ExampleRemoteDataSource>(
    () => ExampleRemoteDataSourceImpl(dio: sl()),
  );

  //! ---------------------------
  //! Add other features here
  //! ---------------------------
}
