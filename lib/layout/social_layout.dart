// ignore_for_file: unnecessary_null_comparison

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/cubit/social_cubit.dart';
import 'package:social_app/modules/new_post/post_screen.dart';
import 'package:social_app/shared/components.dart';
import 'package:social_app/style/icon_broken.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {
        if (state is SocialNewPostState) {
          navigateTo(context, const NewPostScreen());
        }
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconBroken.Notification,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconBroken.Search,
                  )),
            ],
            title: Text(
              cubit.titles[cubit.currentindex],
            ),
          ),
          body: cubit.screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentindex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              const BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    IconBroken.Home,
                  )),
              const BottomNavigationBarItem(
                  label: 'Chats',
                  icon: Icon(
                    IconBroken.Chat,
                  )),
              const BottomNavigationBarItem(
                  label: 'Post',
                  icon: Icon(
                    IconBroken.Paper_Upload,
                  )),
              const BottomNavigationBarItem(
                  label: 'Users',
                  icon: Icon(
                    IconBroken.Location,
                  )),
              const BottomNavigationBarItem(
                  label: 'Settings',
                  icon: Icon(
                    IconBroken.Setting,
                  )),
            ],
          ),
        );
      },
    );
  }
}
