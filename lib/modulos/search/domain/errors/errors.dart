abstract class FailureResults implements Exception {}

class InvalidTextError implements FailureResults {}

class DataSourceError implements FailureResults {
  final String message;

  DataSourceError({this.message});
}
