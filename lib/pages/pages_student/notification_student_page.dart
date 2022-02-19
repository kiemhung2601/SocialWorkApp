import 'package:flutter/material.dart';
import 'package:socialwork/constant.dart';

class NotificationStudentPage extends StatefulWidget {
  const NotificationStudentPage({Key? key}) : super(key: key);

  @override
  _NotificationStudentPageState createState() => _NotificationStudentPageState();
}

class _NotificationStudentPageState extends State<NotificationStudentPage> {

  Widget _buildAppBarView(){
    return AppBar(

      elevation: 0.0,
      title: const Text('Thông báo',
          style: TextStyle(
            fontSize: 25,
            color: Color(Constant.mainColorIcon),
            fontWeight: FontWeight.w600,
          )),
      backgroundColor: const Color(Constant.mainColor),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Color(Constant.mainColorIcon),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0), child: _buildAppBarView()),
      body: Container(),
    );
  }
}
