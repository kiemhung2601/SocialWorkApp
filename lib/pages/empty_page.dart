import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/constants.dart';
import '../widgets/text_custom_widget.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
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
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeightBox(MediaQuery.of(context).size.height * 0.2),
            Icon(Icons.build_rounded, size: MediaQuery.of(context).size.width),
            const HeightBox(30),
            const TextCustom(
              'Chức năng này hiện chưa hỗ trợ,\nvui lòng quay lại sau!',
              typeText: TypeText.body,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
