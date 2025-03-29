import 'package:flutter/material.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final myController = TextEditingController();
  final List<TextEditingController> myController = List.generate(
    2,
    (i) => TextEditingController(),
  );
  //  List.generate(5, (i) => TextEditingController());

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    // myController.dispose();
    for (final controller in myController) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(hintText: 'Enter your email'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: myController[0],
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Enter your username'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: myController[1],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(
                          myController[0].text + myController[1].text,
                        ),
                      );
                    },
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
