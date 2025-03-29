import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/input.dart';

void main() {
  runApp(const MyApp());
}

final ColorScheme colorScheme = ColorScheme.fromSeed(
  seedColor: Colors.red.shade400,
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  State<MyApp> createState() => _MyAppState();
  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       colorScheme: colorScheme,
  //       primarySwatch: Colors.blue,
  //       textTheme: const TextTheme(
  //         headlineMedium: TextStyle(
  //           fontSize: 20.0,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //     routes: <String, WidgetBuilder>{
  //       "/home":
  //           (BuildContext context) => const MyHomePage(title: "My Ruwet App"),
  //       "/input": (BuildContext context) => const Input(),
  //     },
  //     initialRoute: "/home",
  //     home: const MyHomePage(title: 'Flutter Demo Home Page'),
  //   );
  // }
}

class _MyAppState extends State<MyApp> {
  List<String> username = ['Ibnu'];
  List<String> email = ['Ibnu@gmail.com'];

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
            (BuildContext context) => MyHomePage(
              title: "My Ruwet App",
              email: email,
              username: username,
            ),
        "/input": (BuildContext context) => const Input(),
      },
      initialRoute: "/home",
      home: MyHomePage(title: "My Ruwet App", email: email, username: username),
    );
  }
}
