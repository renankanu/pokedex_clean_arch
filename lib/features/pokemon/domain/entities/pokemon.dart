import 'package:equatable/equatable.dart';

import 'next_evolution.dart';

class Pokemon extends Equatable {
  const Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.types,
    required this.height,
    required this.weight,
    required this.weaknesses,
    required this.nextEvolution,
  });
  final int id;
  final String num;
  final String name;
  final String img;
  final List<String> types;
  final String height;
  final String weight;
  final List<String> weaknesses;
  final List<NextEvolution> nextEvolution;

  @override
  List<Object> get props => [
        id,
        num,
        name,
        img,
        types,
        height,
        weight,
        weaknesses,
        nextEvolution,
      ];
}
