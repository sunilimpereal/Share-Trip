import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:share_trip/modules/view_trip/widgets/request_card.dart';

class RequestTab extends StatefulWidget {
  const RequestTab({super.key});

  @override
  State<RequestTab> createState() => _RequestTabState();
}

class _RequestTabState extends State<RequestTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        RequestCard(),
      ],
    );
  }
}
