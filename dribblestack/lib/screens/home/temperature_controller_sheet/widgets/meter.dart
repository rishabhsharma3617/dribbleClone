import 'dart:async';
import 'dart:math' as math;
import 'package:dribblestack/services/responsive_service.dart';

import 'package:flutter/material.dart';

class Meter extends StatefulWidget {
  Meter({Key? key}) : super(key: key);

  @override
  _MeterState createState() => _MeterState();
}

class _MeterState extends State<Meter> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(children: [
          Stack(
            alignment: Alignment.center,
            children: [
              MeterMarks(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(150.toWidth),
                  border: Border.all(color: Colors.white, width: 0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: 230.toWidth,
                width: 230.toWidth,
                child: Padding(
                  padding: EdgeInsets.all(24.toHeight),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(150.toHeight),
                      border: Border.all(color: Colors.white, width: 0.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 10.toWidth,
                          blurRadius: 10.toWidth,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: '22',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 50.toFont,
                                  color: Theme.of(context).colorScheme.primary,
                                )),
                            TextSpan(
                                text: '°c',
                                style: TextStyle(
                                  fontSize: 22.toFont,
                                  color: Theme.of(context).colorScheme.primary,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 35.toHeight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '14°c',
                        style:
                            TextStyle(color: Colors.grey, fontSize: 18.toFont),
                      ),
                      SizedBox(
                        width: 240.toWidth,
                      ),
                      Text(
                        ' 28°c',
                        style:
                            TextStyle(color: Colors.grey, fontSize: 18.toFont),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ])
      ],
    );
  }
}

class MeterMarks extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<MeterMarks> {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -math.pi / 2,
      child: Container(
        width: 260.toWidth,
        height: 260.toWidth,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

double degreeToRadians(double degree) {
  return (math.pi / 180) * degree;
}

double radiansToDegrees(double radians) {
  return radians * (180 / math.pi);
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  //60 sec - 360, 1 sec - 6degree
  //12 hours  - 360, 1 hour - 30degrees, 1 min - 0.5degrees

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;

    var radius = math.min(centerX, centerY) - 10;

    var dashBrushblack = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    var dashBrushblackmid = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;
    var dashBrushgrey = Paint()
      ..color = Colors.grey.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    var outerCircleRadius = radius + 18;
    var innerCircleRadius = radius + 13;
    for (double i = 270; i < 459; i += 9) {
      if (i == 360) {
        var x1 =
            centerX + (outerCircleRadius + 4) * math.cos(i * math.pi / 180);
        var y1 =
            centerX + (outerCircleRadius + 7) * math.sin(i * math.pi / 180);

        var x2 = centerX + innerCircleRadius * math.cos(i * math.pi / 180);
        var y2 = centerX + innerCircleRadius * math.sin(i * math.pi / 180);
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrushblackmid);
      } else {
        var x1 = centerX + outerCircleRadius * math.cos(i * math.pi / 180);
        var y1 = centerX + outerCircleRadius * math.sin(i * math.pi / 180);

        var x2 = centerX + innerCircleRadius * math.cos(i * math.pi / 180);
        var y2 = centerX + innerCircleRadius * math.sin(i * math.pi / 180);
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2),
            i > 360 ? dashBrushgrey : dashBrushblack);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
