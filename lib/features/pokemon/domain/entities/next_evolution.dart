import 'package:equatable/equatable.dart';

class NextEvolution extends Equatable {
  final String img;
  final String num;
  final String name;

  const NextEvolution({
    required this.img,
    required this.num,
    required this.name,
  });

  @override
  List<Object> get props => [img, num, name];
}
