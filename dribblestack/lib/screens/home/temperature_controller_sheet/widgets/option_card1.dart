import 'package:dribblestack/services/responsive_service.dart';
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
    SizeConfig().init(context);
    return Container(
        height: 81.toHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.toHeight),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 15.toHeight, horizontal: 12.toWidth),
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
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.toFont,
                                color: Theme.of(context).colorScheme.primary)),
                        showColoredDot
                            ? TextSpan(
                                text: '\u2022',
                                style: TextStyle(
                                    color: dotColor,
                                    fontSize: 17.toFont,
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
                              fontWeight: FontWeight.w600,
                              fontSize: 28.toFont,
                              color: Theme.of(context).colorScheme.primary,
                            )),
                        TextSpan(
                            text: '°c',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 22.toFont,
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
