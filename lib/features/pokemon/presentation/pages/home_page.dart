import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            itemCount: controller.pokemons.length,
            itemBuilder: (BuildContext context, int index) {
              final pokemon = controller.pokemons[index];
              return Container(
                child: Text(pokemon.name),
              );
            },
          );
        },
      ),
    );
  }
}
