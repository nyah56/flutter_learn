import 'package:flutter/material.dart';

class DrawerSection extends StatelessWidget {
  DrawerSection({super.key, required this.title});

  final String title;

  final List<String> _menuItems = ['home', 'input'];

  navigateTo(String route, BuildContext context) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  String capitalizeFirstLetter(String word) {
    if (word.isEmpty) {
      return word; // Return empty string if input is empty
    }
    return word[0].toUpperCase() + word.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            curve: Easing.linear,
            child: Text('Menu'),
          ),

          for (final item in _menuItems)
            ListTile(
              title: Text(capitalizeFirstLetter(item)),
              // selected: _menuItems.indexOf(item) == _selectedIndex,
              onTap: () {
                navigateTo('/$item', context);
              },
            ),
        ],
      ),
    );
  }
}
