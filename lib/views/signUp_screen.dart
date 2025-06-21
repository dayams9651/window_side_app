import 'package:desktop_code/common/widget/round_button.dart';
import 'package:desktop_code/const/image_strings.dart';
import 'package:desktop_code/style/color.dart';
import 'package:desktop_code/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_view.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 345,
              width: 800,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    // height: 300,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 60,),
                        Image.asset(
                          logo,
                        ),
                        Text("MsCorpress Automation",
                            style: AppTextStyles.kSmall8SemiBoldTextStyle),
                      ],
                    ),
                  ),
                  Container(
                    // height: 300,
                    width: 400,
                    decoration: BoxDecoration(
                      color: AppColors.info10,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topLeft: Radius.circular(25), bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          SizedBox(height: 35,),
                          Text('Login to continue', style: AppTextStyles.kSmall8SemiBoldTextStyle,),
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 33,
                            width: 250,
                            child: TextField(
                              // controller: ipAddController,
                              decoration: InputDecoration(
                                fillColor: AppColors.neutral20,
                                filled: true,
                                hintText: "Enter your mail",
                                hintStyle: AppTextStyles.kSmall6SemiBoldTextStyle,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 33,
                            width: 250,
                            child: TextField(
                              // controller: ipAddController,
                              decoration: InputDecoration(
                                fillColor: AppColors.neutral20,
                                filled: true,
                                hintText: "Enter your password",
                                hintStyle: AppTextStyles.kSmall6SemiBoldTextStyle,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          SizedBox(
                            height: 35,
                            width: 250,
                              child: RoundButton(title: "Login", onTap: (){
                                Get.to(HomeView());
                              }))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text('Powered by MsCorpress Automation', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}

