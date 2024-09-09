import 'package:dio/src/options.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

@injectable
class ParseError extends ParseErrorLogger {
  @override
  void logError(Object error, StackTrace stackTrace, RequestOptions options) {
    // TODO: implement logError
  }
}
