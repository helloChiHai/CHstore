import 'package:chstore/const/colors.dart';
import 'package:chstore/const/customButton.dart';
import 'package:chstore/const/textSize.dart';
import 'package:chstore/const/textStyle.dart';
import 'package:flutter/material.dart';

class WelcomeCreateAccountPage extends StatefulWidget {
  const WelcomeCreateAccountPage({super.key});

  @override
  State<WelcomeCreateAccountPage> createState() =>
      _WelcomeCreateAccountPageState();
}

class _WelcomeCreateAccountPageState extends State<WelcomeCreateAccountPage> {
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
                'Tham gia CHstore',
                text_size_header,
                Colors.black,
                FontWeight.bold,
              ),
              SizedBox(height: size.height * 0.025),
              Container(
                width: size.width,
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              text(
                'Tạo tài khoản để dễ dàng mua sắm, khám phá những mặt hàng mới, đu trend.',
                text_size_content,
                Colors.black,
                null,
                null,
                null,
                3,
                null,
                TextAlign.left,
              ),
              SizedBox(height: size.height * 0.02),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/Register_NamePage',
                  );
                },
                child: customButton(
                  'Bắt đầu',
                  mau_xanh_dam,
                  Colors.white,
                  size.width,
                  10,
                  10,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/LoginPage');
                },
                child: customButton(
                  'Tôi đã có tài khoản rồi',
                  Colors.transparent,
                  Colors.black,
                  size.width,
                  10,
                  10,
                  20,
                  Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
