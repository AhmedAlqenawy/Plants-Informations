import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:plants_information/features/plants/data/data_sources/plants_remote_data_source.dart';

import '../core/network/network_info.dart';
import '../features/plants/data/data_sources/plants_data_source.dart';
import '../features/plants/data/repositories/bid_repository_imp.dart';
import '../features/plants/domain/repositories/plants_repository.dart';
import '../features/plants/domain/use_cases/get_plants_list_use_case.dart';
import '../features/plants/presentation/bloc/plants_cubit.dart';
import '../features/zone/data/data_sources/zones_data_source.dart';
import '../features/zone/data/data_sources/zones_remote_data_source.dart';
import '../features/zone/data/repositories/zone_repository_imp.dart';
import '../features/zone/domain/repositories/zones_repository.dart';
import '../features/zone/domain/use_cases/get_zones_list_use_case.dart';
import '../features/zone/presentation/bloc/zones_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Features - Plants
  // Bloc
  sl.registerFactory(() => PlantsCubit(getPlantsListUseCase: sl()));

  // UseCases
  sl.registerLazySingleton<GetPlantsListUseCase>(
      () => GetPlantsListUseCase(plantsRepository: sl()));

  //Repository
  sl.registerLazySingleton<PlantsRepository>(
      () => PlantsRepositoryImp(dataSource: sl()));

  //DataSources
  sl.registerLazySingleton<PlantsDataSource>(() => PlantsRemoteDataSourceImp());

  /// Features - Zones
  // Bloc
  sl.registerFactory(() => ZonesCubit(getZonesListUseCase: sl()));

  // UseCases
  sl.registerLazySingleton<GetZonesListUseCase>(
      () => GetZonesListUseCase(zonesRepository: sl()));

  //Repository
  sl.registerLazySingleton<ZonesRepository>(
      () => ZonesRepositoryImp(dataSource: sl()));

  //DataSources
  sl.registerLazySingleton<ZonesDataSource>(() => ZonesRemoteDataSourceImp());

  ///External
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  ///External
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
