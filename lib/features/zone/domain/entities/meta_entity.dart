import 'package:equatable/equatable.dart';

class MetaEntity extends Equatable {
  final int? total;

  const MetaEntity(
    this.total,
  );

  @override
  List<Object?> get props => [
        total,
      ];
}
