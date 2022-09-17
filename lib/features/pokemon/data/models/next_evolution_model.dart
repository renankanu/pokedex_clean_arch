import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/entities/entities.dart';

class NextEvolutionModel extends Equatable {
  factory NextEvolutionModel.fromJson(String source) =>
      NextEvolutionModel.fromMap(json.decode(source));

  factory NextEvolutionModel.fromMap(Map<String, dynamic> map) {
    return NextEvolutionModel(
      num: map['num'] ?? '',
      name: map['name'] ?? '',
    );
  }

  const NextEvolutionModel({required this.num, required this.name});
  final String num;
  final String name;

  Map<String, dynamic> toMap() {
    return {
      'num': num,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());

  NextEvolution toEntity() => NextEvolution(
        num: num,
        name: name,
        img: '',
      );

  @override
  List<Object> get props => [
        num,
        name,
      ];
}
