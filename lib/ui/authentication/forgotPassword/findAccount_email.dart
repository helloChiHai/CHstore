import 'package:chstore/const/colors.dart';
import 'package:chstore/const/customButton.dart';
import 'package:chstore/const/customInput.dart';
import 'package:chstore/const/textSize.dart';
import 'package:chstore/const/textStyle.dart';
import 'package:flutter/material.dart';

class FindAccountWithEmailPage extends StatefulWidget {
  const FindAccountWithEmailPage({super.key});

  @override
  State<FindAccountWithEmailPage> createState() =>
      _FindAccountWithEmailPageState();
}

class _FindAccountWithEmailPageState extends State<FindAccountWithEmailPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();

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
                'Tìm tài khoản',
                text_size_header,
                Colors.black,
                FontWeight.bold,
              ),
              text(
                'Nhập địa chỉ email của bạn.',
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
                      'Email',
                      size.width,
                      false,
                      'Vui lòng nhập email',
                    ),
                    SizedBox(height: size.height * 0.01),
                    SizedBox(height: size.height * 0.03),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // Navigator.pushNamed(
                          //   context,
                          //   '/Register_EmailPage',
                          //   arguments: {
                          //     'nameUser': args['nameUser'],
                          //     'phoneNumber': phoneNumberController.text,
                          //   },
                          // );
                        }
                      },
                      child: customButton(
                        'Tiếp tục',
                        mau_xanh_dam,
                        Colors.white,
                        size.width,
                        10,
                        10,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/FindAccountWithNumberPhonePage');
                      },
                      child: text(
                        'Tìm kiếm bằng số di động',
                        text_size_content,
                        Colors.black,
                        FontWeight.bold,
                      ),
                    )
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
