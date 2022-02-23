import 'package:flutter/material.dart';

class TemperatureStatusCard extends StatelessWidget {
  String labelText;
  bool showColoredDot;
  Color dotColor;
  int temperature;
  TemperatureStatusCard({
    Key? key,
    required this.labelText,
    required this.temperature,
    this.showColoredDot = true,
    this.dotColor = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 105,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: '$labelText ',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                        showColoredDot
                            ? TextSpan(
                                text: '\u2022',
                                style: TextStyle(
                                    color: dotColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))
                            : TextSpan(text: ''),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: '$temperature',
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '°C',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            )),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
