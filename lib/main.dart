import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final ColorScheme colorScheme = ColorScheme.fromSeed(
  seedColor: Colors.red.shade400,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: colorScheme,
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          /*3*/
          Icon(Icons.star, color: Colors.red[500]),
          const Text('41'),
        ],
      ),
    );
  }
}

class DrawerSection extends StatelessWidget {
  const DrawerSection({
    super.key,
    required this.title,
    this.selectedIndex,
    this.onItemTapped,
    this.menuItem,
  });

  final String title;
  final selectedIndex;
  final onItemTapped;
  final menuItem;
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
            child: Text(title),
          ),
          // ListTile(
          //   title: Text(menuItem[selectedIndex]),
          //   selected: selectedIndex == 0,
          //   onTap: () {
          //     // Update the state of the app
          //     onItemTapped(0);
          //     // Then close the drawer
          //     Navigator.pop(context);
          //   },
          // ),
          for (final item in menuItem)
            ListTile(
              title: Text(item),
              selected: menuItem.indexOf(item) == selectedIndex,
              onTap: () {
                // Update the state of the app
                onItemTapped(menuItem.indexOf(item));
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  // String _myName = '';
  // final bool _visible = false;
  int _selectedIndex = 0;
  final List<String> _menuItems = ['Home', 'About', 'Options'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("My First App"),
      ),
      drawer: DrawerSection(
        title: "My First App",
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        menuItem: _menuItems,
      ),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(_menuItems[_selectedIndex]),
              ),
            ),
            TitleSection(
              name: 'Oeschinen Lake Campground',
              location: 'Kandersteg, Switzerland',
            ),
            TitleSection(
              name: 'Oeschinen Lake Campground',
              location: 'Kandersteg, Switzerland',
            ),
            TitleSection(
              name: 'Oeschinen Lake Campground',
              location: 'Kandersteg, Switzerland',
            ),
          ],
        ),
      ),
    );
  }
}
