import 'package:flutter/material.dart';
import 'package:socialwork/widgets/button_custom_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../routes.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../../widgets/text_custom_widget.dart';

class DetailsNewsPage extends StatefulWidget {
  const DetailsNewsPage({Key? key}) : super(key: key);

  @override
  _DetailsNewsPageState createState() => _DetailsNewsPageState();
}

class _DetailsNewsPageState extends State<DetailsNewsPage> {
  Widget _buildAppBarView() {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      title: const TextCustom(
        'Chi tiết',
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



  Widget _viewLine() {
    return Align(
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

  Widget _buildAllDetails() {
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
        const HeightBox(Dimens.marginView),
        const TextCustom(
          'Sự kiện Open DNTU 2022 tháng 06 sẽ diễn ra tại DNTU',
          typeText: TypeText.title,
          fontSize: Dimens.bigText1,
          maxLines: null,
        ),
        const HeightBox(Dimens.marginView),
        _viewLine(),
        const HeightBox(Dimens.marginView),
        const Center(
          child: TextCustom(
            'Thông tin',
            typeText: TypeText.title,
            fontSize: Dimens.bigText1,
            margin: EdgeInsets.only(bottom: Dimens.marginView),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            TextCustom(
              'Ngày công: ',
              typeText: TypeText.body,
              fontSize: Dimens.title,
              margin: EdgeInsets.only(bottom: Dimens.marginView),
            ),
            TextCustom(
              '0.5 ngày công',
              typeText: TypeText.title,
              fontSize: Dimens.title,
              margin: EdgeInsets.only(bottom: Dimens.marginView),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            TextCustom(
              'Số lượng tham gia: ',
              typeText: TypeText.body,
              fontSize: Dimens.title,
              margin: EdgeInsets.only(bottom: Dimens.marginView),
            ),
            TextCustom(
              '30 sinh viên',
              typeText: TypeText.title,
              fontSize: Dimens.title,
              margin: EdgeInsets.only(bottom: Dimens.marginView),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            TextCustom(
              'Ngày bắt đầu: ',
              typeText: TypeText.body,
              fontSize: Dimens.title,
              margin: EdgeInsets.only(bottom: Dimens.marginView),
            ),
            TextCustom(
              '25/02/2022',
              typeText: TypeText.title,
              fontSize: Dimens.title,
              margin: EdgeInsets.only(bottom: Dimens.marginView),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            TextCustom(
              'Ngày tạo: ',
              typeText: TypeText.body,
              fontSize: Dimens.title,
              margin: EdgeInsets.only(bottom: Dimens.marginView),
            ),
            TextCustom(
              '21/02/2022',
              typeText: TypeText.title,
              fontSize: Dimens.title,
              margin: EdgeInsets.only(bottom: Dimens.marginView),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            TextCustom(
              'Người tạo: ',
              typeText: TypeText.body,
              fontSize: Dimens.title,
              margin: EdgeInsets.only(bottom: Dimens.marginView),
            ),
            TextCustom(
              'Đặng Kiếm Hùng',
              typeText: TypeText.title,
              fontSize: Dimens.title,
              margin: EdgeInsets.only(bottom: Dimens.marginView),
            ),
          ],
        ),
        const HeightBox(Dimens.marginView),
        _viewLine(),
        const HeightBox(Dimens.marginView),
        const Center(
          child: TextCustom(
            'Chi tiết chương trình',
            typeText: TypeText.title,
            fontSize: Dimens.bigText1,
            margin: EdgeInsets.only(bottom: Dimens.marginView),
          ),
        ),
        const TextCustom(
          'Chào các bạn, hôm nay trường chúng ta sẽ tổ chức chương trình tri ân học sinh, mở một party-night, open day, sẽ mời các ca sĩ về hát. Trường cần các bạn sinh viên hỗ trợ cho ngày hôm đó. Được tính 0.5 ngày công tác xã hội các bạn mau mau đăng ký nhé.',
          textAlign: TextAlign.justify,
          typeText: TypeText.body,
          fontSize: Dimens.body,
          hadMaxLines: false,
          maxLines: null,
          margin: EdgeInsets.only(bottom: Dimens.marginView),
        ),
        SizedBox(
            width: double.infinity,
            child: PrimaryButton(text: 'Đăng ký', onPressed: () {
              AppUtilsPopup.showBottomSheetPopup(
                context: context,
                title: 'Bạn có muốn đăng ký không?',
                onConfirmClick: () {
                  debugPrint('Đã đăng ký');
                },
                onCancelClick: () {
                  Navigator.pop(context);
                },
              );
            })),
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
            height: size.height * 0.3,
            decoration: const BoxDecoration(
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
              padding: const EdgeInsets.all(Dimens.paddingView),
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
