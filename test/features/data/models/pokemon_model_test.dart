import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/models/next_evolution_model.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/models/pokemon_model.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tPokemonModel = PokemonModel(
    id: 1,
    number: '001',
    name: 'Bulbasaur',
    img: 'http://www.serebii.net/pokemongo/pokemon/001.png',
    types: ['Grass', 'Poison'],
    height: '0.71 m',
    weight: '6.9 kg',
    weaknesses: ['Fire', 'Ice', 'Flying', 'Psychic'],
    nextEvolution: [
      NextEvolutionModel(
        img: '',
        number: '002',
        name: 'Ivysaur',
      ),
      NextEvolutionModel(
        img: '',
        number: '003',
        name: 'Venusaur',
      )
    ],
  );

  group('fromJson', () {
    test('should return a valid model fromJson', () {
      //act
      final result =
          PokemonModel.fromJson(json.decode(fixture('pokemon_model.json')));
      //assert
      expect(result, equals(tPokemonModel));
    });
  });

  group('toJson', () {
    test('should return a json map containing proper data', () {
      //act
      final result = tPokemonModel.toJson();
      //assert
      final expectedJsonModel = {
        "id": 1,
        "num": "001",
        "name": "Bulbasaur",
        "img": "http://www.serebii.net/pokemongo/pokemon/001.png",
        "type": ["Grass", "Poison"],
        "height": "0.71 m",
        "weight": "6.9 kg",
        "weaknesses": ["Fire", "Ice", "Flying", "Psychic"],
        "nextEvolution": [
          {"num": "002", "name": "Ivysaur"},
          {"num": "003", "name": "Venusaur"}
        ]
      };
      expect(result, equals(expectedJsonModel));
    });
  });
}
