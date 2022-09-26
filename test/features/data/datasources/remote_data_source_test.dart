import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_clean_arch/core/core.dart';
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
    final tPokemonModel = [];
    for (var element in tJson['pokemon'] as List) {
      tPokemonModel.add(PokemonModel.fromJson(element));
    }
    test(
      'should return pokemons with the response code is 200',
      () async {
        //arrange
        when(mockDio.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(
            data: fixture('pokemon_model_list.json'),
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
      },
    );

    test(
        'should throw a server exception when the response code is 400 ou other',
        () async {
      //arrange
      when(mockDio.get(any, options: anyNamed('options'))).thenAnswer(
          (_) async => Response(
              statusCode: 404, requestOptions: RequestOptions(path: '')));
      //act
      final result = remoteDataSourceImpl.getAllPokemons();
      //assert
      expect(() => result, throwsA(isInstanceOf<ServerException>()));
    });
  });
}
