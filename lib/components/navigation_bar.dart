import 'package:flutter/material.dart';

class HomeNavigationBar extends StatefulWidget {
  final List<NavigationDestination> destinations;
  final int selectedIndex;
  final void Function(int index) onItemTap;

  const HomeNavigationBar({
    Key? key,
    required this.onItemTap,
    required this.destinations,
    this.selectedIndex = 0,
  }) : super(key: key);

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  late int _selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 73,
      animationDuration: const Duration(milliseconds: 1100),
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int tappedIndex) {
        setState(() {
          _selectedIndex = tappedIndex;
        });

        widget.onItemTap(tappedIndex);
      },
      destinations: widget.destinations,
    );
  }
}
