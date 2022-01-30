// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/social_cubit.dart';
import 'package:social_app/shared/components.dart';
import 'package:social_app/style/icon_broken.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var bioController = TextEditingController();
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialCubit.get(context).userModel;
        nameController.text = userModel!.name!;
        bioController.text = userModel.bio!;
        phoneController.text = userModel.phone!;
        passwordController.text = userModel.password!;

        var profileImage = SocialCubit.get(context).profileImage;
        var coverImage = SocialCubit.get(context).coverImage;

        return Scaffold(
          appBar: defualtAppBar(
            context: context,
            title: 'Edit Profile',
            actions: [
              TextButton(
                onPressed: () {
                  SocialCubit.get(context).updateUser(
                      name: nameController.text,
                      password: passwordController.text,
                      phone: phoneController.text,
                      bio: bioController.text);
                },
                child: const Text('Update'),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (state is SocialUserUpdateLoadingState)
                  const LinearProgressIndicator(),
                if (state is SocialUserUpdateLoadingState)
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: 190,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              IconButton(
                                onPressed: () {
                                  SocialCubit.get(context).coverImage;
                                },
                                icon: const CircleAvatar(
                                  radius: 20,
                                  child: Icon(IconBroken.Camera),
                                ),
                              ),
                              Container(
                                height: 140,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4,
                                      ),
                                      topRight: Radius.circular(
                                        4,
                                      )),
                                  image: DecorationImage(
                                    image: (coverImage == null
                                            ? NetworkImage(userModel.cover!)
                                            : FileImage(coverImage))
                                        as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            IconButton(
                              onPressed: () {
                                SocialCubit.get(context).profileImage;
                              },
                              icon: const CircleAvatar(
                                radius: 20,
                                child: Icon(IconBroken.Camera),
                              ),
                            ),
                            CircleAvatar(
                              radius: 63,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: (profileImage == null
                                    ? NetworkImage(userModel.image!)
                                    : FileImage(profileImage)) as ImageProvider,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 25,
                ),
                if (SocialCubit.get(context).profileImage != null ||
                    SocialCubit.get(context).coverImage != null)
                  Row(
                    children: [
                      if (SocialCubit.get(context).profileImage != null)
                        Expanded(
                          child: Column(
                            children: [
                              defaultButton(
                                function: () {},
                                text: 'upload profile',
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const LinearProgressIndicator(),
                            ],
                          ),
                        ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (SocialCubit.get(context).coverImage != null)
                        Column(
                          children: [
                            Expanded(
                              child: defaultButton(
                                function: () {},
                                text: 'upload cover',
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const LinearProgressIndicator(),
                          ],
                        ),
                    ],
                  ),
                if (SocialCubit.get(context).profileImage != null ||
                    SocialCubit.get(context).coverImage != null)
                  const SizedBox(
                    height: 25,
                  ),
                defaultFormField(
                  controller: nameController,
                  type: TextInputType.name,
                  label: 'Name',
                  prefix: IconBroken.User,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Name must not be empty';
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                defaultFormField(
                  controller: bioController,
                  type: TextInputType.text,
                  label: 'bio',
                  prefix: IconBroken.Info_Circle,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'bio must not be empty';
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                defaultFormField(
                  controller: phoneController,
                  type: TextInputType.phone,
                  label: 'phone',
                  prefix: IconBroken.Call,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'phone number must not be empty';
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
