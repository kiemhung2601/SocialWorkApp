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

  Widget _buildTitleDetails(String title, String content) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            ".",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            content,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(Constant.mainColor)),
          ),
        ],
      ),
    );
  }

  Widget _viewLine(){
    return  Align(
      child: Container(
        width: double.infinity,
        height: 2,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildButton(){
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0))),
        minimumSize:
        MaterialStateProperty.all(const Size(200, 55)),
        backgroundColor:
        MaterialStateProperty.all(const Color(Constant.mainColor)),
        shadowColor:
        MaterialStateProperty.all(Colors.transparent),
      ),
      child: const Center(
        child: Text(
          "Đăng ký",
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800),
        ),
      ),
      onPressed: () {},
    );
  }

  Widget _buildMainTitle(String title){
    return Align(
        child: Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
        ));
  }

  Widget _buildAllDetails(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          child: Container(
            width: 150,
            height: 7,
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Đây là title nè, để test chứ không làm gì cả hahah haha',
          style: const TextStyle(fontSize: 25),
        ),
        const SizedBox(
          height: 20,
        ),
        _viewLine(),
        const SizedBox(
          height: 5,
        ),
        _buildMainTitle('Thông tin'),
        const SizedBox(
          height: 5,
        ),
        _buildTitleDetails('Ngày công', '0.5'),
        const SizedBox(
          height: 5,
        ),
        _buildTitleDetails('Số lượng tham gia', '30'),
        const SizedBox(
          height: 5,
        ),
        _buildTitleDetails('Ngày bắt đầu', '25/02/2022'),
        const SizedBox(
          height: 5,
        ),
        _buildTitleDetails('Ngày tạo', '21/02/2022'),
        const SizedBox(
          height: 5,
        ),
        _buildTitleDetails('Người tạo', 'Đặng Kiếm Hùng'),
        const SizedBox(
          height: 20,
        ),
        _viewLine(),
        const SizedBox(
          height: 5,
        ),
        _buildMainTitle('Chi tiết chương trình'),
        Text(
          'Chào các bạn, hôm nay trường chúng ta sẽ tổ chức chương trình tri ân học sinh, mở một party-night, open day, sẽ mời các ca sĩ về hát. Trường cần các bạn sinh viên hỗ trợ cho ngày hôm đó. Được tính 0.5 ngày công tác xã hội các bạn mau mau đăng ký nhé.',
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(
          height: 20,
        ),
        _buildButton()
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.33,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?cs=srgb&dl=pexels-james-wheeler-417074.jpg&fm=jpg',
                  ),
                  fit: BoxFit.fitWidth),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.27,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: _buildAllDetails(),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: _buildAppBarView()),
      body: getBody(),
    );
  }
}
