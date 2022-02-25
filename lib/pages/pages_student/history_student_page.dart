import 'package:flutter/material.dart';
import 'package:socialwork/constant.dart';
import 'package:socialwork/pages/pages_student/details_news_page.dart';

class HistoryStudentPage extends StatefulWidget {
  const HistoryStudentPage({Key? key}) : super(key: key);

  @override
  _HistoryStudentPageState createState() => _HistoryStudentPageState();
}

class _HistoryStudentPageState extends State<HistoryStudentPage> {
  late Icon _iconTitle;
  late String _titleHistory;
  List type = [1, 2, 3, 3, 2, 2, 1, 3, 1];

  Widget _buildAppBarView() {
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

  Widget _viewLine() {
    return Container(
      width: double.infinity,
      height: 2,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _viewHistory(int type) {
    if (type == 1) {
      _iconTitle =
      const Icon(Icons.check_circle_outline, color: Colors.green,);
      _titleHistory = 'Đăng ký thành công';
    }
    else if(type == 2){
      _iconTitle =
      const Icon(Icons.remove_circle_outline, color: Colors.red);
      _titleHistory = 'Hủy đăng ký thành công';
    }
    else {
      _iconTitle = const Icon(Icons.local_fire_department, color: Color(Constant.mainColor),);
      _titleHistory = 'Điểm danh thành công';
    }
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(width: 1, color: Colors.black45)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: const [
                Expanded(
                    flex: 1,
                    child: Icon(Icons.date_range,
                        color: Color(Constant.mainColorIcon))),
                Expanded(
                    flex: 1,
                    child:
                        Icon(Icons.alarm, color: Color(Constant.mainColorIcon)))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: const [
                Expanded(
                    flex: 1,
                    child: Align(
                        child: Text(
                      '25/02/2022',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ))),
                Expanded(
                    flex: 1,
                    child: Align(
                        child: Text('16:20',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600))))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            _viewLine(),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _titleHistory,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 10,),
                _iconTitle,
              ],
            ),
            const Text(
              "Đây chỉ là một đoạn test nhỏ thôi nhé, các bạn nhớ đọc kĩ nha hahaha hahaha hâhaa",
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: const [
                Icon(
                  Icons.date_range,
                  color: Color(Constant.mainColorIcon),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Ngày công: 0.5',
                    style: TextStyle(
                      fontSize: 14,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListHistory(){
    return ListView.builder(
        shrinkWrap: true,
        itemCount: type.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                child: _viewHistory(type[index]),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                          const DetailsNewsPage()));
                },
              ),
              const SizedBox(
                height: 15,
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: _buildAppBarView()),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _buildListHistory(),
      ),
    );
  }
}
