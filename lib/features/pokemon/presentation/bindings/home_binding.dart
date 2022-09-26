import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/datasources/remote_data_source.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/usecases/get_all_pokemons.dart';
import 'package:pokedex_clean_arch/features/pokemon/presentation/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => RemoteDataSourceImpl(Get.find()));
    Get.lazyPut(() => PokemonRepositoryImpl(Get.find<RemoteDataSourceImpl>()));
    Get.lazyPut(() => GetAllPokemons(Get.find<PokemonRepositoryImpl>()));
    Get.lazyPut(() => HomeController(getAllPokemons: Get.find()));
  }
}
