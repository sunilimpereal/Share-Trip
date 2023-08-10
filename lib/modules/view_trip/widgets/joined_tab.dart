import 'package:flutter/material.dart';

import 'joined_card.dart';


class JoinedTab extends StatefulWidget {
  const JoinedTab({super.key});

  @override
  State<JoinedTab> createState() => _JoinedTabState();
}

class _JoinedTabState extends State<JoinedTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [JoinedCard()],
    );
  }
}