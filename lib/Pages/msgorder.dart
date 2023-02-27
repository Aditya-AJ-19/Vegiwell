import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vegiwell/Utils/size_config.dart';
import 'package:vegiwell/Utils/style.dart';

class MsgToOrder extends StatelessWidget {
  const MsgToOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController orderController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: AppTheme.green,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: SizedBox(
          width: responsiveHeight(140),
          height: responsiveHeight(35),
          child: Image.asset(
            'assets/Images/vegiwellname.png',
            filterQuality: FilterQuality.high,
            fit: BoxFit.contain,
            color: Colors.white,
          ),
        ),
      ),
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: responsiveHeight(30),
            ),
            TextFormField(
              maxLines: 5,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              onSaved: (value) {
                orderController.text = value!;
              },
              decoration: InputDecoration(
                fillColor: AppTheme.numberfield,
                // fillColor: Colors.grey[200],
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(
                  responsiveWidth(20),
                  responsiveHeight(15),
                  responsiveWidth(20),
                  responsiveHeight(15),
                ),
                hintText: "Enter Order",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(responsiveWidth(15)),
                ),
              ),
            ),
            SizedBox(
              height: responsiveHeight(15),
            ),
            InkWell(
              onTap: () {},
              child: Ink(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    AppTheme.green,
                    AppTheme.lightGreen,
                  ]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  width: responsiveWidth(100),
                  height: responsiveHeight(50),
                  alignment: Alignment.center,
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: responsiveHeight(45),
            ),
            Text(
              "Tap To Give Order.",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: responsiveHeight(25),
                fontWeight: FontWeight.bold,
                color: Color(0xFFF16E35),
              ),
            ),
            SizedBox(
              height: responsiveHeight(45),
            ),
            GestureDetector(
              child: Icon(
                Icons.mic,
                color: Colors.green,
                size: responsiveHeight(200),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
