import 'package:dartz/dartz.dart';
import 'package:pokedex_clean_arch/core/errors/failure.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/entities/entities.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/repositories/pokemon_repository.dart';

class GetAllPokemons {
  final PokemonRepository pokemonRepository;

  GetAllPokemons(this.pokemonRepository);

  Future<Either<Failure, List<Pokemon>>> call() async {
    return await pokemonRepository.getAllPokemons();
  }
}
