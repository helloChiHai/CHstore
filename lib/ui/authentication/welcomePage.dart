import 'package:chstore/const/customButton.dart';
import 'package:chstore/const/textSize.dart';
import 'package:chstore/const/textStyle.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text(
              'Chào mừng đến với cửa hàng hoa của Hải',
              text_size_header,
              Colors.black,
              FontWeight.bold,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/LoginPage');
              },
              child: customButton(
                'Mua sắm ngay',
                Color.fromARGB(255, 33, 245, 245),
                Colors.white,
                size.width * 0.6,
                10,
                10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
