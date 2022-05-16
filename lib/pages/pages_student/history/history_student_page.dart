import 'package:flutter/material.dart';
import 'package:socialwork/pages/pages_student/details_news/details_news_page.dart';
import 'package:socialwork/tab_view/history_rollup_tab.dart';
import 'package:socialwork/utils/constants.dart';
import 'package:socialwork/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../tab_view/history_register_tab.dart';
import '../../../tab_view/history_unregister_tab.dart';
import '../../../widgets/tab_bar_custom_widget.dart';
import '../../../widgets/text_custom_widget.dart';
import '../home/home_page_student.dart';

class HistoryStudentPage extends StatefulWidget {
  const HistoryStudentPage({Key? key}) : super(key: key);

  @override
  _HistoryStudentPageState createState() => _HistoryStudentPageState();
}

class _HistoryStudentPageState extends State<HistoryStudentPage>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
    super.initState();
  }

  Widget _buildAppBarView() {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      title: const TextCustom(
        'Lịch sử',
        fontSize: Dimens.bigText1,
        color: Colors.white,
      ),
      backgroundColor: ConstColors.primary,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const HomePageStudent()),
                (route) => false);
          },
        ),
      ],
    );
  }

  Widget _buildTabWithIndex() {
    switch (_selectedIndex) {
      case 0:
        return const RegisterTab();
      case 1:
        return const UnregisterTab();
      case 2:
        return const RollUpTab();
      default:
        return Container();
    }
  }

  Widget _buildTabs() {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, size) {
            return TabBarCus(
              tabs: [
                SizedBox(
                  child: const Tab(
                    child: Text(
                      'Đăng ký',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Dimens.title, fontWeight: FontWeight.w400),
                    ),
                  ),
                  width: (size.maxWidth / 3),
                ),
                SizedBox(
                  child: const Tab(
                    child: Text(
                      'Hủy Đăng ký',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Dimens.title, fontWeight: FontWeight.w400),
                    ),
                  ),
                  width: (size.maxWidth / 3),
                ),
                SizedBox(
                  child: const Tab(
                    child: Text(
                      'Điểm danh',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Dimens.title, fontWeight: FontWeight.w400),
                    ),
                  ),
                  width: (size.maxWidth / 3),
                ),
              ],
              tabController: _tabController,
            );
          },
        ),
        HeightBox(DimenUtilsPX.pxToPercentage(context, 20)),
        Expanded(
          child: Column(
            children: [
              Expanded(child: _buildTabWithIndex()),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: _buildAppBarView()),
      body: Container(
          padding: EdgeInsets.only(
              top: DimenUtilsPX.pxToPercentage(context, 20),
              left: DimenUtilsPX.pxToPercentage(context, 16),
              right: DimenUtilsPX.pxToPercentage(context, 16)),
          child: _buildTabs()
      ),
    );
  }
}
