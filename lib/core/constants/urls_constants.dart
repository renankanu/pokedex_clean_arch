class Urls {
  static const String baseUrl =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  static String currentImageByNum(String pokemonNum) =>
      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$pokemonNum.png';
}
