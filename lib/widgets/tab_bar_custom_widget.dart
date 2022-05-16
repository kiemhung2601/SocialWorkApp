import 'package:flutter/material.dart';

import '../utils/constants.dart';

class TabBarCus extends StatelessWidget {
  final List<Widget> tabs;
  final TabController tabController;

  const TabBarCus({Key? key, required this.tabs, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.0),
        border: const Border(bottom: BorderSide(color: ConstColors.lightGray2, width: 5)),
      ),
      child: TabBar(
        isScrollable: true,
        unselectedLabelColor: Colors.black,
        labelColor: ConstColors.orange,
        labelStyle: const TextStyle(
          fontSize: Dimens.nav,
          fontFamily: 'SFPro',
          fontWeight: FontWeight.normal,
        ),
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(color: ConstColors.blue, width: 5),
        ),
        tabs: tabs,
        controller: tabController,
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
      ),
    );
  }
}