import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialwork/pages/empty_page.dart';
import 'package:socialwork/pages/login/bloc/login_bloc.dart';
import 'package:socialwork/pages/login/login_page.dart';
import 'package:socialwork/pages/pages_student/details_news/details_news_page.dart';
import 'package:socialwork/pages/pages_student/history/history_student_page.dart';
import 'package:socialwork/pages/pages_student/home/home_page_student.dart';
import 'package:socialwork/pages/pages_student/information/information_student_page.dart';
import 'package:socialwork/pages/pages_student/news/news_student_page.dart';
import 'package:socialwork/pages/pages_student/notification/notification_student_page.dart';
import 'package:socialwork/pages/pages_student/qr_scan/qr_scan_page.dart';
import 'package:socialwork/pages/splash_page.dart';
import 'package:socialwork/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class MainFlowWidget extends StatefulWidget {
  const MainFlowWidget({Key? key}) : super(key: key);

  @override
  _MainFlowWidgetState createState() => _MainFlowWidgetState();
}

class _MainFlowWidgetState extends State<MainFlowWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        routeInformationParser: VxInformationParser(),
        routerDelegate: VxNavigator(
          routes: {
            "/": (_, __) => const MaterialPage(child: SplashScreenPage()),
            RoutesPath.loginRoute: (_, __) =>
                const MaterialPage(child: LoginPage()),
            RoutesPath.homeRoute: (_, __) => const MaterialPage(child: HomePageStudent()),
            RoutesPath.newsRoute: (_, __) => const MaterialPage(child: NewsStudentPage()),
            RoutesPath.qrScanRoute: (_, __) => const MaterialPage(child: QrScanPage()),
            RoutesPath.informationRoute: (_, __) => const MaterialPage(child: InformationStudentPage()),
            RoutesPath.historyRoute: (_, __) => const MaterialPage(child: HistoryStudentPage()),
            RoutesPath.notificationRoute: (_, __) => const MaterialPage(child: NotificationStudentPage()),
            RoutesPath.detailsRoute: (_, __) => const MaterialPage(child: DetailsNewsPage()),
          },
          notFoundPage: (_, __) => const MaterialPage(child: EmptyPage()),
        ),
      ),
    );
  }
}
