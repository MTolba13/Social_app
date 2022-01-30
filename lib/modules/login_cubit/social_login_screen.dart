import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:social_app/layout/social_layout.dart';
import 'package:social_app/modules/login_cubit/social_login_cubit.dart';
import 'package:social_app/modules/register_cubit/register_screen.dart';
import 'package:social_app/network/local/cache_helper.dart';
import 'package:social_app/shared/components.dart';

var formKey = GlobalKey<FormState>();

class SocialLoginScreen extends StatelessWidget {
  const SocialLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginState>(
        listener: (context, state) {
          if (state is SocialLoginErrorState) {
            showToast(
              text: state.error,
            );
          }
          if (state is SocialLoginSuccessState) {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value) {
              navigateAndFinish(context, const SocialLayout());
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'login now to communicate with friends',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          isPassword: true,
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          label: 'Password ',
                          prefix: Icons.lock_outline_rounded,
                          suffixPressed: () {
                            SocialLoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          onSumbit: (value) {
                            if (formKey.currentState!.validate()) {
                              SocialLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          suffix: SocialLoginCubit.get(context).suffix,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'please enter your Password';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ConditionalBuilder(
                          builder: (context) => MaterialButton(
                            textColor: Colors.white,
                            elevation: 5,
                            focusElevation: 10,
                            color: HexColor('E1095B'),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                SocialLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            child: const Text('LOGIN'),
                          ),
                          condition: true,
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            navigateTo(
                              context,
                              const RegisterScreen(),
                            );
                          },
                          child: const Text(
                            'Register Now',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
