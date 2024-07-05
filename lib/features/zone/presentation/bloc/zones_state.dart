part of 'zones_cubit.dart';

abstract class ZonesState extends Equatable {
  const ZonesState();
}

class ZonesInitial extends ZonesState {
  @override
  List<Object> get props => [];
}

class RefreshingZonesState extends ZonesState {
  @override
  List<Object> get props => [];
}

class LoadingZonesState extends ZonesState {
  @override
  List<Object?> get props => [];
}

class LoadingMoreZonesState extends ZonesState {
  @override
  List<Object?> get props => [];
}

class LoadedZonesState extends ZonesState {
  const LoadedZonesState();

  @override
  List<Object?> get props => [];
}

class ErrorZonesState extends ZonesState {
  final String message;

  const ErrorZonesState(this.message);

  @override
  List<Object?> get props => [message];
}

class ChangeSelectedZonesState extends ZonesState {
  final String zoneId;

  const ChangeSelectedZonesState(this.zoneId);

  @override
  List<Object?> get props => [zoneId];
}
