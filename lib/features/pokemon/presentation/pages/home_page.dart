import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_clean_arch/features/pokemon/presentation/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Obx(
        () {
          if (controller.hasError) {
            return Container();
          }
          if (controller.isLoading) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12),
            itemCount: controller.pokemons.length,
            itemBuilder: (BuildContext context, int index) {
              final pokemon = controller.pokemons[index];
              return ItemPokemon(pokemon: pokemon);
            },
          );
        },
      ),
    );
  }
}

class ItemPokemon extends StatelessWidget {
  const ItemPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.3),
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Text(pokemon.name),
    );
  }
}
