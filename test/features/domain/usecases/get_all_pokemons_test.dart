import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/entities/entities.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/usecases/get_all_pokemons.dart';

import 'get_all_pokemons_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late MockPokemonRepository mockPokemonRepository;
  late GetAllPokemons getAllPokemons;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    getAllPokemons = GetAllPokemons(mockPokemonRepository);
  });

  const pokemons = [
    Pokemon(
      id: 1,
      num: '001',
      name: 'Pokemon',
      img: 'https://www.testepokemon.com.br/',
      types: ['one', 'two'],
      height: '0.71 m',
      weight: '6.9 kg',
      weaknesses: [
        'Fire',
        'Ice',
      ],
      nextEvolution: [
        NextEvolution(
          img: 'https://www.testepokemon.com.br/',
          num: '002',
          name: 'Pokemon 02',
        )
      ],
    )
  ];

  test('should return all pokemons', () async {
    //arrange
    when(mockPokemonRepository.getAllPokemons())
        .thenAnswer((_) async => const Right(pokemons));
    //act
    final result = await getAllPokemons();
    //assert
    expect(result, const Right(pokemons));
  });
}
