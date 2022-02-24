import 'package:dribblestack/common_widgets/glass_morphic_container.dart';
import 'package:dribblestack/screens/home/index.dart';
import 'package:dribblestack/utils/constants/text_constants.dart'
    as textCconstants;
import 'package:dribblestack/services/responsive_service.dart';
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
    SizeConfig().init(context);
    return GlassContainer(
      disableMorphicEffect: isActive,
      width: double.infinity,
      height: 164.toHeight,
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: 17.toHeight, horizontal: 22.toWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textCconstants.homeTemperature,
              style: TextStyle(
                  color: isActive
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                  fontSize: 16.toFont),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: '23',
                      style: TextStyle(
                        fontSize: 50.toFont,
                        fontWeight: FontWeight.w500,
                        color: isActive
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                      )),
                  TextSpan(
                      text: ' °c',
                      style: TextStyle(
                        fontSize: 30.toFont,
                        color: isActive
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterSwitch(
                  value: isActive,
                  height: 20.toHeight,
                  activeColor: Theme.of(context).colorScheme.primaryVariant,
                  inactiveColor: Colors.white.withOpacity(0.3),
                  toggleSize: 18.5.toHeight,
                  width: 48.toWidth,
                  padding: 1.2.toWidth,
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
