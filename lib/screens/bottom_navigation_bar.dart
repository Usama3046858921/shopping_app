import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'CategoryScreen.dart';
import 'Home.dart';
import 'enter_otp.dart';

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({Key? key}) : super(key: key);

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  Widget screen = const Home();
  int _page = 2;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _page,
          height: 60.0,
          onTap: (page) {
            setState(() {
              _page = page;
              if (page == 0) {
                screen = const Home();
              }
              if (page == 1) {
                screen = CategoryScreen();
              }
              if (page == 2) {
                screen = Home();
              }
              if (page == 3) {}
              if (page == 4) {
                screen = EnterOTP();
              }
            });
          },
          backgroundColor: Colors.white,
          items: const <Widget>[
            Icon(Icons.production_quantity_limits, size: 25),
            Icon(Icons.list, size: 25),
            Icon(Icons.home, size: 50),
            Icon(Icons.chat_sharp, size: 25),
            Icon(Icons.person, size: 25),
          ],
          color: Colors.red,
          buttonBackgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          letIndexChange: (index) => true,
        ),
        body: screen);
  }
}
