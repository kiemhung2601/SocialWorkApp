import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialwork/pages/login/bloc/login_bloc.dart';
import 'package:socialwork/pages/login/bloc/login_status.dart';
import 'package:socialwork/utils/constants.dart';
import 'package:socialwork/widgets/button_custom_widget.dart';
import 'package:socialwork/widgets/text_custom_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../network/exceptions.dart';
import '../../routes.dart';
import '../../widgets/state_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;
  String? _userName = '141801830';
  String? _passWord = '176361';

  Widget _buildLoginView() {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextCustom(
            'Đăng nhập',
            fontSize: Dimens.bigText,
            color: ConstColors.primary,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 50),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: "ID Student or Admin",
                prefixIcon: const Icon(Icons.account_circle)),
            validator: (String? value) {
              if (value!.isEmpty) {
                return "Hãy nhập tài khoản vào";
              }
              if (!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                  .hasMatch(value)) {
                return "Nhập sai tài khoản";
              }
              if (value.length < 9 || value.length > 9) {
                return "Tài khoản chỉ gồm 9 số";
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _userName = value;
              });
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: _passwordVisible,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                // borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: "Mật khẩu",
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons
                      .visibility_off,
                ),
                onPressed: () =>
                {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  }),
                },
              ),
            ),
            validator: (String? value) {
              if (value!.isEmpty) {
                return "Hãy nhập mật khẩu vào";
              }
              if (value.contains(' ')) {
                return "Mật khẩu không được phép có khoảng trắng";
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _passWord = value;
              });
            },
          ),
          const HeightBox(20),
          SizedBox(
            width: double.infinity,
            child: PrimaryButton(
                text: 'Đăng Nhập',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginUserEvent(
                        studentId: _userName!, studentPwd: _passWord!));
                  }
                }),
          ),
          const HeightBox(40),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          body: Stack(
            children: [
              SizedBox(height: size.height, width: size.width),
              Image(
                  image: const AssetImage(
                    'assets/background.jpg',
                  ),
                  fit: BoxFit.cover,
                  height: size.height,
                  width: size.width),
              Positioned(
                top: size.width * 0.3,
                left: size.width * 0.1,
                right: size.width * 0.1,
                child: Image.asset(
                  'assets/plash.png',
                  width: 170,
                  height: 170,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  constraints: BoxConstraints(maxWidth: size.width),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: ConstColors.lightGray2,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(Dimens.paddingView),
                      child: BlocListener<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state.loginStatus is LoginStatusFail) {
                            ResponseError? resError = (state.loginStatus as LoginStatusFail).responseError;
                            Text? textShow;
                            if (resError?.errorCode == "400") {
                              textShow = const Text('Mật khẩu không đúng.\nVui lòng thử lại', style: TextStyle(fontSize: Dimens.body),);
                            } else if (resError?.errorCode == "401") {
                              textShow = const Text('Người dùng không tồn tại.\nVui lòng thử lại', style: TextStyle(fontSize: Dimens.body));
                            }
                            BottomSheetErrorDialog.show(context, children: [
                              const HeightBox(Dimens.marginView),
                              textShow ?? TextCustom(resError?.message),
                              const HeightBox(Dimens.marginView)
                            ]);
                            context.read<LoginBloc>().add(InitialEvent());
                          } else if(state.loginStatus is LoginStatusSuccess){
                            LoadingDialog.hide(context);
                            debugPrint("Đã đăng nhập");
                            Future.delayed(
                                Duration.zero, () => {context.vxNav.push(Uri.parse(RoutesPath.homeRoute))});
                          } else if (state.loginStatus is FormSubmitting) {
                            LoadingDialog.show(context);
                          }
                        },
                        child: _buildLoginView(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}
