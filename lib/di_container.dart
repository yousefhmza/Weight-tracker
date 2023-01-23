import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weight_tracker/core/services/network/api_client.dart';
import 'package:weight_tracker/modules/auth/cubits/sign_in_cubit.dart';
import 'package:weight_tracker/modules/auth/repositories/sign_in_repository.dart';
import 'package:weight_tracker/modules/home/cubits/home_cubit.dart';
import 'package:weight_tracker/modules/home/repositories/home_repository.dart';
import 'package:weight_tracker/modules/weights/cubits/weights_cubit.dart';
import 'package:weight_tracker/modules/weights/repositories/weights_repository.dart';

import 'core/services/local/cache_consumer.dart';
import 'core/services/network/network_info.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // external
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  sl.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<PrettyDioLogger>(
    () => PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true),
  );

  // core
  sl.registerLazySingleton<CacheConsumer>(() => CacheConsumer(sl<SharedPreferences>(), sl<FlutterSecureStorage>()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo(sl<Connectivity>()));
  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl<Dio>(), sl<CacheConsumer>(), sl<PrettyDioLogger>()));

  // Repositories
  sl.registerLazySingleton<SignInRepository>(() => SignInRepository(sl<NetworkInfo>()));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepository(sl<NetworkInfo>()));
  sl.registerLazySingleton<WeightsRepository>(() => WeightsRepository(sl<NetworkInfo>()));

  // Cubits
  sl.registerFactory<SignInCubit>(() => SignInCubit(sl<SignInRepository>()));
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl<HomeRepository>()));
  sl.registerFactory<WeightsCubit>(() => WeightsCubit(sl<WeightsRepository>()));
}
