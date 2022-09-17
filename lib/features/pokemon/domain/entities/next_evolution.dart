import 'package:equatable/equatable.dart';

class NextEvolution extends Equatable {
  const NextEvolution({
    required this.img,
    required this.num,
    required this.name,
  });
  final String img;
  final String num;
  final String name;

  @override
  List<Object> get props => [
        img,
        num,
        name,
      ];
}
