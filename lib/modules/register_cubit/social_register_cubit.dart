// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/social_user_model.dart';
import 'package:social_app/shared/constants.dart';

part 'social_register_state.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterState> {
  SocialRegisterCubit() : super(SocialRegisterInitial());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String? name,
    required String? email,
    required String? password,
    required String? phone,
  }) {
    emit(SocialRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    )
        .then((value) {
      uId = value.user!.uid;

      userCreate(
        name: name,
        email: email,
        password: password,
        phone: phone,
        uId: value.user!.uid,
      );
    }).catchError((error) {
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String? name,
    required String? email,
    required String? password,
    required String? phone,
    required String? uId,
  }) {
    SocialUserModel model = SocialUserModel(
        name: name,
        email: email,
        password: password,
        phone: phone,
        uId: uId,
        bio: 'write your bio ...',
        image:
            'https://image.freepik.com/free-photo/portrait-bearded-casually-dressed-man-glasses-with-dark-curly-hair_295783-1419.jpg',
        cover:
            'https://image.freepik.com/free-photo/photo-thoughtful-handsome-adult-european-man-holds-chin-looks-pensively-away-tries-solve-problem_273609-45891.jpg',
        isEmailVerified: false);

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(
          model.toMap(),
        )
        .then((value) {
      emit(SocialCreateUserSuccessState());
    }).catchError((error) {
      emit(SocialCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialRegisterChangePasswordVisibilityState());
  }
}
