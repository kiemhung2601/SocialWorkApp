import 'package:flutter/material.dart';
import 'package:socialwork/constant.dart';

class DetailsNewsPage extends StatefulWidget {
  const DetailsNewsPage({Key? key}) : super(key: key);

  @override
  _DetailsNewsPageState createState() => _DetailsNewsPageState();
}

class _DetailsNewsPageState extends State<DetailsNewsPage> {
  Widget _buildAppBarView() {
    return AppBar(
      elevation: 0.0,
      title: const Text('Chi tiết',
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
          preferredSize: const Size.fromHeight(50.0),
          child: _buildAppBarView()),
      body: Container(),
    );
  }
}
