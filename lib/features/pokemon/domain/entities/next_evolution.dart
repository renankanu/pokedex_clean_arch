import 'package:equatable/equatable.dart';

class NextEvolution extends Equatable {
  const NextEvolution({
    required this.img,
    required this.number,
    required this.name,
  });
  final String img;
  final String number;
  final String name;

  @override
  List<Object> get props => [
        img,
        number,
        name,
      ];
}
