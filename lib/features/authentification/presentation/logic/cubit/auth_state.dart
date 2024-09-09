// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

@immutable
abstract class AuthState {}

class IsNewUser extends AuthState {}

class ResetPasswordSent extends AuthState {}

class UserNotVerified extends AuthState {}

class UserSignedOut extends AuthState {}

class UserSignIn extends AuthState {}

class UserSingUpAndLinkedWithGoogle extends AuthState {}

class UserSingUpButNotVerified extends AuthState {}
