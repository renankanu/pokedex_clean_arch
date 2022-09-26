import 'package:pokedex_clean_arch/features/pokemon/domain/entities/entities.dart';

import 'next_evolution_model.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required super.id,
    required super.number,
    required super.name,
    required super.img,
    required super.types,
    required super.height,
    required super.weight,
    required super.weaknesses,
    required super.nextEvolution,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      number: json['num'],
      name: json['name'],
      img: json['img'],
      types: json['type'].cast<String>(),
      height: json['height'],
      weight: json['weight'],
      weaknesses: json['weaknesses'].cast<String>(),
      nextEvolution: List<NextEvolutionModel>.from(json['next_evolution'] !=
              null
          ? json['next_evolution'].map((x) => NextEvolutionModel.fromJson(x))
          : []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'num': number,
      'name': name,
      'img': img,
      'type': types,
      'height': height,
      'weight': weight,
      'weaknesses': weaknesses,
      'nextEvolution': nextEvolution
          .map(
            (x) => {
              'num': x.number,
              'name': x.name,
            },
          )
          .toList(),
    };
  }
}
