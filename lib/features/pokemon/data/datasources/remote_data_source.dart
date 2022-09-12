import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokedex_clean_arch/core/core.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/models/pokemon_model.dart';

abstract class RemoteDataSource {
  Future<List<PokemonModel>> getAllPokemons();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dioClient;

  RemoteDataSourceImpl(this.dioClient);

  @override
  Future<List<PokemonModel>> getAllPokemons() async {
    final response = await dioClient.get(Urls.baseUrl);
    if (response.statusCode == 200) {
      final listPokemonData = (response.data as List).map((pokemon) {
        log(pokemon.toString());
        return PokemonModel.fromJson(pokemon);
      }).toList();
      return listPokemonData;
    } else {
      throw ServerException();
    }
  }
}
