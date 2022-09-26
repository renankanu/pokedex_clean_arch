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
        color: _getColorByType(pokemon.types[0]),
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
      child: Column(
        children: [
          Image.network(
            'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${pokemon.number}.png',
            height: 100,
          ),
          Text(pokemon.name),
        ],
      ),
    );
  }

  _getColorByType(String type) {
    switch (type) {
      case 'Normal':
        return Color(0xFF9B9BA3);
      case 'Fire':
        return Color(0xFFFF8713);
      case 'Water':
        return Color(0xFF68B5E5);
      case 'Grass':
        return Color(0xFF34C677);
      case 'Electric':
        return Color(0xFFFFC700);
      case 'Ice':
        return Color(0xFF77D3C3);
      case 'Fighting':
        return Color(0xFFE80011);
      case 'Poison':
        return Color(0xFFC645E1);
      case 'Ground':
        return Color(0xFFD17F46);
      case 'Flying':
        return Color(0xFF9FB9EB);
      case 'Psychic':
        return Color(0xFFFE7571);
      case 'Bug':
        return Color(0xFFA2C629);
      case 'Rock':
        return Color(0xFFD4AD30);
      case 'Ghost':
        return Color(0xFF7272D2);
      case 'Dark':
        return Color(0xFF5D5F6A);
      case 'Dragon':
        return Color(0xFF0A6DCA);
      case 'Steel':
        return Color(0xFF5AA7AA);
      case 'Fairy':
        return Color(0xFFF29FE5);
      default:
        return Color(0xFF9B9BA3);
    }
  }
}
