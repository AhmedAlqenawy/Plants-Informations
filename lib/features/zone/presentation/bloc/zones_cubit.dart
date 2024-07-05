import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../core/error/failures_msg.dart';
import '../../domain/entities/zones_list_entity.dart';
import '../../domain/use_cases/get_zones_list_use_case.dart';

part 'zones_state.dart';

class ZonesCubit extends Cubit<ZonesState> {
  final GetZonesListUseCase getZonesListUseCase;

  ZonesListEntity? zones;
  int currentIndex = 1;

  String selectZone="";
  ZonesCubit({
    required this.getZonesListUseCase,
  }) : super(ZonesInitial());

  static ZonesCubit get(context) => BlocProvider.of(context);

  getZones() async {
    emit(LoadingZonesState());
    final failureOrZones = await getZonesListUseCase(currentIndex);
    emit(_mapFailureOrZonesToState(failureOrZones));
  }


  changeZones(zone){
    selectZone=zone;
    emit(ChangeSelectedZonesState(zone));
  }

  getMoreZones() async {
    int totalIndex=(zones!.meta!.total!/20).ceil();

    if(currentIndex<totalIndex){
      emit(LoadingMoreZonesState());
      final failureOrZones = await getZonesListUseCase(currentIndex + 1);
      emit(_mapFailureOrZonesToState(failureOrZones));
    }
  }

  refreshZones() async {
    zones = null;
    emit(RefreshingZonesState());
  }

  ZonesState _mapFailureOrZonesToState(
      Either<Failure, ZonesListEntity> either) {
    return either.fold(
      (failure) => ErrorZonesState(_mapFailureToMessage(failure)),
      (val) {
        if (zones == null) {
          zones = val;
        } else {
          zones!.data!.addAll(val.data!);
        }
        currentIndex++;
        return const LoadedZonesState();
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
