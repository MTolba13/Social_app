part of 'social_cubit.dart';

@immutable
abstract class SocialState {}

class SocialInitial extends SocialState {}

class SocialGetUserLoadingState extends SocialState {}

class SocialGetUserSuccessState extends SocialState {}

class SocialGetUserErrorState extends SocialState {
  final String error;

  SocialGetUserErrorState(this.error);
}

class SocialChangeBottomNavState extends SocialState {}

class SocialNewPostState extends SocialState {}

class SocialProfileImagePickedSuccessState extends SocialState {}

class SocialProfileImagePickedErrorState extends SocialState {}

class SocialCoverImagePickedSuccessState extends SocialState {}

class SocialCoverImagePickedErrorState extends SocialState {}

class SocialUploadProfileImageSuccessState extends SocialState {}

class SocialUploadProfileImageErrorState extends SocialState {}

class SocialUploadCoverImageSuccessState extends SocialState {}

class SocialUploadCoverImageErrorState extends SocialState {}

class SocialUserUpdateLoadingState extends SocialState {}

class SocialUserUpdateErrorState extends SocialState {}
