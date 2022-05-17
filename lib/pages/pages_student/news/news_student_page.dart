import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:socialwork/pages/pages_student/details_news/details_news_page.dart';
import 'package:socialwork/widgets/text_custom_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../routes.dart';
import '../../../utils/constants.dart';

class NewsStudentPage extends StatefulWidget {
  const NewsStudentPage({Key? key}) : super(key: key);

  @override
  _NewsStudentPageState createState() => _NewsStudentPageState();
}

class _NewsStudentPageState extends State<NewsStudentPage> {
  int activeIndex = 0;

  final colors = const [
    Colors.red,
    Colors.green,
    Colors.greenAccent,
    Colors.amberAccent,
    Colors.blue,
    Colors.amber,
  ];

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 2));
  }

  Widget _buildAppBarView() {
    return AppBar(
      elevation: 0.0,
      title: const TextCustom(
        'Bảng tin',
        fontSize: Dimens.bigText1,
        color: Colors.white,
      ),
      backgroundColor: ConstColors.primary,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          context.vxNav.pop();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: () {
            context.vxNav.clearAndPush(Uri.parse(RoutesPath.homeRoute));
          },
        ),
      ],
    );
  }

  Widget _buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 5,
        effect: CustomizableEffect(
          activeDotDecoration: DotDecoration(
            width: 32,
            height: 12,
            color: Colors.indigo,
            rotationAngle: 180,
            verticalOffset: -10,
            borderRadius: BorderRadius.circular(24),
          ),
          dotDecoration: DotDecoration(
            width: 24,
            height: 12,
            color: Colors.grey,
            borderRadius: BorderRadius.circular(16),
            verticalOffset: 0,
          ),
          spacing: 6.0,
          inActiveColorOverride: (i) => colors[i],
        ),
      );

  Widget _buildScrollHorizontal(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 5,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: size.height / 3,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
            // pageSnapping: false,
            // autoPlay: true,
            // autoPlayInterval: Duration(seconds: 1),
          ),
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
                            height: size.height / 3,
                          ),
                        ),
                        Container(
                          width: size.width,
                          height: size.height / 3,
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
                              'Sự kiện Open DNTU 2022 tháng 06 sẽ diễn ra tại DNTU',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    context.vxNav.push(Uri.parse(RoutesPath.detailsRoute));
                  },
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 10,
        ),
        _buildIndicator(),
      ],
    );
  }

  Widget _viewEvent(String urlImage, String title, double score, String time) {
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
              TextCustom(
                title,
                hadMaxLines: true,
                typeText: TypeText.title,
                margin: const EdgeInsets.all(0),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustom(
                    '$score ngày công tác',
                    typeText: TypeText.body,
                    color: ConstColors.lightGray,
                    fontSize: Dimens.nav,
                  ),
                  TextCustom(
                    time,
                    typeText: TypeText.body,
                    color: ConstColors.lightGray,
                    fontSize: Dimens.nav,
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
        'Sự kiện Open DNTU 2022 tháng 06 sẽ diễn ra tại DNTU';
    double _score = 0.5;
    String _date = 'Today, 8:28AM';
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            child: _viewEvent(_urlImage, _title, _score, _date),
            onTap: () {
              context.vxNav.push(Uri.parse(RoutesPath.detailsRoute));
            },
          );
        });
  }

  Widget _buildNewsPage() {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      edgeOffset: 40,
      onRefresh: _refresh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 5, child: _buildScrollHorizontal(context)),
          Container(
              margin: const EdgeInsets.all(10),
              child: const TextCustom(
                'Danh sách sự kiện',
                margin: EdgeInsets.all(0),
                typeText: TypeText.title,
                fontSize: Dimens.header,
              )),
          Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: Dimens.paddingView, right: Dimens.paddingView),
                child: _buildListEvent(),
              )),
        ],
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
