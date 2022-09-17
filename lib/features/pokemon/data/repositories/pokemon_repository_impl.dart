import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:pokedex_clean_arch/core/errors/failure.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/repositories/pokemon_repository.dart';

import '../../../../core/errors/exception.dart';
import '../datasources/remote_data_source.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(this.remoteDataSource);
  final RemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<Pokemon>>> getAllPokemons() async {
    try {
      final result = await remoteDataSource.getAllPokemons();
      final List<Pokemon> listPokemon = [];
      for (var pokemonModel in result) {
        listPokemon.add(pokemonModel.toEntity());
      }
      return Right(listPokemon);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
