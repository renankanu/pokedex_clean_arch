import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/datasources/remote_data_source.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/models/next_evolution_model.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/entities/pokemon.dart';

import 'pokemon_repository_impl_test.mocks.dart';

@GenerateMocks([RemoteDataSource])
void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late PokemonRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = PokemonRepositoryImpl(mockRemoteDataSource);
  });

  group('get all pokemons', () {
    final tPokemonModel = [
      const PokemonModel(
        id: 1,
        num: '001',
        name: 'Bulbasaur',
        img: 'http://www.serebii.net/pokemongo/pokemon/001.png',
        type: ['Grass', 'Poison'],
        height: '0.71 m',
        weight: '6.9 kg',
        weaknesses: ['Fire', 'Ice', 'Flying', 'Psychic'],
        nextEvolution: [
          NextEvolutionModel(
            num: '002',
            name: 'Ivysaur',
          ),
          NextEvolutionModel(
            num: '003',
            name: 'Venusaur',
          )
        ],
      )
    ];

    final List<Pokemon> tPokemon = [];
    for (var pokemon in tPokemonModel) {
      tPokemon.add(pokemon.toEntity());
    }
    test('should return all pokemons', () async {
      //arrange
      when(mockRemoteDataSource.getAllPokemons())
          .thenAnswer((_) async => tPokemonModel);
      //act
      final result = await repository.getAllPokemons();
      //assert
      verify(mockRemoteDataSource.getAllPokemons());
      expect(result, equals(Right(tPokemon)));
    });
    //act
  });
}
