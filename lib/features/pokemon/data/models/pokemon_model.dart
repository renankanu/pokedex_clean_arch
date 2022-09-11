import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/models/next_evolution_model.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/entities/entities.dart';

class PokemonModel extends Equatable {
  final int id;
  final String num;
  final String name;
  final String img;
  final List<String> type;
  final String height;
  final String weight;
  final List<String> weaknesses;
  final List<NextEvolutionModel> nextEvolution;

  const PokemonModel({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.weaknesses,
    required this.nextEvolution,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'num': num,
      'name': name,
      'img': img,
      'types': type,
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
      type: List<String>.from(map['type']),
      height: map['height'] ?? '',
      weight: map['weight'] ?? '',
      weaknesses: List<String>.from(map['weaknesses']),
      nextEvolution: List<NextEvolutionModel>.from(
          map['next_evolution']?.map((x) => NextEvolutionModel.fromMap(x))),
    );
  }

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));

  Pokemon toEntity() => Pokemon(
        id: id,
        num: num,
        name: name,
        img: img,
        types: type,
        height: height,
        weight: weight,
        weaknesses: weaknesses,
        nextEvolution:
            List<NextEvolution>.from(nextEvolution.map((x) => x.toEntity())),
      );

  @override
  List<Object> get props {
    return [
      id,
      num,
      name,
      img,
      type,
      height,
      weight,
      weaknesses,
      nextEvolution,
    ];
  }
}
