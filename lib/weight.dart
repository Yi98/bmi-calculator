import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'height.dart';
import 'global.dart';
import 'sizeConfig.dart';

class WeightWidget extends StatefulWidget {
  WeightWidget({Key key}) : super(key: key);

  double sliderValue = global.weight;
  int weight = global.weight.toInt();

  @override
  _WeightWidgetState createState() => _WeightWidgetState();
}

class _WeightWidgetState extends State<WeightWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: SizeConfig.safeBlockVertical * 2.5,
                left: SizeConfig.blockSizeHorizontal * 3.5,
              ),
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 7,
              ),
              alignment: Alignment.topLeft,
              child: Text(
                'Select your weight',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.blockSizeHorizontal * 6,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: SizeConfig.safeBlockVertical,
                left: SizeConfig.blockSizeHorizontal * 7.5,
              ),
              alignment: Alignment.topLeft,
              child: Text(
                'Drag the slider to select your weight',
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.safeBlockVertical * 10,
              ),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      global.weightGender,
                      height: SizeConfig.safeBlockVertical * 35.5,
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(
                        top: SizeConfig.safeBlockVertical * 31,
                      ),
                      child: Text(
                        widget.weight.toString() + ' kg',
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockVertical * 3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.safeBlockVertical * 9,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.remove,
                    ),
                    onPressed: () {
                      onUpdateWeight('minus');
                    },
                  ),
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 65,
                    child: CupertinoSlider(
                      activeColor: global.themeColor,
                      max: 150.0,
                      value: widget.sliderValue,
                      onChanged: (newValue) {
                        setState(() {
                          widget.sliderValue = newValue;
                          widget.weight = newValue.round();
                          global.weight = widget.weight.toDouble();
                        });
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                    ),
                    onPressed: () {
                      onUpdateWeight('add');
                    },
                  ),
                ],
              ),
            ),
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
                  builder: (context) =>
                      Heightwidget(userWeight: widget.sliderValue),
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

  void onUpdateWeight(String action) {
    setState(() {
      if (action == 'minus') {
        widget.sliderValue--;
        widget.weight = widget.sliderValue.round();
      } else if (action == 'add') {
        widget.sliderValue++;
        widget.weight = widget.sliderValue.round();
      }
    });
  }
}
