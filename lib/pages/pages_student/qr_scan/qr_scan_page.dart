import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({Key? key}) : super(key: key);

  @override
  _QrScanPageState createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream
        // .listen((barcode) => setState(() => this.barcode = barcode));
        .listen((barcode) {
      if (mounted){
        setState(() => this.barcode = barcode);
        Navigator.popAndPushNamed(context, '/informationStudentPage');
      }
    });
  }

  Widget _buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderRadius: 10,
          borderColor: Colors.lightBlueAccent,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );

  Widget _buildResult() => Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white24,
        ),
        child: Text(
          barcode != null ? 'Result : ${barcode!.code}' : 'Scan a code',
          maxLines: 3,
          style: const TextStyle(color: Colors.white),
        ),
      );

  Widget _buildControlButtons() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white24),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                icon: FutureBuilder<bool?>(
                  future: controller?.getFlashStatus(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return const Icon(Icons.flash_off);
                    } else {
                      return Container();
                    }
                  },
                ),
                onPressed: () async {
                  await controller?.toggleFlash();
                  setState(() {});
                }),
            IconButton(
                icon: FutureBuilder(
                  future: controller?.getCameraInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return const Icon(Icons.switch_camera);
                    } else {
                      return Container();
                    }
                  },
                ),
                onPressed: () async {
                  await controller?.flipCamera();
                  setState(() {});
                }),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        _buildQrView(context),
        Positioned(bottom: 10, child: _buildResult()),
        Positioned(top: 10, child: _buildControlButtons())
      ],
    ));
  }
}
