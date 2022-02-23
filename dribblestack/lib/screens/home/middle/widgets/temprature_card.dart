import 'package:dribblestack/common_widgets/glass_morphic_container.dart';
import 'package:dribblestack/screens/home/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class TemperatureCard extends StatelessWidget {
  final bool isActive;
  final Function toggleActiveStatus;
  const TemperatureCard(
      {Key? key, required this.isActive, required this.toggleActiveStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      disableMorphicEffect: isActive,
      width: double.infinity,
      height: 250,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Home\nTemperature',
              style: TextStyle(
                  color: isActive ? Colors.black : Colors.white, fontSize: 20),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: '23',
                      style: TextStyle(
                        fontSize: 65,
                        color: isActive ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(
                      text: ' °C',
                      style: TextStyle(
                        fontSize: 30,
                        color: isActive ? Colors.black : Colors.white,
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterSwitch(
                  value: isActive,
                  height: 33,
                  toggleSize: 30,
                  width: 62,
                  padding: 2,
                  onToggle: (newActiveStatus) => toggleActiveStatus(
                      ApplianceService.temperatureControllerService,
                      newActiveStatus),
                ),
                Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}
