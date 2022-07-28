import 'package:flutter/material.dart';
import 'package:flutter_test_app/constants.dart';
import 'package:flutter_test_app/screens/chats/chats_screen.dart';
import 'package:flutter_test_app/screens/profile/profile.dart';

import '../../match.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  final List<Widget> _screens = [
    ProfileScreen(),
    MatchScreen(),
    MatchScreen(),
    ChatsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomNavigationBar(),
      body: _screens[_selectedIndex],
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: "Profile",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_outline_rounded),
          label: "Match",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wb_sunny_rounded),
          label: "Now",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_rounded),
          label: "Chats",
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: const Text("Lemon"),
      backgroundColor: kPrimaryColor,
      foregroundColor: kContentColorLightTheme,
         bottom: PreferredSize(
      child: Container(
         color: kContentColorLightTheme,
         height: 2,
      ),
      preferredSize: Size.fromHeight(2.0)),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {},
            child: const Icon(Icons.tune_rounded),
          ),
        )
      ],
    );
  }
}
