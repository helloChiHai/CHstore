import 'package:chstore/const/colors.dart';
import 'package:chstore/const/customButton.dart';
import 'package:chstore/const/customInput.dart';
import 'package:chstore/const/snackbar.dart';
import 'package:chstore/const/textSize.dart';
import 'package:chstore/const/textStyle.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mau_nen_xam,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: mau_nen_xam,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.1),
              text(
                'Đăng nhập',
                text_size_header,
                Colors.black,
                FontWeight.bold,
              ),
              SizedBox(height: size.height * 0.05),
              // FORM ĐĂNG NHẬP
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    customInput(
                      emailController,
                      'Email',
                      size.width * 0.7,
                      false,
                      'Vui lòng nhập email',
                    ),
                    SizedBox(height: size.height * 0.01),
                    customInput(
                        passwordController,
                        'Mật khẩu',
                        size.width * 0.7,
                        true,
                        'Vui lòng nhập mật khẩu',
                        _obscureText, (bool value) {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    }),
                    SizedBox(height: size.height * 0.03),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          showSnackBar(
                            context,
                            '${emailController.text} - ${passwordController.text}',
                          );
                        }
                      },
                      child: customButton(
                        'Đăng nhập',
                        mau_xanh_dam,
                        Colors.white,
                        size.width * 0.7,
                        10,
                        10,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                  ],
                ),
              ),
              // NÚT QUÊN MẬT KHẨU
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, '/FindAccountWithNumberPhonePage');
                },
                child: text(
                  'Bạn quên mật khẩu ư?',
                  text_size_discription,
                  Colors.black,
                  FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 1,
                        width: size.width,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  text(
                    'or',
                    text_size_discription,
                    Colors.black,
                    FontWeight.bold,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 1,
                        width: size.width,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              // ROW ĐĂNG NHẬP BẰNG FACEBOOK + GOOGLE
              SizedBox(height: size.height * 0.025),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.facebook,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: size.width * 0.03),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.g_mobiledata,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              // NÚT TẠO TÀI KHOẢN
              SizedBox(height: size.height * 0.05),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/WelcomeCreateAccountPage',
                  );
                },
                child: customButton(
                  'Tạo tài khoản',
                  Colors.transparent,
                  mau_xanh_dam,
                  size.width * 0.7,
                  10,
                  10,
                  20,
                  mau_xanh_dam,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
