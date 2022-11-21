import 'package:english_cards12/screens/home_%20page.dart';
import 'package:english_cards12/values/app_asset.dart';
import 'package:english_cards12/values/app_colors.dart';
import 'package:english_cards12/values/app_style.dart';
import 'package:flutter/material.dart';
import '';
class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome to',
              style: AppStyle.h3)
            )),
            Expanded(child: Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text('English', style: AppStyle.h2.copyWith(color: AppColors.textColor,fontWeight: FontWeight.bold)),),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(right: 25),
                    child: Text('Qoutes"',style: AppStyle.h3.copyWith(fontSize: 25.69),),
                  )
                ],
              )
            )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 90),
                child: RawMaterialButton(
                fillColor: AppColors.logoColor,
                shape: CircleBorder(),
                onPressed: (){
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (_) => HomePage()),
                          (route) => false);
                },
                child: Image.asset(AppAssets.right_arrow),
            ),
              ),
            )
          ],
        ),
      ),
    );
        
  }
}


