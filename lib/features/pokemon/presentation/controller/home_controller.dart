import 'package:get/get.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/entities/entities.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/usecases/get_all_pokemons.dart';

class HomeController extends GetxController {
  HomeController({required this.getAllPokemons});

  final GetAllPokemons getAllPokemons;

  final RxList<Pokemon> _pokemons = RxList.empty();
  final RxBool _isLoading = RxBool(false);
  final RxBool _hasError = RxBool(false);

  List<Pokemon> get pokemons => _pokemons.toList();
  bool get isLoading => _isLoading.value;
  bool get hasError => _hasError.value;

  @override
  void onInit() {
    _getAllPokemons();
    super.onInit();
  }

  void _getAllPokemons() async {
    final result = await getAllPokemons.call();
    result.fold(
      (_) => _hasError.value = true,
      (pokemons) => _pokemons.assignAll(pokemons),
    );
  }
}
