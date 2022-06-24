import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:telegram_app_clone/json/chat_json.dart';
import 'package:telegram_app_clone/json/contact_json.dart';
import 'package:telegram_app_clone/theme/colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          60.0,
        ),
        child: getAppBar(),
      ),
      body: Column(
        children: [
          getBody(),
        ],
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: greyColor,
      leading: const IconButton(
        onPressed: null,
        icon: Text(
          'Edit',
          style: TextStyle(
            color: primary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      title: const Text(
        'Chat',
        style: TextStyle(
          color: white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: const [
        Icon(
          LineIcons.edit,
          color: primary,
        )
      ],
    );
  }

  Widget getBody() {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 68.0,
          decoration: const BoxDecoration(
            color: greyColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 38,
              decoration: BoxDecoration(
                  color: bgColor, borderRadius: BorderRadius.circular(10.0)),
              child: TextField(
                cursorColor: primary,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    LineIcons.search,
                    color: white.withOpacity(0.3),
                  ),
                  border: InputBorder.none,
                  hintText: 'Search for message or users',
                  hintStyle: TextStyle(
                    color: white.withOpacity(0.3),
                    fontSize: 17.0,
                  ),
                ),
                style: const TextStyle(color: white, fontSize: 17.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        getListItems(size),
      ],
    );
  }

  Widget getListItems(Size size) {
    return Column(
        children: List.generate(
      chat_data.length,
      (index) {
        return Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 5.0),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(chat_data[index]['img']),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Container(
                  height: 70,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (size.width - 40) * 0.6,
                            child: Text(
                              chat_data[index]['name'],
                              style: const TextStyle(
                                color: white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          Text(
                            chat_data[index]['date'],
                            style: TextStyle(color: white.withOpacity(0.4)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Container(
                        width: (size.width - 40) * 1,
                        child: Row(
                          children: [
                            Text(
                              chat_data[index]['text'],
                              style: TextStyle(
                                  color: white.withOpacity(0.3),
                                  fontSize: 15,
                                  height: 1.3),
                            ),
                            chat_data[index]['badge'] > 0 ? Badge(
                              
                            ) : Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
