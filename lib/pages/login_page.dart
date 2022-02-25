import 'package:flutter/material.dart';
import 'package:socialwork/constant.dart';
import 'package:socialwork/pages/pages_student/home_page_student.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;

  Widget _buildLoginView(){
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Đăng nhập",
            style: TextStyle(
              color: Color(Constant.mainColor),
              fontSize: 46.0,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 50),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color(Constant.mainColor),
                hintText: "ID Student or Admin",
                prefixIcon: const Icon(Icons.account_circle)),
            validator: (String? value) {
              if(value!.isEmpty){
                return "Hãy nhập tài khoản vào";
              }
              if(!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$').hasMatch(value)){
                return "Nhập sai tài khoản";
              }
              if(value.length < 9 || value.length > 9){
                return "Tài khoản chỉ gồm 9 số";
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: _passwordVisible,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: const Color(Constant.mainColor),
              hintText: "Password",
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () => {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  }),
                },
              ),

            ),
            validator: (String? value) {
              if(value!.isEmpty){
                return "Hãy nhập mật khẩu vào";
              }
              if(value.contains(' ')){
                return "Mật khẩu không được phép có khoảng trắng";
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              minimumSize:
              MaterialStateProperty.all(const Size(500, 55)),
              backgroundColor:
              MaterialStateProperty.all(const Color(Constant.mainColor)),
              shadowColor:
              MaterialStateProperty.all(Colors.transparent),
            ),
            child: const Text(
              "Đăng nhập",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
            onPressed: () {
              if(formKey.currentState!.validate()){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const HomePageStudent()));
              }
            },
          ),
        ],
      ),
    );
  }

  // Widget _forgotPasswordView(Size size){
  //   return Align(
  //     alignment: Alignment.bottomCenter,
  //     child: Container(
  //       color: Colors.white,
  //       width: double.infinity,
  //       height: size.height * 0.1,
  //       child: Container(
  //         width: double.infinity,
  //         height: size.height * 0.1,
  //         decoration: const BoxDecoration(
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(100),
  //             topRight: Radius.circular(100),
  //           ),
  //           color: Color(Constant.mainColor),
  //         ),
  //         alignment: Alignment.center,
  //         child: InkWell(
  //           child: const Text(
  //             "Quên mật khẩu?",
  //             style: TextStyle(
  //                 fontSize: 15, fontWeight: FontWeight.w500),
  //           ),
  //           onTap: () => {},
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          child: Container(
            constraints:
                BoxConstraints(maxHeight: size.height, maxWidth: size.width),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: const [0.1, 0.2, 0.3, 0.4],
                colors: [
                  Colors.blue.shade500,
                  Colors.blue.shade400,
                  Colors.red.shade400,
                  Colors.red.shade300,
                ],
              ),
            ),
            child: Column(children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/plash.png',
                  width: 170,
                  height: 170,
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: _buildLoginView(),
                  ),
                ),
              ),
              // _forgotPasswordView(size),
            ]),
          ),
        ),
      ),
    );
  }
}
