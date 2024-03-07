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

  static TextEditingController emailController = TextEditingController();

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
                      emailController,
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
                          Future.delayed(Duration(milliseconds: 100), () {
                            Navigator.of(context)
                                .restorablePush(_dialogBuilder);
                          });
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

  @pragma('vm:entry-point')
  static Route<Object?> _dialogBuilder(
      BuildContext context, Object? arguments) {
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            'Chúng tôi không tìm thấy tài khoản của bạn. Bạn có muốn tạo tài khoản mới không?',
            style: TextStyle(
              fontSize: text_size_header_content,
              color: Colors.black,
            ),
          ),
          content: Text(
            'Có vẻ như ${emailController.text} không kết nối với tài khoản nào. Bạn có thẻ tạo tài khoản mới bằng số di động này hoặc thử lại.',
            style: const TextStyle(
              fontSize: text_size_content,
              color: Color.fromARGB(255, 64, 63, 63),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'THỬ LẠI',
                style: TextStyle(
                  fontSize: text_size_content,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'TẠO TÀI KHOẢN MỚI',
                style: TextStyle(
                  fontSize: text_size_content,
                  color: mau_xanh_dam,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/WelcomeCreateAccountPage');
              },
            ),
          ],
        );
      },
    );
  }
}
