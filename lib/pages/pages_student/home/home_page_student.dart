import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:socialwork/utils/utils.dart';
import 'package:socialwork/widgets/text_custom_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../routes.dart';
import '../../../utils/constants.dart';

class HomePageStudent extends StatefulWidget {
  const HomePageStudent({Key? key}) : super(key: key);

  @override
  _HomePageStudentState createState() => _HomePageStudentState();
}

class _HomePageStudentState extends State<HomePageStudent> {
  Widget _appBarView() {
    return AppBar(
      backgroundColor: ConstColors.primary,
      elevation: 0,
      leading: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      title: const TextCustom(
        'Trang chủ',
        fontSize: Dimens.bigText1,
        color: Colors.white,
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.white),
          onPressed: () {
            context.vxNav.push(Uri.parse(RoutesPath.notificationRoute));
          },
        ),
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.white),
          onPressed: () {
            AppUtilsPopup.showBottomSheetPopup(
              context: context,
              title: 'Bạn muốn thoát hả?',
              onConfirmClick: () {
                Navigator.pop(context);
                context.vxNav.clearAndPush(Uri.parse(RoutesPath.loginRoute));
              },
              onCancelClick: () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ],
    );
  }

  Widget _iconFlow(Icon icon, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: icon),
        const SizedBox(
          height: 10,
        ),
        TextCustom(
          title,
          typeText: TypeText.body,
          textAlign: TextAlign.center,
          margin: const EdgeInsets.all(0),
          fontSize: Dimens.nav,
        ),
      ],
    );
  }

  Widget _buildListIconMenu() {
    Icon _iconNews = const Icon(
      Icons.wysiwyg_outlined,
      size: 40,
      color: ConstColors.orange,
    );
    Icon _iconQr = const Icon(
      Icons.qr_code,
      size: 40,
      color: ConstColors.orange,
    );
    Icon _iconUser = const Icon(
      Icons.account_box_outlined,
      size: 40,
      color: ConstColors.orange,
    );
    Icon _iconHistory = const Icon(
      Icons.history_edu_outlined,
      size: 40,
      color: ConstColors.orange,
    );
    return GridView.extent(
      shrinkWrap: true,
      maxCrossAxisExtent: 120,
      padding: const EdgeInsets.all(10),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: [
        InkWell(
          child: _iconFlow(_iconNews, "Bảng tin"),
          onTap: () {
            context.vxNav.push(Uri.parse(RoutesPath.newsRoute));
          },
        ),
        InkWell(
          child: _iconFlow(_iconQr, "Quét QR"),
          onTap: () {
            context.vxNav.push(Uri.parse(RoutesPath.qrScanRoute));
          },
        ),
        InkWell(
          child: _iconFlow(_iconUser, "Thông tin"),
          onTap: () {
            context.vxNav.push(Uri.parse(RoutesPath.informationRoute));
          },
        ),
        InkWell(
          child: _iconFlow(_iconHistory, "Lịch sử"),
          onTap: () {
            context.vxNav.push(Uri.parse(RoutesPath.historyRoute));
          },
        ),
      ],
    );
  }

  Widget _viewPercentSmall(
      String title, double val, double val2, double percent, Color color) {
    String inValu = val.toStringAsFixed(2);
    double valu = double.parse(inValu);
    String inValu2 = val2.toStringAsFixed(2);
    double valu2 = double.parse(inValu2);

    double totalValu = val / val2 * 100;
    String inTotalValu = totalValu.toStringAsFixed(2);
    totalValu = double.parse(inTotalValu);
    return CircularPercentIndicator(
      radius: 60.0,
      animation: true,
      animationDuration: 1200,
      lineWidth: 15.0,
      percent: percent,
      center: Align(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            '$valu/$valu2',
            style:
                const TextStyle(fontSize: 20, color: ConstColors.primary),
          ),
          Text(
            '$totalValu%',
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      )),
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor: Colors.black.withOpacity(0.1),
      progressColor: color,
    );
  }

  Widget _viewPercentLarge(
      String title, double val, double val2, double percent, Color color) {
    return CircularPercentIndicator(
      radius: 76.0,
      animation: true,
      animationDuration: 1200,
      lineWidth: 15.0,
      percent: percent,
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor: Colors.black.withOpacity(0.1),
      progressColor: color,
    );
  }

  Widget _viewPercentLargeMax(String title, double val, double val2) {
    return CircularPercentIndicator(
      radius: 92.0,
      animation: true,
      animationDuration: 1200,
      lineWidth: 15.0,
      percent: (val - val2 * 2) / val2,
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor: Colors.black.withOpacity(0.1),
      progressColor: ConstColors.primary,
    );
  }

  Widget _getPercentForStack(String title, double val, double val2) {
    if (val / val2 > 2) {
      return Stack(
        alignment: Alignment.center,
        children: [
          _viewPercentSmall(
              title, val, val2, 1.0, ConstColors.blue),
          _viewPercentLarge(title, val, val2, 1.0, ConstColors.green),
          _viewPercentLargeMax(title, val, val2)
        ],
      );
    } else if (val / val2 > 1) {
      return Stack(
        alignment: Alignment.center,
        children: [
          _viewPercentSmall(
              title, val, val2, 1.0, ConstColors.blue),
          _viewPercentLarge(
              title, val, val2, ((val - val2) / val2), ConstColors.primary),
        ],
      );
    } else {
      return _viewPercentSmall(title, val, val2, val / val2, ConstColors.primary);
    }
  }

  Widget _buildPercentWork() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getPercentForStack('Ngày công', 21.5, 10),
          const WidthBox(20),
          _getPercentForStack('Năm học', 2700 / 365, 1460 / 365),
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: ConstColors.lightGray2,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextCustom(
              'Chức năng',
              typeText: TypeText.title,
              fontSize: Dimens.iconNav,
              margin: EdgeInsets.only(
                  left: Dimens.marginView, top: Dimens.marginView),
            ),
            _buildListIconMenu(),
            const TextCustom(
              'Mục tiêu',
              typeText: TypeText.title,
              fontSize: Dimens.iconNav,
              margin: EdgeInsets.only(left: Dimens.marginView),
            ),
            const HeightBox(Dimens.marginView),
            _buildPercentWork(),
          ],
        ));
  }

  Widget _buildQrView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextCustom(
          'TRA CỨU THÔNG TIN',
          fontSize: Dimens.bigText1,
        ),
        QrImage(
          data: "Hello",
          size: 200,
          backgroundColor: Colors.white,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ConstColors.blue,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0), child: _appBarView()),
      body: SingleChildScrollView(
        reverse: false,
        child: SizedBox(
          width: size.width,
          height: size.height - 50,
          child: Column(children: [
            _buildQrView(),
            const HeightBox(Dimens.marginView),
            Expanded(child: _buildMenu()),
          ]),
        ),
      ),
    );
  }
}
