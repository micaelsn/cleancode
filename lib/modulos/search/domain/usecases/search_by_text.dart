import 'package:cleancode/modulos/search/domain/entities/result_search.dart';
import 'package:cleancode/modulos/search/domain/errors/errors.dart';
import 'package:cleancode/modulos/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SearchByText {
  Future<Either<FailureResults, List<ResultSearch>>> call(String searchtext);
}

//sempre denpender de uma interface
class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<FailureResults, List<ResultSearch>>> call(
      String searchText) async {
    if (searchText == null || searchText.isEmpty) {
      return Left(InvalidTextError());
    }
    return repository.search(searchText);
  }
}
