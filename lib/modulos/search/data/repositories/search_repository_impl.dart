import 'package:cleancode/modulos/search/data/datasource/search_datasourch.dart';
import 'package:cleancode/modulos/search/domain/errors/errors.dart';
import 'package:cleancode/modulos/search/domain/entities/result_search.dart';
import 'package:cleancode/modulos/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource dataSource;

  SearchRepositoryImpl(this.dataSource);

  @override
  Future<Either<FailureResults, List<ResultSearch>>> search(
      String searchText) async {
    try {
      final result = await dataSource.getSearch(searchText);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
