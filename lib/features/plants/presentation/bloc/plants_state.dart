part of 'plants_cubit.dart';

abstract class PlantsState extends Equatable {
  const PlantsState();
}

class PlantsInitial extends PlantsState {
  @override
  List<Object> get props => [];
}

class RefreshingPlantsState extends PlantsState {
  @override
  List<Object> get props => [];
}

class LoadingPlantsState extends PlantsState {
  @override
  List<Object?> get props => [];
}

class LoadingMorePlantsState extends PlantsState {
  @override
  List<Object?> get props => [];
}

class LoadedPlantsState extends PlantsState {
  const LoadedPlantsState();

  @override
  List<Object?> get props => [];
}

class ErrorPlantsState extends PlantsState {
  final String message;

  const ErrorPlantsState(this.message);

  @override
  List<Object?> get props => [message];
}
