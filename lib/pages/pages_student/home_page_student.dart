import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:socialwork/constant.dart';
import 'package:socialwork/pages/login_page.dart';
import 'package:socialwork/pages/pages_student/history_student_page.dart';
import 'package:socialwork/pages/pages_student/news_student_page.dart';
import 'package:socialwork/pages/pages_student/notification_student_page.dart';
import 'package:socialwork/pages/pages_student/qr_scan_page.dart';

class HomePageStudent extends StatefulWidget {
  const HomePageStudent({Key? key}) : super(key: key);

  @override
  _HomePageStudentState createState() => _HomePageStudentState();
}

class _HomePageStudentState extends State<HomePageStudent> {

  void _showLogoutDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Đăng xuất?'),
            content: const Text('Bạn chắc chắn muốn đăng xuất không?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const LoginPage()),
                        ModalRoute.withName('/'));
                  },
                  child: const Text('Đồng ý')),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Chờ tí'),
              )
            ],
          );
        });
  }

  Widget _appBarView() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(
        Icons.menu,
        color: Color(Constant.mainColorIcon),
      ),
      title: const Text(
        'Trang chủ',
        style: TextStyle(
            color: Color(Constant.mainColorIcon),
            fontWeight: FontWeight.w600,
            fontSize: 25),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Color(Constant.mainColorIcon)),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const NotificationStudentPage()),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.logout, color: Color(Constant.mainColorIcon)),
          onPressed: () {
            _showLogoutDialog();
          },
        ),
      ],
    );
  }

  Widget _iconFlow(Icon icon, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: icon),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildMenu(){
    Icon _iconNews = const Icon(
      Icons.wysiwyg_outlined,
      size: 40,
      color: Color(Constant.mainColorIcon),
    );
    Icon _iconQr = const Icon(
      Icons.qr_code,
      size: 40,
      color: Color(Constant.mainColorIcon),
    );
    Icon _iconUser = const Icon(
      Icons.account_box_outlined,
      size: 40,
      color: Color(Constant.mainColorIcon),
    );
    Icon _iconHistory = const Icon(
      Icons.history_edu_outlined,
      size: 40,
      color: Color(Constant.mainColorIcon),
    );
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30))),
      child: GridView.extent(
        shrinkWrap: true,
        maxCrossAxisExtent: 120,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: [
          InkWell(
            child: _iconFlow(_iconNews, "Bảng tin"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NewsStudentPage()),
              );
            },
          ),
          InkWell(
            child: _iconFlow(_iconQr, "Quét QR"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const QrScanPage()),
              );
            },
          ),
          InkWell(
            child: _iconFlow(_iconUser, "Thông tin"),
            onTap: () {
              Navigator.pushNamed(context, '/informationStudentPage');
            },
          ),
          InkWell(
            child: _iconFlow(_iconHistory, "Lịch sử"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HistoryStudentPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "SOCIAL WORK",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
        ),
        const SizedBox(
          height: 15,
        ),
        QrImage(
          data: "Hello",
          size: 200,
          backgroundColor: Colors.white,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(Constant.mainColor),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0), child: _appBarView()),
      body: SingleChildScrollView(
        reverse: true,
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(children: [
            Expanded(
                flex: 3,
                child: _buildQrView(),
            ),
            Expanded(
              flex: 5,
              child: _buildMenu(),
            ),
          ]),
        ),
      ),
    );
  }
}
