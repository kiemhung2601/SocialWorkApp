import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:socialwork/constant.dart';

class InformationStudentPage extends StatefulWidget {
  const InformationStudentPage({Key? key}) : super(key: key);

  @override
  _InformationStudentPageState createState() => _InformationStudentPageState();
}

class _InformationStudentPageState extends State<InformationStudentPage> {
  bool _showInformation = false;

  Widget _buildAppBarView(){
    return AppBar(

      elevation: 0.0,
      title: const Text('Thông tin',
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

  Widget _buildCardStudent(BuildContext context, String name, String idStudent, String scoreDay) {
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
              child: Text(
                name.toUpperCase(),
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              margin: const EdgeInsets.only(top: 5, bottom: 5),
            ),
          ),
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'MSSV: $idStudent',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70),
                  ),
                  Text(
                    'Ngày công: $scoreDay Days',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildInformationStudent(BuildContext context, String urlImage, String date, String group, String year, String major, String department) {
    if(_showInformation){
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
          const SizedBox(height: 15,),
          Container(
            width: double.infinity,
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.centerLeft,
            child: Text("Ngày sinh: $date", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
          ),
          const SizedBox(height: 10,),
          Container(
            width: double.infinity,
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.centerLeft,
            child: Text('Lớp: $group', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
          ),
          const SizedBox(height: 10,),
          Container(
            width: double.infinity,
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.centerLeft,
            child: Text('Khóa: $year', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
          ),
          const SizedBox(height: 10,),
          Container(
            width: double.infinity,
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.centerLeft,
            child: Text('Chuyên ngành: $major', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
          ),
          const SizedBox(height: 10,),
          Container(
            width: double.infinity,
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.centerLeft,
            child: Text('Khoa: $department', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
          ),
        ],
      );
    }
    else{
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('dd-MM-yyyy');

    String _name = 'Đặng Kiếm Hùng';
    String _idStudent = '141801773';
    String _scoreDay = '10';

    String _urlImage = 'https://media.istockphoto.com/photos/portrait-of-happy-asian-handsome-young-man-in-fashionable-clothing-picture-id1283231614?s=612x612';
    var _dateBirth = DateTime.now();
    String _date = formatter.format(_dateBirth);
    String _groupStudent = '18DTH5';
    String _yearStudent = '14';
    String _majorStudent = 'Công nghệ thông tin';
    String _departmentStudent = 'Công nghệ';

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0), child: _buildAppBarView()),
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
                onTap: (){
                  setState(() {
                    if(_showInformation){
                      _showInformation = false;
                    }
                    else{
                      _showInformation = true;
                    }
                  });
                },
              ),
              const SizedBox(
                height: 15,
              ),
              _buildInformationStudent(context,_urlImage,_date,_groupStudent,_yearStudent, _majorStudent, _departmentStudent),
            ],
          ),
        ),
      ),
    );
  }
}