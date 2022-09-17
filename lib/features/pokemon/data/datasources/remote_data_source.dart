import 'package:dio/dio.dart';
import 'package:pokedex_clean_arch/core/core.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/models/pokemon_model.dart';

abstract class RemoteDataSource {
  Future<List<PokemonModel>> getAllPokemons();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl(this.dioClient);
  final Dio dioClient;

  @override
  Future<List<PokemonModel>> getAllPokemons() async {
    final response = await dioClient.get(Urls.baseUrl);

    if (response.statusCode == 200) {
      return (response.data as List).map((pokemon) {
        return PokemonModel.fromJson(pokemon);
      }).toList();
    } else {
      throw ServerException();
    }
  }
}
