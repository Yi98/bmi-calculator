import 'package:flutter/material.dart';
import 'dart:math';

import 'global.dart';
import 'sizeConfig.dart';

class ResultWidget extends StatelessWidget {
  ResultWidget({Key key, this.userWeight, this.userHeight}) : super(key: key);

  double userWeight;
  double userHeight;

  @override
  Widget build(BuildContext context) {
    double result = (userWeight / pow(userHeight / 100, 2));

    String heroIndicator;
    String resultIndicator;
    Color colorIndicator;
    String termIndicator;
    bool success = false;

    if (result < 18.5) {
      resultIndicator = 'assets/images/underweight.png';
      colorIndicator = Color(0xff1976D2);
      termIndicator = 'underweight';
    } else if (result >= 18.5 && result <= 24.9) {
      resultIndicator = 'assets/images/normal.png';
      colorIndicator = Color(0xff388E3C);
      termIndicator = 'normal';
      success = true;
    } else if (result >= 25 && result <= 29.9) {
      resultIndicator = 'assets/images/overweight.png';
      colorIndicator = Color(0xffFF8000);
      termIndicator = 'overweight';
    } else if (result >= 30) {
      resultIndicator = 'assets/images/obese.png';
      colorIndicator = Color(0xffFF5252);
      termIndicator = 'obese';
    }

    if (global.selectedGender == 'girl') {
      if (success) {
        heroIndicator = 'assets/images/result_girl.png';
      } else {
        heroIndicator = 'assets/images/result_girl_fail.png';
      }
    }
    if (global.selectedGender == 'boy') {
      if (success) {
        heroIndicator = 'assets/images/result_boy.png';
      } else {
        heroIndicator = 'assets/images/result_boy_fail.png';
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 2.5,
                left: SizeConfig.blockSizeHorizontal * 3.5,
              ),
              alignment: Alignment.topLeft,
              child: Container(
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 7,
              ),
              alignment: Alignment.topLeft,
              child: Text(
                'Your BMI result',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.blockSizeHorizontal * 6,
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 7,
                  ),
                  child: Image.asset(
                    heroIndicator,
                    height: SizeConfig.blockSizeVertical * 40,
                  ),
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: SizeConfig.blockSizeHorizontal * 55,
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 41,
                    ),
                    padding: EdgeInsets.all(
                      SizeConfig.blockSizeHorizontal * 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.grey[300],
                          offset: Offset(1, 1),
                        ),
                      ], // make rounded corner of border
                    ),
                    child: Text(
                      'Your weight is ' + termIndicator,
                      style: TextStyle(
                        color: colorIndicator,
                        fontSize: SizeConfig.blockSizeHorizontal * 4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 10,
              ),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    resultIndicator,
                    width: SizeConfig.blockSizeHorizontal * 85,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SizeConfig.blockSizeHorizontal * 3,
                    ),
                    child: Text(
                      'Your BMI is ' + result.toStringAsPrecision(3),
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 5,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
