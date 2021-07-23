import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keluarmasuk/app/pages/blank_page/blank_page_view.dart';
import 'package:keluarmasuk/app/pages/home_user/home_user_view.dart';
import 'package:keluarmasuk/app/utils/Warna.dart';
import '../app/widgets/FABBottomAppBarItem.dart';

class bottomNavigationBar extends StatefulWidget {
  @override
  _bottomNavigationBarState createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  /// Set a type current number a layout class
  Widget callPage(int current) {
    switch (current) {
      case 0:
        return new home_user_view();
      case 1:
        return new blank_page_view();
      case 2:
        return new blank_page_view();
      default:
        return blank_page_view();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  /// Build BottomNavigationBar Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: callPage(currentIndex),
      floatingActionButton: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              Navigator.of(context).pushNamed('/search_hotel');
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Warna.warnaUtama,
              ),
              child: Center(child: FaIcon(FontAwesomeIcons.home, size: 30)),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FABBottomAppBar(
        notchedShape: CircularNotchedRectangle(),
        iconSize: 15,
        height: 50,
        selectedColor: Warna.warnaUtama,
        onTabSelected: (value) {
          currentIndex = value;
          if (this.mounted) {
            setState(() {});
          }
        },
        items: [
          FABBottomAppBarItem(
            iconData: FontAwesomeIcons.thLarge,
            text: 'Menu',
          ),
          FABBottomAppBarItem(
              iconData: FontAwesomeIcons.calendar, text: 'My Order'),
          FABBottomAppBarItem(iconData: FontAwesomeIcons.star, text: 'Rewards'),
          FABBottomAppBarItem(
              iconData: FontAwesomeIcons.questionCircle, text: 'Help'),
        ],
      ),
    );
  }
}
