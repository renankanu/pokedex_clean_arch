import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/models/next_evolution_model.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tNextEvolutionModel = NextEvolutionModel(
    img:
        'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/002.png',
    number: '002',
    name: 'Ivysaur',
  );

  group('fromJson', () {
    test('should return a valid model fromJson', () {
      //act
      final result = NextEvolutionModel.fromJson(
          json.decode(fixture('next_evolution_model.json')));
      //assert
      expect(result, equals(tNextEvolutionModel));
    });
  });

  group('toJson', () {
    test('should return a json map containing proper data', () {
      //act
      final result = tNextEvolutionModel.toJson();
      //assert
      final expectedJsonModel = {
        "num": "002",
        "name": "Ivysaur",
      };
      expect(result, equals(expectedJsonModel));
    });
  });
}
