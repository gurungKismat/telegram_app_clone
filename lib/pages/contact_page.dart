import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:telegram_app_clone/json/contact_json.dart';
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
                      color: bgColor,
                      borderRadius: BorderRadius.circular(10.0)),
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
        const SizedBox(height: 10.0),
        getSectionIcons(),
        getContactList(),
      ],
    ),
  );
}

Widget getContactList() {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0),
    child: Column(
      children: List.generate(
        10,
        (index) {
          return Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      contact_data[index]['img'],
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact_data[index]['name'],
                        style: const TextStyle(
                          color: white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                          contact_data[index]['is_online']
                              ? 'Online'
                              : contact_data[index]['seen'],
                          style: TextStyle(
                            color: contact_data[index]['is_online']
                                ? primary
                                : white.withOpacity(0.5),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Divider(thickness: 1, color: white.withOpacity(0.15)),
              ),
            ],
          );
        },
      ),
    ),
  );
}

Widget getSectionIcons() {
  List icons = [
    {
      'icon': LineIcons.mapMarker,
      'label': 'Find People Nearby',
    },
    {
      'icon': LineIcons.userPlus,
      'label': 'Invite Friends',
    },
  ];
  return Padding(
    padding: const EdgeInsets.only(left: 10.0),
    child: Column(
      children: List.generate(icons.length, (index) {
        return Column(
          children: [
            Row(
              children: [
                Icon(
                  icons[index]['icon'],
                  size: 28,
                  color: primary,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  icons[index]['label'],
                  style: const TextStyle(
                    fontSize: 16,
                    color: primary,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Divider(
                thickness: 1.0,
                color: white.withOpacity(0.15),
              ),
            ),
          ],
        );
      }),
    ),
  );
}
