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
                'Hãy cho chúng tôi biết địa chỉ Email của bạn',
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
                      'chstore123@gmail.com',
                      size.width * 0.7,
                      false,
                      'Vui lòng nhập email',
                    ),
                    SizedBox(height: size.height * 0.01),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(
                            context,
                            '/Register_NumberPhonePage',
                            arguments: {
                              'emailUser': emailController.text,
                            },
                          );
                        }
                      },
                      child: customButton(
                        'Tiếp tục',
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
            ],
          ),
        ),
      ),
    );
  }
}
