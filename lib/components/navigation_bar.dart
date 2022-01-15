import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:prayers/pages/home_page.dart';
import 'package:prayers/pages/settings_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeNavigationBar extends StatefulWidget {
  final PageController pageController;

  const HomeNavigationBar({Key? key, required this.pageController})
      : super(key: key);

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;

      //widget.pageController.jumpToPage(index);
      //widget.pageController.animateTo(2, duration: Duration(milliseconds: 500), curve: Curves.easeIn)
      widget.pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
        selectedColorOpacity: 0.3,
        selectedItemColor: Theme.of(context).selectedRowColor,
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(FontAwesomeIcons.clock),
            title: const Text("Orari"),
          ),

          /// Corano
          SalomonBottomBarItem(
            icon: const Icon(FontAwesomeIcons.book),
            title: const Text("Corano"),
          ),

          /// Qibla
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.compass),
            title: const Text("Qibla"),
          ),

          /// Tracker
          SalomonBottomBarItem(
            icon: const Icon(FontAwesomeIcons.solidCalendarCheck),
            title: const Text("Tracker"),
          ),

          /// Impostazioni
          SalomonBottomBarItem(
            icon: const Icon(FontAwesomeIcons.contao),
            title: const Text("Setta"),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      );
  }
}
