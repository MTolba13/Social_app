// ignore_for_file: sized_box_for_whitespace

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:social_app/style/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(8),
            elevation: 5,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                const Image(
                  image: NetworkImage(
                      'https://image.freepik.com/free-photo/portrait-cheerful-pleasant-bearded-guy-showing-direction-with-his-forefinger-having-sincere-smile_176532-10248.jpg'),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Communicate with Friends',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => buildPostItem(context),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
              itemCount: 10),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }

  Widget buildPostItem(context) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        elevation: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://image.freepik.com/free-photo/caucasian-man-spreads-hands-sideways-stands-clueless-has-no-idea-what-happened-puzzled-answer-dressed-orange-t-shirt-isolated-green-wall-whats-wrong-indecisive-boyfriend_273609-38353.jpg'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'Mahmoud Tolba',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                height: 1.4,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                              size: 18,
                            ),
                          ],
                        ),
                        Text(
                          'January 12,2022 at 8:42 pm',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                height: 1.4,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 17,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
              Text(
                'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature,',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          end: 3,
                        ),
                        child: Container(
                          height: 20,
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: 1,
                            height: 20,
                            padding: EdgeInsets.zero,
                            child: Text('#software',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: Colors.blue)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          end: 3,
                        ),
                        child: Container(
                          height: 20,
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: 1,
                            height: 20,
                            padding: EdgeInsets.zero,
                            child: Text('#Flutter',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: Colors.blue)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://image.freepik.com/free-photo/portrait-cheerful-pleasant-bearded-guy-showing-direction-with-his-forefinger-having-sincere-smile_176532-10248.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            const Icon(
                              IconBroken.Heart,
                              color: Colors.red,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '120',
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              IconBroken.Chat,
                              color: Colors.amber,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'comment',
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(
                                'https://image.freepik.com/free-photo/caucasian-man-spreads-hands-sideways-stands-clueless-has-no-idea-what-happened-puzzled-answer-dressed-orange-t-shirt-isolated-green-wall-whats-wrong-indecisive-boyfriend_273609-38353.jpg'),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'write a comment ...',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      fontSize: 15,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(
                          IconBroken.Heart,
                          color: Colors.red,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Like',
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
