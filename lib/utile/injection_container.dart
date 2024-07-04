import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:plants_information/features/home/data/data_sources/plants_remote_data_source.dart';

import '../core/network/network_info.dart';
import '../features/home/data/data_sources/plants_data_source.dart';
import '../features/home/data/repositories/bid_repository_imp.dart';
import '../features/home/domain/repositories/plants_repository.dart';
import '../features/home/domain/use_cases/get_plants_list_use_case.dart';
import '../features/home/presentation/bloc/plants_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Features - Device
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

  ///External
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  ///External
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
