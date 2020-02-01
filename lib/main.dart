import 'package:bmi_calculator/weight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global.dart';
import 'sizeConfig.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  int currentValue = 0;
  String chosenFemale = 'assets/images/selected.png';
  String chosenMale = 'assets/images/not_selected.png';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                bottom: SizeConfig.blockSizeHorizontal * 7,
                left: SizeConfig.safeBlockHorizontal * 7,
                top: SizeConfig.safeBlockVertical * 4,
              ),
              margin: EdgeInsets.only(
                bottom: SizeConfig.safeBlockVertical,
              ),
              alignment: Alignment.topLeft,
              child: Text(
                'Select your gender',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.safeBlockHorizontal * 6,
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.safeBlockVertical * 22,
                    left: SizeConfig.safeBlockHorizontal * 8,
                    right: SizeConfig.safeBlockHorizontal * 8,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Image.asset(
                            widget.chosenFemale,
                            height: SizeConfig.safeBlockVertical * 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Image.asset(
                            widget.chosenMale,
                            height: SizeConfig.safeBlockVertical * 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 13,
                    left: SizeConfig.safeBlockHorizontal * 7,
                    right: SizeConfig.safeBlockHorizontal * 7,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Image.asset(
                            'assets/images/girl.png',
                            height: SizeConfig.safeBlockVertical * 23.5,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Image.asset(
                            'assets/images/boy.png',
                            height: SizeConfig.safeBlockVertical * 23.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    width: SizeConfig.safeBlockHorizontal * 85,
                    child: CupertinoSlidingSegmentedControl(
                      children: {
                        0: segmentControlOptions('Female'),
                        1: segmentControlOptions('Male'),
                      },
                      onValueChanged: (int newValue) {
                        setState(() {
                          widget.currentValue = newValue;
                          if (newValue == 0) {
                            widget.chosenFemale = 'assets/images/selected.png';
                            widget.chosenMale =
                                'assets/images/not_selected.png';
                            global.weightGender =
                                'assets/images/weight_girl.png';
                            global.heightGender =
                                'assets/images/height_girl.png';
                            global.selectedGender = 'girl';
                          } else if (newValue == 1) {
                            widget.chosenMale = 'assets/images/selected.png';
                            widget.chosenFemale =
                                'assets/images/not_selected.png';
                            global.weightGender =
                                'assets/images/weight_boy.png';
                            global.heightGender =
                                'assets/images/height_boy.png';
                            global.selectedGender = 'boy';
                          }
                        });
                      },
                      groupValue: widget.currentValue,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: Container(
          width: SizeConfig.safeBlockHorizontal * 16,
          height: SizeConfig.safeBlockVertical * 14,
          padding: EdgeInsets.only(
            bottom: SizeConfig.safeBlockVertical * 6,
          ),
          child: FloatingActionButton(
            backgroundColor: global.themeColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WeightWidget(),
                ),
              );
            },
            child: Icon(Icons.arrow_forward),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

Widget segmentControlOptions(String gender) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: SizeConfig.safeBlockVertical * 2,
    ),
    child: Text(
      gender,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: SizeConfig.safeBlockVertical * 2.5,
      ),
    ),
  );
}
