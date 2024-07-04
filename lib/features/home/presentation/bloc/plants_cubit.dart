import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_informations/features/home/domain/entities/plants_list_entity.dart';
import 'package:plants_informations/features/home/domain/use_cases/get_plants_list_use_case.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../core/error/failures_msg.dart';

part 'plants_state.dart';

class PlantsCubit extends Cubit<PlantsState> {
  final GetPlantsListUseCase getPlantsListUseCase;

  PlantsListEntity? plants;

  PlantsCubit({
    required this.getPlantsListUseCase,
  }) : super(PlantsInitial());

  static PlantsCubit get(context) => BlocProvider.of(context);

  getPlants() async {
    emit(LoadingPlantsState());
    final failureOrPlants = await getPlantsListUseCase();
    emit(_mapFailureOrPlantsToState(failureOrPlants));
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
        plants = val;
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
