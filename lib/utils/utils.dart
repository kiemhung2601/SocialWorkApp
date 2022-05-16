import 'package:flutter/material.dart';

import '../widgets/button_custom_widget.dart';
import '../widgets/text_custom_widget.dart';

class AppUtilsPopup {
  static Future<bool> showBottomSheetPopup({required BuildContext context,
    String? title,
    String? titleConfirm,
    String? titleCancel,
    required VoidCallback onConfirmClick,
    required VoidCallback onCancelClick}) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  if (title != null && title.isNotEmpty) ...[
                    Center(
                        child: TextCustom(
                          title,
                          margin: const EdgeInsets.all(0),
                        )),
                    const SizedBox(height: 15),
                  ],
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          onPressed: onConfirmClick,
                          text: titleConfirm ?? 'Đồng ý',
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: SecondaryButton(
                          onPressed: onCancelClick,
                          text: titleConfirm ?? 'Chờ tí',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Theme
                  .of(context)
                  .canvasColor,
              borderRadius: const BorderRadius.only(
                topLeft:  Radius.circular(20),
                topRight:  Radius.circular(20),
              ),
            ),
          ),
        );
      },
    ) ??
        false;
  }
}

class DimenUtilsPX {
  static double pxToPercentage(BuildContext context, double value) {
    double width = MediaQuery.of(context).size.width;
    double percentageWidth = width / 375; // default: 812 x 375, iPhone 11 Pro
    return percentageWidth * value;
  }
}

