import 'package:flutter/material.dart';
import 'dart:math';

import 'global.dart';

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
                top: 20.0,
                left: 13.0,
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
                left: 30.0,
              ),
              alignment: Alignment.topLeft,
              child: Text(
                'Your BMI result',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 25.0,
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                    top: 60.0,
                  ),
                  child: Image.asset(
                    heroIndicator,
                    height: 350.0,
                  ),
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 210.0,
                    margin: const EdgeInsets.only(top: 380.0),
                    padding: const EdgeInsets.all(10.0),
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
                      style: TextStyle(color: colorIndicator),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 100.0,
              ),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    resultIndicator,
                    width: 350.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: Text(
                      'Your BMI is ' + result.toStringAsPrecision(3),
                      style: TextStyle(
                        fontSize: 20.0,
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
