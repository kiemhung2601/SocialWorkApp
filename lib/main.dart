

import 'package:flutter/material.dart';
import 'package:socialwork/pages/get_start_page.dart';
import 'package:socialwork/pages/login_page.dart';
import 'package:socialwork/pages/pages_student/information_student_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        '/informationStudentPage': (context) => const InformationStudentPage(),
      },
      home: const CheckGetStarted(),
    );
  }
}

class CheckGetStarted extends StatefulWidget {
  const CheckGetStarted({Key? key}) : super(key: key);

  @override
  CheckGetStartedState createState() => CheckGetStartedState();
}

class CheckGetStartedState extends State<CheckGetStarted> {
  bool? _checkGetStarted;

  @override
  void initState(){
    super.initState();
    _loadcheckGetStarted();
  }


  void _loadcheckGetStarted() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _checkGetStarted = prefs.getBool('_checkGetStartedKey') ?? true;
    });
  }

  void _setcheckGetStarted() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('_checkGetStartedKey', false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_checkGetStarted == true){
      _setcheckGetStarted();
      return const GetStartPage();
    }
    else {
      return const LoginPage();
    }
  }
}

