import 'package:cleancode/modulos/search/domain/entities/result_search.dart';
import 'package:cleancode/modulos/search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<FailureResults, List<ResultSearch>>> search(String searchText);
}
