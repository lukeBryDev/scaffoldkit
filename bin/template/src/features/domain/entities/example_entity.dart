import 'package:equatable/equatable.dart';

class ExampleEntity extends Equatable {
  final int? id;
  final String? name;

  const ExampleEntity({this.id, this.name});

  @override
  List<Object?> get props => [id, name];
}
