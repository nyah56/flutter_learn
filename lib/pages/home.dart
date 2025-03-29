import 'package:flutter/material.dart';
import '../component/title_section.dart';
import '../component/drawer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.username,
    required this.email,
  });
  final String title;
  final List<String> username;
  final List<String> email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            // const Text('Hello World'),
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  // Add button action here
                  Navigator.of(context).pushReplacementNamed('/input');
                },
                child: const Text('Add'),
              ),
            ),
            username.isEmpty || email.isEmpty
                ? const Text('No data available')
                : Column(
                  children: [
                    for (int i = 0; i < username.length; i++)
                      TitleSection(email: email[i], username: username[i]),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
