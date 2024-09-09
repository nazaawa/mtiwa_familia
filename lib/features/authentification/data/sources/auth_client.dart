import "package:dio/dio.dart";
import "package:injectable/injectable.dart";
import "package:mtiwa_familia/core/helpers/parse_error.dart";
import "package:mtiwa_familia/features/authentification/domain/models/auth_response.dart";
import "package:retrofit/error_logger.dart";
import "package:retrofit/http.dart";

part 'auth_client.g.dart';

@injectable
@RestApi()
abstract class AuthClient {
  @factoryMethod
  factory AuthClient(Dio dio, ParseError? errorLogger) = _AuthClient;

  @POST("/signup")
  Future<AuthResponse> register(
    @Field("name") String name,
    @Field("email") String email,
    @Field("password") String password,
    @Field("country") int country,
    @Field("password_confirmation") String passwordConfirmation,
  );

  @POST("/login")
  Future<AuthResponse> login(
    @Field("email") String mailconnect,
    @Field("password") String password,
  );
}
