import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_clean_arch/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_clean_arch/features/pokemon/presentation/controller/home_controller.dart';

import '../../../../core/images.dart';
import '../../../../core/models/type_pokemon.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.hasError) {
            return Container();
          }
          if (controller.isLoading) {
            return CircularProgressIndicator();
          }
          return Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: kToolbarHeight),
                child: Text('Pokédex'),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  itemCount: controller.pokemons.length,
                  itemBuilder: (BuildContext context, int index) {
                    final pokemon = controller.pokemons[index];
                    return ItemPokemon(pokemon: pokemon);
                  },
                ),
              ),
            ],
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
        color: _getColorByType(pokemon.types[0]).pokemonColor,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(_getColorByType(pokemon.types[0]).pathIcon),
          Column(
            children: [
              Text('#${pokemon.number}'),
              Text(pokemon.name),
            ],
          ),
          CachedNetworkImage(
            imageUrl: pokemon.img,
            height: 100,
            placeholder: (_, __) => Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  Colors.white,
                ),
                strokeWidth: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  TypePokemon _getColorByType(String type) {
    switch (type) {
      case 'Normal':
        return TypePokemon(
          pokemonColor: Color(0xFF9B9BA3),
          pathIcon: AppImages.icNormal,
        );
      case 'Fire':
        return TypePokemon(
          pokemonColor: Color(0xFFFF8713),
          pathIcon: AppImages.icFire,
        );
      case 'Water':
        return TypePokemon(
          pokemonColor: Color(0xFF68B5E5),
          pathIcon: AppImages.icWater,
        );
      case 'Grass':
        return TypePokemon(
          pokemonColor: Color(0xFF34C677),
          pathIcon: AppImages.icPlant,
        );
      case 'Electric':
        return TypePokemon(
          pokemonColor: Color(0xFFFFC700),
          pathIcon: AppImages.icElectric,
        );
      case 'Ice':
        return TypePokemon(
          pokemonColor: Color(0xFF77D3C3),
          pathIcon: AppImages.icIce,
        );
      case 'Fighting':
        return TypePokemon(
          pokemonColor: Color(0xFFE80011),
          pathIcon: AppImages.icFighter,
        );
      case 'Poison':
        return TypePokemon(
          pokemonColor: Color(0xFFC645E1),
          pathIcon: AppImages.icPoisonous,
        );
      case 'Ground':
        return TypePokemon(
          pokemonColor: Color(0xFFD17F46),
          pathIcon: AppImages.icTerrestrial,
        );
      case 'Flying':
        return TypePokemon(
          pokemonColor: Color(0xFF9FB9EB),
          pathIcon: AppImages.icFlying,
        );
      case 'Psychic':
        return TypePokemon(
          pokemonColor: Color(0xFFFE7571),
          pathIcon: AppImages.icPsychic,
        );
      case 'Bug':
        return TypePokemon(
          pokemonColor: Color(0xFFA2C629),
          pathIcon: AppImages.icInsect,
        );
      case 'Rock':
        return TypePokemon(
          pokemonColor: Color(0xFFD4AD30),
          pathIcon: AppImages.icStone,
        );
      case 'Ghost':
        return TypePokemon(
          pokemonColor: Color(0xFF7272D2),
          pathIcon: AppImages.icGhost,
        );
      case 'Dark':
        return TypePokemon(
          pokemonColor: Color(0xFF5D5F6A),
          pathIcon: AppImages.icNocturnal,
        );
      case 'Dragon':
        return TypePokemon(
          pokemonColor: Color(0xFF0A6DCA),
          pathIcon: AppImages.icDragon,
        );
      case 'Steel':
        return TypePokemon(
          pokemonColor: Color(0xFF5AA7AA),
          pathIcon: AppImages.icSteel,
        );
      case 'Fairy':
        return TypePokemon(
          pokemonColor: Color(0xFFF29FE5),
          pathIcon: AppImages.icFairy,
        );
      default:
        return TypePokemon(
          pokemonColor: Color(0xFF9B9BA3),
          pathIcon: AppImages.icNormal,
        );
    }
  }
}
