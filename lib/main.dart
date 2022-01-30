// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/social_cubit.dart';

import 'package:social_app/layout/social_layout.dart';
import 'package:social_app/modules/login_cubit/social_login_screen.dart';
import 'package:social_app/network/local/cache_helper.dart';
import 'package:social_app/shared/constants.dart';
import 'package:social_app/style/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () {
      SocialCubit();
    },
  );

  await Firebase.initializeApp();

  await CacheHelper.init();
  Widget? widget;

  uId = CacheHelper.getData(key: 'uId');

  if (uId != null) {
    widget = const SocialLayout();
  } else {
    widget = const SocialLoginScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({
    Key? key,
    required this.startWidget,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SocialCubit()..getUserData()),
      ],
      child: BlocConsumer<SocialCubit, SocialState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: lightTheme,
            debugShowCheckedModeBanner: false,
            home: startWidget,
          );
        },
      ),
    );
  }
}
