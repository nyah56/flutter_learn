import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/input.dart';

void main() {
  runApp(const MyApp());
}

final ColorScheme colorScheme = ColorScheme.fromSeed(
  seedColor: Colors.red.shade400,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // State<MyApp> createState() => _MyAppState();
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
      routes: <String, WidgetBuilder>{
        "/home":
            (BuildContext context) => const MyHomePage(title: "My Ruwet App"),
        "/input": (BuildContext context) => const Input(),
      },
      initialRoute: "/home",
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// class _MyAppState extends State<MyApp> {
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //    appBar: AppBar(
  //       // TRY THIS: Try changing the color here to a specific color (to
  //       // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
  //       // change color while the other colors stay the same.
  //       leading: Builder(
  //         builder: (context) {
  //           return IconButton(
  //             icon: const Icon(Icons.menu),
  //             onPressed: () {
  //               Scaffold.of(context).openDrawer();
  //             },
  //           );
  //         },
  //       ),

  //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  //       // Here we take the value from the MyHomePage object that was created by
  //       // the App.build method, and use it to set our appbar title.
  //       title: Text("My First App"),
  //     ),
  //     drawer: DrawerSection(
  //       title: "My First App",
  //       selectedIndex: _selectedIndex,
  //       onItemTapped: _onItemTapped,
  //       menuItem: _menuItems,
  //     ),
  //   );
    
  // }
  
// }
