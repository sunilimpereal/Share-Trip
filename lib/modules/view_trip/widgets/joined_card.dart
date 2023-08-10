import 'package:flutter/material.dart';

class JoinedCard extends StatelessWidget {
  const JoinedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Colors.grey.shade200,
            ),
          )),
          child: ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(100)),
            ),
            title: const Text(
              "Sunil H",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: const Text("\$ 300"),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.message,
              ),
            ),
          )),
    );
  }
}
