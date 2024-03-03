import 'package:chstore/const/colors.dart';
import 'package:chstore/const/customButton.dart';
import 'package:chstore/const/customInput.dart';
import 'package:chstore/const/textSize.dart';
import 'package:chstore/const/textStyle.dart';
import 'package:flutter/material.dart';

class Register_EmailPage extends StatefulWidget {
  const Register_EmailPage({super.key});

  @override
  State<Register_EmailPage> createState() => _Register_EmailPageState();
}

class _Register_EmailPageState extends State<Register_EmailPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

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
                'Email của bạn là gì?',
                text_size_header,
                Colors.black,
                FontWeight.bold,
              ),
              text(
                'Nhập email có thể dùng để liên hệ với bạn. Thông tin này sẽ không hiển thị với ai khác.',
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
              // FORM ĐĂNG NHẬP
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    customInput(
                      emailController,
                      'Email',
                      size.width,
                      false,
                      'Vui lòng nhập email',
                    ),
                    SizedBox(height: size.height * 0.03),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          print('Name: ${args['nameUser']}');
                          print('PhoneNumber: ${args['phoneNumber']}');
                          print('Email: ${emailController.text}');
                          Navigator.pushNamed(
                            context,
                            '/Register_AddressPage',
                            arguments: {
                              'emailUser': emailController.text,
                              'nameUser': args['nameUser'],
                              'phoneNumber': args['phoneNumber'],
                            },
                          );
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
