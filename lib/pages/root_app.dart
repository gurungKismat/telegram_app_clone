import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:telegram_app_clone/pages/contact_page.dart';

import 'package:telegram_app_clone/theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        ContactPage(),
        Center(
          child: Text('Chats'),
        ),
        Center(
          child: Text('Settings'),
        ),
      ],
    );
  }

  Widget getFooter() {
    List iconsItem = [
      MaterialIcons.account_circle,
      Ionicons.ios_chatbubbles,
      MaterialIcons.settings,
    ];

    List iconsLabel = ['Contacts', 'Chats', 'Settings'];

    return Container(
      height: 90,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: greyColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              3,
              (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  child: Column(
                    children: [
                      index == 1
                          ? Badge(
                              badgeContent: const Text(
                                '3',
                                style: TextStyle(color: white),
                              ),
                              child: Icon(
                                iconsItem[index],
                                size: 30,
                                color: pageIndex == index
                                    ? primary
                                    : white.withOpacity(0.5),
                              ),
                            )
                          : Icon(
                              iconsItem[index],
                              size: 30,
                              color: pageIndex == index
                                  ? primary
                                  : white.withOpacity(0.5),
                            ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        iconsLabel[index],
                        style: TextStyle(
                          fontSize: 11,
                          color: pageIndex == index
                              ? primary
                              : white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }
}
