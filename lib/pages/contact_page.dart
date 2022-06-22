import 'package:flutter/material.dart';
import 'package:telegram_app_clone/theme/colors.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: getAppBar(),
      ),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: greyColor,
      title: const Text(
        'Contacts',
        style: TextStyle(
          color: white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: const IconButton(
        onPressed: null,
        icon: Text(
          'Sort',
          style: TextStyle(
            color: primary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      actions: const [
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.add,
            color: primary,
          ),
        )
      ],
    );
  }
}

Widget getBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          height: 68.0,
          decoration: const BoxDecoration(
            color: greyColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 38.0,
                  decoration: BoxDecoration(
                      color: bgColor, borderRadius: BorderRadius.circular(10.0)),
                  child: TextField(
                    cursorColor: primary,
                    style: const TextStyle(color: white),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: white.withOpacity(0.3),
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: white.withOpacity(0.3),
                          fontSize: 17,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
        
      ],
    ),
  );
}
