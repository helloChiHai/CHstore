import 'package:chstore/const/colors.dart';
import 'package:chstore/const/customButton.dart';
import 'package:chstore/const/customInput.dart';
import 'package:chstore/const/textSize.dart';
import 'package:chstore/const/textStyle.dart';
import 'package:flutter/material.dart';

class Register_NumberPhonePage extends StatefulWidget {
  const Register_NumberPhonePage({super.key});

  @override
  State<Register_NumberPhonePage> createState() =>
      _Register_NumberPhonePageState();
}

class _Register_NumberPhonePageState extends State<Register_NumberPhonePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();

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
                'Số di động của bạn là gì?',
                text_size_header,
                Colors.black,
                FontWeight.bold,
              ),
              text(
                'Nhập số di động có thể dùng để liên hệ với bạn. Thông tin này sẽ không hiển thị với ai khác.',
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
                      phoneNumberController,
                      'Nhập số điện thoại',
                      size.width,
                      false,
                      'Vui lòng nhập SDT',
                      null,
                      null,
                      TextInputType.phone,
                    ),
                    SizedBox(height: size.height * 0.03),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          print('Name: ${args['nameUser']}');
                          print('Number phone: ${phoneNumberController.text}');
                          Navigator.pushNamed(
                            context,
                            '/Register_EmailPage',
                            arguments: {
                              'nameUser': args['nameUser'],
                              'phoneNumber': phoneNumberController.text,
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
              SizedBox(height: size.height * 0.475),
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
