import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/datasources/remote_data_source.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/models/pokemon_model.dart';

import '../../../fixtures/fixture_reader.dart';
import 'remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late RemoteDataSourceImpl remoteDataSourceImpl;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    remoteDataSourceImpl = RemoteDataSourceImpl(mockDio);
  });

  group('get all pokemons', () {
    final dynamic tJson = json.decode(fixture('pokemon_model_list.json'));
    final tPokemonModel =
        (tJson as List).map((pokemon) => PokemonModel.fromJson(pokemon));
    test('should return pokemons with the response code is 200', () async {
      //arrange
      when(mockDio.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(
          data: tJson,
          statusCode: 200,
          requestOptions: RequestOptions(
            path: '',
          ),
        ),
      );
      //act
      final result = await remoteDataSourceImpl.getAllPokemons();
      //assert
      expect(result, equals(tPokemonModel));
    });
  });
}
