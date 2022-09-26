import 'package:pokedex_clean_arch/features/pokemon/domain/entities/entities.dart';

import '../../../../core/constants/urls_constants.dart';

class NextEvolutionModel extends NextEvolution {
  NextEvolutionModel({
    required super.img,
    required super.number,
    required super.name,
  });

  factory NextEvolutionModel.fromJson(Map<String, dynamic> json) {
    return NextEvolutionModel(
      img: Urls.currentImageByNum(json['num']),
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
