import 'package:cleancode/modulos/search/domain/entities/result_search.dart';
import 'package:cleancode/modulos/search/domain/errors/errors.dart';
import 'package:cleancode/modulos/search/domain/repositories/search_repository.dart';
import 'package:cleancode/modulos/search/domain/usecases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {
  @override
  Future<Either<FailureResults, List<ResultSearch>>> search(String searchText) {
    // TODO: implement search
    throw UnimplementedError();
  }
}

main() {
  final repository = SearchRepositoryMock();

  final useCase = SearchByTextImpl(repository);
  test('must return a list of ResultSearch', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    var result = await useCase(null);
    expect(result.fold(id, id), isA<InvalidTextError>());
    result = await useCase("");
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
