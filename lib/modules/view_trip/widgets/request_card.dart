import 'package:flutter/material.dart';

class RequestCard extends StatefulWidget {
  const RequestCard({super.key});

  @override
  State<RequestCard> createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
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
            subtitle: const Text(
              "\$ 300",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.message,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.check,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
