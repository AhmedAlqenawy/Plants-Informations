import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_information/features/plants/domain/entities/plants_list_entity.dart';
import 'package:plants_information/features/plants/domain/use_cases/get_plants_list_use_case.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../core/error/failures_msg.dart';

part 'plants_state.dart';

class PlantsCubit extends Cubit<PlantsState> {
  final GetPlantsListUseCase getPlantsListUseCase;

  PlantsListEntity? plants;
  int currentIndex = 1;
  String zoneId = "";

  PlantsCubit({
    required this.getPlantsListUseCase,
  }) : super(PlantsInitial());

  static PlantsCubit get(context) => BlocProvider.of(context);

  getPlants() async {
    emit(LoadingPlantsState());
    final failureOrPlants = await getPlantsListUseCase(currentIndex, zoneId);
    emit(_mapFailureOrPlantsToState(failureOrPlants));
  }

  changeZones(String zone) async {
     zoneId = zone;
    currentIndex = 1;
    plants=null;
    emit(LoadingPlantsState());
    final failureOrPlants = await getPlantsListUseCase(currentIndex, zoneId);
    emit(_mapFailureOrPlantsToState(failureOrPlants));
  }

  getMorePlants() async {
    int totalIndex=(plants!.meta!.total!/20).ceil();

    if(currentIndex<totalIndex){
      emit(LoadingMorePlantsState());
      final failureOrPlants =
          await getPlantsListUseCase(currentIndex + 1, zoneId);
      emit(_mapFailureOrPlantsToState(failureOrPlants));
    }
  }

  refreshPlants() async {
    plants = null;
    emit(RefreshingPlantsState());
  }

  PlantsState _mapFailureOrPlantsToState(
      Either<Failure, PlantsListEntity> either) {
    return either.fold(
      (failure) => ErrorPlantsState(_mapFailureToMessage(failure)),
      (val) {
        if (plants == null) {
          plants = val;
        } else {
          plants!.data!.addAll(val.data!);
        }
        currentIndex++;
        return const LoadedPlantsState();
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return serverFailureMassage;
      case EmptyCacheFailure _:
        return emptyFailureMassage;
      case OfflineFailure _:
        return offlineFailureMassage;

      default:
        return "Unexpected Error , Please try again later";
    }
  }
}
