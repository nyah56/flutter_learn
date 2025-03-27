import 'package:flutter/material.dart';
import '../component/title_section.dart';
import '../component/drawer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

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
      drawer: DrawerSection(title: 'Input'),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
