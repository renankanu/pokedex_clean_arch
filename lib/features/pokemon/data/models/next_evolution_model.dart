import 'dart:convert';

import 'package:equatable/equatable.dart';

class NextEvolutionModel extends Equatable {
  final String num;
  final String name;

  const NextEvolutionModel({required this.num, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'num': num,
      'name': name,
    };
  }

  factory NextEvolutionModel.fromMap(Map<String, dynamic> map) {
    return NextEvolutionModel(
      num: map['num'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NextEvolutionModel.fromJson(String source) =>
      NextEvolutionModel.fromMap(json.decode(source));

  @override
  List<Object> get props => [num, name];
}
