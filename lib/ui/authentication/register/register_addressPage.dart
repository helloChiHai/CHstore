import 'package:chstore/const/colors.dart';
import 'package:chstore/const/customButton.dart';
import 'package:chstore/const/customInput.dart';
import 'package:chstore/const/textSize.dart';
import 'package:chstore/const/textStyle.dart';
import 'package:flutter/material.dart';

class Register_AddressPage extends StatefulWidget {
  const Register_AddressPage({super.key});

  @override
  State<Register_AddressPage> createState() => _Register_AddressPageState();
}

class _Register_AddressPageState extends State<Register_AddressPage> {
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
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.1),
              text(
                'Hãy cho chúng tôi biết địa chỉ của bạn',
                text_size_header,
                Colors.black,
                FontWeight.bold,
              ),
              text(
                args['email'],
                text_size_header,
                Colors.black,
                FontWeight.bold,
              ),
              text(
                args['phoneNumber'],
                text_size_header,
                Colors.black,
                FontWeight.bold,
              ),
              SizedBox(height: size.height * 0.05),
              // FORM
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    customInput(
                      emailController,
                      'Ho Chi Minh city',
                      size.width * 0.7,
                      false,
                      'Vui lòng nhập địa chỉ',
                    ),
                    SizedBox(height: size.height * 0.01),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(
                            context,
                            '/',
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
