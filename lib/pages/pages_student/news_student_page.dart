import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:socialwork/pages/pages_student/details_news_page.dart';

import '../../constant.dart';

class NewsStudentPage extends StatefulWidget {
  const NewsStudentPage({Key? key}) : super(key: key);

  @override
  _NewsStudentPageState createState() => _NewsStudentPageState();
}

class _NewsStudentPageState extends State<NewsStudentPage> {
  Future<void> _refresh(){
    return Future.delayed(Duration(seconds: 2));
  }

  Widget _buildAppBarView() {
    return AppBar(
      elevation: 0.0,
      title: const Text('Bảng tin',
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

  Widget _buildCarouseSlider(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(height: 250.0),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?cs=srgb&dl=pexels-james-wheeler-417074.jpg&fm=jpg',
                        fit: BoxFit.cover,
                        height: 250,
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: 250,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xCC000000),
                              Color(0x00000000),
                              Color(0x00000000),
                              Color(0xCC000000),
                            ]),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        child: const Text(
                          'Đây chỉ là một đoạn title để test mà thôi nhé',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const DetailsNewsPage()));
              },
            );
          },
        );
      }).toList(),
    );
  }

  Widget _viewEvent(String urlImage, String title, double score, String time) {
    String getTruncatedTitle(String text, int truncateNumber) {
      return text.length > truncateNumber
          ? text.substring(0, truncateNumber) + "..."
          : text;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              urlImage,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                getTruncatedTitle(title, 60),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$score ngày công tác',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  Text(
                    time,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              )
            ],
          )),
        ],
      ),
    );
  }

  Widget _buildListEvent() {
    String _urlImage =
        'https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?cs=srgb&dl=pexels-james-wheeler-417074.jpg&fm=jpg';
    String _title =
        'Đây chỉ là một đoạn test nho nhỏ thôi nhé, các bạn đọc kĩ nha. Cảm ơn mọi người';
    double _score = 0.5;
    String _date = 'Today, 8:28AM';

    return Column(
      children: [
        InkWell(
          child: _viewEvent(_urlImage, _title, _score, _date),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const DetailsNewsPage()));
          },
        ),
        InkWell(
          child: _viewEvent(_urlImage, _title, _score, _date),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const DetailsNewsPage()));
          },
        ),
        InkWell(
          child: _viewEvent(_urlImage, _title, _score, _date),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const DetailsNewsPage()));
          },
        ),
        InkWell(
          child: _viewEvent(_urlImage, _title, _score, _date),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                    const DetailsNewsPage()));
          },
        ),
        InkWell(
          child: _viewEvent(_urlImage, _title, _score, _date),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                    const DetailsNewsPage()));
          },
        ),
        InkWell(
          child: _viewEvent(_urlImage, _title, _score, _date),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                    const DetailsNewsPage()));
          },
        ),
        InkWell(
          child: _viewEvent(_urlImage, _title, _score, _date),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                    const DetailsNewsPage()));
          },
        ),
        InkWell(
          child: _viewEvent(_urlImage, _title, _score, _date),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                    const DetailsNewsPage()));
          },
        ),
      ],
    );
  }

  Widget _buildNewsPage() {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      edgeOffset: 40,
      onRefresh: _refresh,
      child: SingleChildScrollView(
        reverse: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Xin chào',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Bắt đầu ngày mới bằng một việc năng động nào',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            _buildCarouseSlider(context),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Danh sách sự kiện',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            _buildListEvent(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: _buildAppBarView()),
      body: _buildNewsPage(),
    );
  }
}
