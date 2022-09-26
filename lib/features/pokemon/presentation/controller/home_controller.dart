import 'package:get/get.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/entities/entities.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/usecases/get_all_pokemons.dart';

class HomeController extends GetxController with StateMixin<Pokemon> {
  HomeController({required this.getAllPokemons});

  final GetAllPokemons getAllPokemons;

  RxList<Pokemon> pokemons = <Pokemon>[].obs;

  @override
  void onInit() {
    _getAllPokemons();
    super.onInit();
  }

  void _getAllPokemons() async {
    final result = await getAllPokemons.call();
    result.fold((l) => change(null, status: RxStatus.error(l.message)),
        (r) => pokemons.assignAll(r));
  }
}
