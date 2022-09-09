import 'package:dartz/dartz.dart';
import 'package:pokedex_clean_arch/core/core.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/entities/entities.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getAllPokemons();
}
