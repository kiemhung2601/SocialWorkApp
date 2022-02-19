import 'package:flutter/material.dart';
import 'package:socialwork/constant.dart';

class HistoryStudentPage extends StatefulWidget {
  const HistoryStudentPage({Key? key}) : super(key: key);

  @override
  _HistoryStudentPageState createState() => _HistoryStudentPageState();
}

class _HistoryStudentPageState extends State<HistoryStudentPage> {
  Widget _buildAppBarView(){
    return AppBar(

      elevation: 0.0,
      title: const Text('Lịch sử',
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
