import 'package:flutter/material.dart';
import 'package:socialwork/utils/constants.dart';
import 'package:socialwork/utils/utils.dart';

class BottomSheetErrorDialog extends StatelessWidget {
  static void show(BuildContext context, {Key? key, List<Widget>? children}) =>
      showModalBottomSheet(
          context: context,
          useRootNavigator: false,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => BottomSheetErrorDialog(
            key: key,
            children: children,
          )).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  final List<Widget>? children;

  const BottomSheetErrorDialog({Key? key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.close, size: DimenUtilsPX.pxToPercentage(context, 24),),
                        padding: EdgeInsets.zero,
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  // Image.asset(Images.errorDialog),
                  Icon(Icons.error_sharp, size: DimenUtilsPX.pxToPercentage(context, 32), color: ConstColors.primary,),
                  for (Widget item in children!) item,
                ]),
          ),
        ),
      ),
    );
  }
}

class LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {Key? key}) => showDialog<void>(
    context: context,
    useRootNavigator: false,
    barrierDismissible: false,
    builder: (_) => LoadingDialog(key: key),
  ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Container(
          color: Colors.transparent,
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(12.0),
          child: const RepaintBoundary(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
