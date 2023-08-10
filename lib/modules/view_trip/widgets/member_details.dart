import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:share_trip/constants/color_constants.dart';
import 'package:share_trip/modules/create_trip/widgets/container_box.dart';
import 'package:share_trip/modules/view_trip/widgets/joined_tab.dart';
import 'package:share_trip/modules/view_trip/widgets/request_tab.dart';

class MemberDetails extends StatefulWidget {
  const MemberDetails({super.key});

  @override
  State<MemberDetails> createState() => _MemberDetailsState();
}

class _MemberDetailsState extends State<MemberDetails> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: Colors.white,
            elevation: 0.4,
            shadowColor: Colors.white,
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.white,
                  border: Border.all(width: 0.1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: TabBar(
                        labelPadding: const EdgeInsets.all(0),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.grey,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(color: ColorConstants.primaryColor),
                        controller: tabController,
                        tabs: const [
                          Tab(
                            // text: "Joined",
                            child: Center(
                              child: Text(
                                "Joined",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Center(
                              child: Text(
                                "Requests",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: const [
                        JoinedTab(),
                        RequestTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
