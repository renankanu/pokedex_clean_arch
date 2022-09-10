import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/models/next_evolution_model.dart';

class PokemonModel extends Equatable {
  final int id;
  final String num;
  final String name;
  final String img;
  final List<String> types;
  final String height;
  final String weight;
  final List<String> weaknesses;
  final List<NextEvolutionModel> nextEvolution;

  const PokemonModel({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.types,
    required this.height,
    required this.weight,
    required this.weaknesses,
    required this.nextEvolution,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'num': num,
      'name': name,
      'img': img,
      'types': types,
      'height': height,
      'weight': weight,
      'weaknesses': weaknesses,
      'nextEvolution': nextEvolution.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id']?.toInt() ?? 0,
      num: map['num'] ?? '',
      name: map['name'] ?? '',
      img: map['img'] ?? '',
      types: List<String>.from(map['types']),
      height: map['height'] ?? '',
      weight: map['weight'] ?? '',
      weaknesses: List<String>.from(map['weaknesses']),
      nextEvolution: List<NextEvolutionModel>.from(
          map['nextEvolution']?.map((x) => NextEvolutionModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));

  @override
  List<Object> get props {
    return [
      id,
      num,
      name,
      img,
      types,
      height,
      weight,
      weaknesses,
      nextEvolution,
    ];
  }
}
