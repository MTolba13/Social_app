part of 'social_login_cubit.dart';

@immutable
abstract class SocialLoginState {}

class SocialLoginInitial extends SocialLoginState {}

class SocialLoginLoadingState extends SocialLoginState {}

class SocialLoginSuccessState extends SocialLoginState {
  final String uId;

  SocialLoginSuccessState(this.uId);
}

class SocialLoginErrorState extends SocialLoginState {
  final String error;
  SocialLoginErrorState(this.error);
}

class SocialChangePasswordVisibilityState extends SocialLoginState {}
