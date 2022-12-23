import 'package:equatable/equatable.dart';

class ProductionCountries extends Equatable {
  final String? iso31661;
  final String? name;

  const ProductionCountries({this.iso31661, this.name});

  @override
  List<Object?> get props => [
        iso31661,
        name,
      ];
}
