import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/datasources/remote_data_source.dart';
import 'package:pokedex_clean_arch/features/pokemon/data/repositories/pokemon_repository_impl.dart';

import 'pokemon_repository_impl.mocks.dart';

@GenerateMocks([RemoteDataSource])
void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late PokemonRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = PokemonRepositoryImpl(mockRemoteDataSource);
  });
}
