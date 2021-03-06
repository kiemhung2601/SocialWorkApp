import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../routes.dart';
import '../utils/constants.dart';
import '../widgets/text_custom_widget.dart';

class EventTab extends StatefulWidget {

  const EventTab(
      {Key? key,})
      : super(key: key);

  @override
  State<EventTab> createState() => _EventTabState();
}

class _EventTabState extends State<EventTab> {
  late Icon _iconTitle;
  late String _titleNotification;
  List type = [1, 1, 1, 1, 1, 1, 1, 1, 1];

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
      _iconTitle = const Icon(Icons.event_available,
          color: ConstColors.orange);
      _titleNotification = 'Sự kiện';
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
                  child: TextCustom(
                    _titleNotification,
                    typeText: TypeText.title,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: const [
                      TextCustom(
                        'Thứ 4, 23/02',
                        fontSize: Dimens.nav,
                        typeText: TypeText.body,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.access_alarm,
                        color: ConstColors.orange,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _viewLine(),
            const TextCustom(
              'Vừa có sự kiện mới',
              typeText: TypeText.title,
              margin: EdgeInsets.only(
                  bottom: Dimens.marginView, top: Dimens.marginView),
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
                  width: 5,
                ),
                TextCustom(
                  '0.5 ngày công',
                  typeText: TypeText.body,
                  fontSize: Dimens.nav,
                  margin: EdgeInsets.all(0),
                ),
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
        Expanded(child: _buildListNotification(),),
      ],
    );
  }
}
