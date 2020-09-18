import 'package:cleancode/modulos/search/data/datasource/search_datasourch.dart';
import 'package:cleancode/modulos/search/data/model/result_search_model.dart';
import 'package:cleancode/modulos/search/data/repositories/search_repository_impl.dart';
import 'package:cleancode/modulos/search/domain/entities/result_search.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDataSourceMock extends Mock implements SearchDataSource {}

main() {
  final datasource = SearchDataSourceMock();
  final repository = SearchRepositoryImpl(datasource);
  test("teste repositorio", () async {
    when(datasource.getSearch(any))
        .thenAnswer((realInvocation) async => <ResultSearchModel>[]);
    final result = await repository.search('searchText');

    expect(result | null, isA<List<ResultSearch>>());
  });
}
