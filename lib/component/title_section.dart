import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.email, required this.username});

  final String email;
  final String username;

  @override
  Widget build(BuildContext context) {
    return buildTitleSection(username, email);
  }
}

Widget buildTitleSection(final String username, final String email) {
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
                  username,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(email, style: TextStyle(color: Colors.grey[500])),
            ],
          ),
        ),
        /*3*/
        Icon(Icons.delete, color: Colors.red[500]),
      ],
    ),
  );
}
