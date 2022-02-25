import 'package:flutter/material.dart';
import 'package:socialwork/constant.dart';
import 'package:socialwork/pages/pages_student/details_news_page.dart';

class NotificationStudentPage extends StatefulWidget {
  const NotificationStudentPage({Key? key}) : super(key: key);

  @override
  _NotificationStudentPageState createState() =>
      _NotificationStudentPageState();
}

class _NotificationStudentPageState extends State<NotificationStudentPage> {
  late Icon _iconTitle;
  late String _titleNotification;
  List type = [1, 2, 1, 3, 1, 3, 3, 2, 1];
  Widget _buildAppBarView() {
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

  Widget _viewNotification(int type) {
    if (type == 1) {
      _iconTitle =
          const Icon(Icons.add_to_queue, color: Color(Constant.mainColorIcon));
      _titleNotification = 'Đăng ký';
    } else if (type == 2) {
      _iconTitle = Icon(Icons.remove_from_queue, color: Colors.yellow.shade500);
      _titleNotification = 'Hủy đăng ký';
    } else {
      _iconTitle = const Icon(Icons.check_box_outlined, color: Colors.green);
      _titleNotification = 'Điểm danh';
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: _iconTitle),
                Expanded(
                  flex: 4,
                  child: Text(
                    _titleNotification,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: const [
                      Text(
                        'Thứ 4, 23/02',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.access_alarm,
                        color: Color(Constant.mainColorIcon),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            _viewLine(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Đăng ký thành công',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const Text(
                'Đây chỉ là một đoạn test nhỏ thôi nhé, các bạn nhớ đọc kĩ nha hahah haa hâhahah',
                style: TextStyle(
                  fontSize: 14,
                )),
            Row(
              children: const [
                Icon(
                  Icons.date_range,
                  color: Color(Constant.mainColorIcon),
                ),
                SizedBox(
                  width: 5,
                ),
                Text('Ngày công: 0.5',
                    style: TextStyle(
                      fontSize: 14,
                    )),
              ],
            )
          ]),
        ));
  }

  Widget _buildListNotification() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: type.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                child: _viewNotification(type[index]),
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
        child: _buildListNotification(),
      ),
    );
  }
}
