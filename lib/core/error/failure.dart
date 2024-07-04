import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class OfflineFailure extends Failure {
  const OfflineFailure(super.message);

}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure(super.message);

}

class CacheFailure extends Failure {
  const CacheFailure(super.message);

}

class LocationPermissionDeniedFailure extends Failure {
  const LocationPermissionDeniedFailure(super.message);

}

class LocationServiceFailure extends Failure {
  const LocationServiceFailure(super.message);

}
