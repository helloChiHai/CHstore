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

  TextEditingController addressController = TextEditingController();

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
                'Bạn đang ở đâu?',
                text_size_header,
                Colors.black,
                FontWeight.bold,
              ),
              text(
                'Nhập địa chỉ của bạn để chúng tôi tiện giao hàng.',
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
                      addressController,
                      'Địa chỉ',
                      size.width,
                      false,
                      'Vui lòng nhập địa chỉ',
                    ),
                    SizedBox(height: size.height * 0.03),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          print('-------------------------------------------');
                          print('Name: ${args['nameUser']}');
                          print('PhoneNumber: ${args['phoneNumber']}');
                          print('emailUser: ${args['emailUser']}');
                          print('address: ${addressController.text}');
                          print('======================================');
                          Navigator.pushNamed(
                            context,
                            '/Register_PasswordPage',
                            arguments: {
                              'nameUser': args['nameUser'],
                              'phoneNumber': args['phoneNumber'],
                              'emailUser': args['emailUser'],
                              'address': addressController.text,
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
              SizedBox(height: size.height * 0.492),
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
