import 'package:chstore/const/colors.dart';
import 'package:chstore/const/customButton.dart';
import 'package:chstore/const/customInput.dart';
import 'package:chstore/const/textSize.dart';
import 'package:chstore/const/textStyle.dart';
import 'package:flutter/material.dart';

class Register_PasswordPage extends StatefulWidget {
  const Register_PasswordPage({super.key});

  @override
  State<Register_PasswordPage> createState() => _Register_PasswordPageState();
}

class _Register_PasswordPageState extends State<Register_PasswordPage> {
  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();

  late Map<String, dynamic> args;

  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    super.didChangeDependencies();
  }

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
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text(
                'Tạo mật khẩu',
                text_size_header,
                Colors.black,
                FontWeight.bold,
              ),
              text(
                'Tạo mật khẩu gồm ít nhất 6 chữ cái hoặc chữ số. Bạn nên chọn mật khẩu thật khó đoán.',
                text_size_content,
                Colors.black,
                null,
                null,
                null,
                5,
                null,
                TextAlign.left,
              ),
              SizedBox(height: size.height * 0.03),
              // FORM
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    customInput(
                      passwordController,
                      'Mật khẩu',
                      size.width,
                      true,
                      'Vui lòng nhập mật khẩu',
                      _obscureText,
                      (bool value) {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    SizedBox(height: size.height * 0.03),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          print('-------------------------------------------');
                          print('Name: ${args['nameUser']}');
                          print('PhoneNumber: ${args['phoneNumber']}');
                          print('emailUser: ${args['emailUser']}');
                          print('address: ${args['address']}');
                          print('password: ${passwordController.text}');
                          print('======================================');
                          // Navigator.pushNamed(
                          //   context,
                          //   '/',
                          //   arguments: {
                          //     'address': passwordController.text,
                          //   },
                          // );
                        }
                      },
                      child: customButton(
                        'Tiếp',
                        mau_xanh_dam,
                        Colors.white,
                        size.width,
                        10,
                        10,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.47),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/LoginPage');
                  },
                  child: text(
                    'Tôi đã có tài khoản rồi',
                    text_size_content,
                    mau_xanh_dam,
                    FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
