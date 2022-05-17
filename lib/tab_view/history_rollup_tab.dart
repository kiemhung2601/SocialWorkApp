import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../routes.dart';
import '../utils/constants.dart';
import '../widgets/text_custom_widget.dart';

class RollUpTab extends StatefulWidget {

  const RollUpTab(
      {Key? key,})
      : super(key: key);

  @override
  State<RollUpTab> createState() => _RollUpTabState();
}

class _RollUpTabState extends State<RollUpTab> {

  late Icon _iconTitle;
  late String _titleHistory;
  List type = [3, 3, 3, 3, 3, 3, 3, 3, 3];

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
      _iconTitle = const Icon(
        Icons.check_circle_outline,
        color: Colors.green,
      );
      _titleHistory = 'Đăng ký thành công';
    } else if (type == 2) {
      _iconTitle = const Icon(Icons.remove_circle_outline, color: Colors.red);
      _titleHistory = 'Hủy đăng ký thành công';
    } else {
      _iconTitle = const Icon(
        Icons.local_fire_department,
        color: ConstColors.blue,
      );
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
        padding: const EdgeInsets.all(Dimens.paddingView),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: const [
                Expanded(
                    flex: 1,
                    child: Icon(Icons.date_range, color: ConstColors.orange)),
                Expanded(
                    flex: 1,
                    child: Icon(Icons.alarm, color: ConstColors.orange))
              ],
            ),
            Row(
              children: const [
                Expanded(
                    flex: 1,
                    child: Align(
                        child: TextCustom(
                          '25/02/2022',
                          typeText: TypeText.title,
                          fontSize: Dimens.title,
                          // margin: EdgeInsets.all(0),
                        ))),
                Expanded(
                    flex: 1,
                    child: Align(
                        child: TextCustom(
                          '16:20',
                          typeText: TypeText.title,
                          fontSize: Dimens.title,
                          margin: EdgeInsets.all(0),
                        )))
              ],
            ),
            _viewLine(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextCustom(
                  _titleHistory,
                  typeText: TypeText.title,
                  fontSize: Dimens.title,
                  // margin: EdgeInsets.all(0),
                ),
                const SizedBox(
                  width: 10,
                ),
                _iconTitle,
              ],
            ),
            const TextCustom(
              'Sự kiện Open DNTU 2022 tháng 06 sẽ diễn ra tại DNTU',
              typeText: TypeText.body,
              fontSize: Dimens.nav,
              margin: EdgeInsets.only(bottom: Dimens.marginView),
            ),
            Row(
              children: const [
                Icon(
                  Icons.date_range,
                  color: ConstColors.orange,
                ),
                SizedBox(
                  width: 10,
                ),
                TextCustom(
                  'Ngày công: 0.5',
                  typeText: TypeText.body,
                  fontSize: Dimens.nav,
                  margin: EdgeInsets.all(0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListHistory() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: type.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                child: _viewHistory(type[index]),
                onTap: () {
                  context.vxNav.push(Uri.parse(RoutesPath.detailsRoute));
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
    return Column(
      children: [
        Expanded(child: _buildListHistory(),),
      ],
    );
  }
}
