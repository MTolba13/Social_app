// ignore_for_file: file_names

part of 'social_register_cubit.dart';

abstract class SocialRegisterState {}

class SocialRegisterInitial extends SocialRegisterState {}

class SocialRegisterLoadingState extends SocialRegisterState {}

class SocialRegisterSuccessState extends SocialRegisterState {}

class SocialRegisterErrorState extends SocialRegisterState {
  final String error;
  SocialRegisterErrorState(this.error);
}

class SocialCreateUserSuccessState extends SocialRegisterState {}

class SocialCreateUserErrorState extends SocialRegisterState {
  final String error;
  SocialCreateUserErrorState(this.error);
}

class SocialRegisterChangePasswordVisibilityState extends SocialRegisterState {}
