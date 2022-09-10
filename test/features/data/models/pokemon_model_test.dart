import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/models/next_evolution_model.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/entities/entities.dart';

void main() {
  const tPokemonModel = PokemonModel(
    id: 1,
    num: '001',
    name: 'Pokemon',
    img: 'https://www.pokemonimg.com/img',
    types: ['fire'],
    height: '0.71 m',
    weight: '6.9 kg',
    weaknesses: [
      'Fire',
      'Ice',
    ],
    nextEvolution: [
      NextEvolutionModel(
        num: '002',
        name: 'Pokemon 02',
      )
    ],
  );

  const tPokemon = Pokemon(
    id: 1,
    num: '001',
    name: 'Pokemon',
    img: 'https://www.pokemonimg.com/img',
    types: ['fire'],
    height: '0.71 m',
    weight: '6.9 kg',
    weaknesses: [
      'Fire',
      'Ice',
    ],
    nextEvolution: [
      NextEvolution(
        img: '',
        num: '002',
        name: 'Pokemon 02',
      )
    ],
  );

  group('to entity', () {
    test('should return a Pokemon entity', () {
      //act
      final result = tPokemonModel.toEntity();
      //assert
      expect(result, tPokemon);
    });
  });
}
