import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'result.dart';
import 'global.dart';
import 'sizeConfig.dart';

class Heightwidget extends StatefulWidget {
  Heightwidget({Key key, this.userWeight}) : super(key: key);

  double sliderValue = 175;
  int height = global.height.toInt();
  double userWeight;

  @override
  _HeightwidgetState createState() => _HeightwidgetState();
}

class _HeightwidgetState extends State<Heightwidget> {
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
                'Select your height',
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
                bottom: SizeConfig.blockSizeVertical * 9,
              ),
              alignment: Alignment.topLeft,
              child: Text(
                'Drag the slider to select your height',
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: SizeConfig.blockSizeHorizontal * 20,
              ),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      global.heightGender,
                      height: SizeConfig.safeBlockVertical * 35.5,
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: SizeConfig.safeBlockHorizontal * 60,
                        top: SizeConfig.safeBlockVertical * 8.5,
                      ),
                      child: Text(
                        widget.height.toString() + ' cm',
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5,
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
                      onUpdateHeight('minus');
                    },
                  ),
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 65,
                    child: CupertinoSlider(
                      activeColor: global.themeColor,
                      min: 100.0,
                      max: 250.0,
                      value: widget.sliderValue,
                      onChanged: (newValue) {
                        setState(() {
                          widget.sliderValue = newValue;
                          widget.height = newValue.round();
                        });
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                    ),
                    onPressed: () {
                      onUpdateHeight('add');
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
                  builder: (context) => ResultWidget(
                    userWeight: widget.userWeight,
                    userHeight: widget.sliderValue,
                  ),
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

  void onUpdateHeight(String action) {
    setState(() {
      if (action == 'minus') {
        widget.sliderValue--;
        widget.height = widget.sliderValue.round();
      } else if (action == 'add') {
        widget.sliderValue++;
        widget.height = widget.sliderValue.round();
      }
    });
  }
}
