import 'dart:math';
import 'package:english_cards12/models/englishtoday.dart';
import 'package:english_cards12/values/app_asset.dart';
import 'package:english_cards12/values/app_colors.dart';
import 'package:english_cards12/values/app_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curentIndex = 0;
  PageController _pageController = PageController();

  List<EnglishToday> words = [];

  List<int> flixedListRandom ({int len = 1,int max = 120, int min = 1}) {
    if(len  > max || len < min)
      return [];
  }
  List<int> newList = [];
  Random random = Random();
  int count = 1;
  while ( count <= len) {
    int val = random.nextInt(max);
    if (newList.contains(val)){
  continue;
  }
    else {(newList.add(val));
    count++;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {},
          child: Image.asset(AppAssets.menu),
        ),
        title: Text('English today', style: AppStyle.h3.copyWith(
            fontSize: 36, color: AppColors.textColor),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
            child: Column(
              children: [
                Container(
                    height: size.height * 1 / 10,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      '"It is amazing how complete is the delusion that beauty is goodness."',
                      style: AppStyle.h5.copyWith(
                          color: AppColors.textColor, fontSize: 12),)
                ),
                Container(
                  height: size.height * 2 / 3,
                  child: PageView.builder(
                    controller: _pageController,
                      onPageChanged: (index){
                      setState((){
                        curentIndex = index;
                      });},
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset(AppAssets.heart),
                                alignment: Alignment.centerRight,
                              ),
                              RichText(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  text: const TextSpan(
                                      text: 'B',
                                      style: TextStyle(
                                          fontSize: 96,
                                          fontFamily: 'sen',
                                          fontWeight: FontWeight.bold,
                                          shadows: [BoxShadow(
                                            color: Colors.black38,
                                            offset: Offset(3, 6),
                                            blurRadius: 6,
                                          )
                                          ]
                                      ),
                                      children: [TextSpan(text: 'eautiful',
                                          style: TextStyle(
                                              fontSize: 64,
                                              fontFamily: 'sen',
                                              shadows: [Shadow(
                                                  color: Colors.black38,
                                                  offset: Offset(0, 0)
                                              )
                                              ]
                                          )
                                      ),
                                      ]
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 24),
                                child: Text(
                                  '“Think of all the beauty still left around you and be happy.”',
                                  style: AppStyle.h3.copyWith(
                                      color: Colors.black,
                                      fontSize: 28,
                                      letterSpacing: 1),),
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                ),

                SizedBox(
                  height: size.height * 1/14,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    height: 12,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                        itemBuilder: (context, index){
                        return buildIndicator(index == curentIndex, size);
                        }),
                  ),
                )],
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.backgroundColor,
        onPressed: () {},
        child: Image.asset(AppAssets.exchange),
      ),
    );
  }
    Widget buildIndicator(bool isActive,Size size){
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 8,
        width: isActive? size.width * 1/5: 24,
        decoration: BoxDecoration(
          color: isActive ? AppColors.controlColor : AppColors.greyColor,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(2,3),
              blurRadius: 3,
            )
          ]
        ),
      );
    }
  }

