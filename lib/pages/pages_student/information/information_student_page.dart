import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/constants.dart';
import '../../../widgets/text_custom_widget.dart';
import '../home/home_page_student.dart';

class InformationStudentPage extends StatefulWidget {
  const InformationStudentPage({Key? key}) : super(key: key);

  @override
  _InformationStudentPageState createState() => _InformationStudentPageState();
}

class _InformationStudentPageState extends State<InformationStudentPage> {
  bool _showInformation = false;

  Widget _buildAppBarView() {
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      title: const TextCustom(
        'Thông tin',
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

  Widget _buildCardStudent(
      BuildContext context, String name, String idStudent, String scoreDay) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: const [0.1, 0.3, 0.8, 0.9],
          colors: [
            Colors.yellow.shade500,
            Colors.yellow.shade400,
            Colors.purple.shade400,
            Colors.purple.shade500,
          ],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(left: size.width * 0.8, top: 10),
              child: const Image(
                image: AssetImage(
                  'assets/plash.png',
                ),
                width: 50,
                height: 50,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: TextCustom(
                name.toUpperCase(),
                typeText: TypeText.title,
                fontSize: Dimens.bigText1,
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(top: 5, bottom: 5),
            ),
          ),
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextCustom(
                    'MSSV: $idStudent',
                    typeText: TypeText.body,
                    color: ConstColors.lightGray2,
                  ),
                  TextCustom(
                    'Ngày công: $scoreDay ngày',
                    typeText: TypeText.body,
                    color: ConstColors.lightGray2,
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildInformationStudent(BuildContext context, String urlImage,
      String date, String group, String year, String major, String department) {
    if (_showInformation) {
      return Column(
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              border: Border.all(width: 4, color: Colors.white),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1),
                )
              ],
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(urlImage),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextCustom(
                  'Ngày sinh: ',
                  typeText: TypeText.body,
                  fontSize: Dimens.title,
                  margin: EdgeInsets.all(0),
                ),
                TextCustom(
                  date,
                  typeText: TypeText.title,
                  fontSize: Dimens.title,
                  margin: const EdgeInsets.all(0),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TextCustom(
                  'Lớp: ',
                  typeText: TypeText.body,
                  fontSize: Dimens.title,
                  margin: EdgeInsets.all(0),
                ),
                TextCustom(
                  group,
                  typeText: TypeText.title,
                  fontSize: Dimens.title,
                  margin: const EdgeInsets.all(0),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TextCustom(
                  'Khóa: ',
                  typeText: TypeText.body,
                  fontSize: Dimens.title,
                  margin: EdgeInsets.all(0),
                ),
                TextCustom(
                  year,
                  typeText: TypeText.title,
                  fontSize: Dimens.title,
                  margin: const EdgeInsets.all(0),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TextCustom(
                  'Chuyên ngành: ',
                  typeText: TypeText.body,
                  fontSize: Dimens.title,
                  margin: EdgeInsets.all(0),
                ),
                TextCustom(
                  major,
                  typeText: TypeText.title,
                  fontSize: Dimens.title,
                  margin: const EdgeInsets.all(0),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TextCustom(
                  'Khoa: ',
                  typeText: TypeText.body,
                  fontSize: Dimens.title,
                  margin: EdgeInsets.all(0),
                ),
                TextCustom(
                  department,
                  typeText: TypeText.title,
                  fontSize: Dimens.title,
                  margin: const EdgeInsets.all(0),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('dd-MM-yyyy');

    String _name = 'Đặng Kiếm Hùng';
    String _idStudent = '141801773';
    String _scoreDay = '10';

    String _urlImage =
        'https://media.istockphoto.com/photos/portrait-of-happy-asian-handsome-young-man-in-fashionable-clothing-picture-id1283231614?s=612x612';
    var _dateBirth = DateTime.now();
    String _date = formatter.format(_dateBirth);
    String _groupStudent = '18DTH5';
    String _yearStudent = '14';
    String _majorStudent = 'Công nghệ thông tin';
    String _departmentStudent = 'Công nghệ';

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: _buildAppBarView()),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: _buildCardStudent(context, _name, _idStudent, _scoreDay),
                onTap: () {
                  setState(() {
                    if (_showInformation) {
                      _showInformation = false;
                    } else {
                      _showInformation = true;
                    }
                  });
                },
              ),
              const SizedBox(
                height: 15,
              ),
              _buildInformationStudent(context, _urlImage, _date, _groupStudent,
                  _yearStudent, _majorStudent, _departmentStudent),
            ],
          ),
        ),
      ),
    );
  }
}
