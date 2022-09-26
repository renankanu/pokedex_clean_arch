import 'package:pokedex_clean_arch/features/pokemon/domain/entities/entities.dart';

class NextEvolutionModel extends NextEvolution {
  NextEvolutionModel({
    required super.img,
    required super.number,
    required super.name,
  });

  factory NextEvolutionModel.fromJson(Map<String, dynamic> json) {
    return NextEvolutionModel(
      img: '',
      number: json['num'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'num': number,
      'name': name,
    };
  }
}
