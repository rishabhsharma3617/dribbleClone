import 'package:dribblestack/screens/home/temperature_controller_sheet/widgets/current_temperature_tile.dart';
import 'package:dribblestack/screens/home/temperature_controller_sheet/widgets/meter.dart';
import 'package:dribblestack/screens/home/temperature_controller_sheet/widgets/option_card1.dart';
import 'package:dribblestack/screens/home/temperature_controller_sheet/widgets/option_card2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class TempertaureControllerSheet extends StatelessWidget {
  const TempertaureControllerSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 3,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Living Room',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Home Temperature',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    )
                  ],
                ),
                FlutterSwitch(
                  value: true,
                  height: 28,
                  toggleSize: 27.5,
                  width: 62,
                  padding: 1,
                  onToggle: (newActiveStatus) => {},
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Meter(),
            SizedBox(
              height: 25,
            ),
            CurrentTemperatureVariableTile(),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: TemperatureStatusCard(
                        labelText: 'Heating', temperature: 20)),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 1,
                    child: TemperatureStatusCard(
                        labelText: 'Cooling', temperature: 20)),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 1,
                    child: TemperatureStatusCard(
                      labelText: 'Airwave',
                      temperature: 20,
                      showColoredDot: false,
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: ApplianceStatusCard(
                      applianceName: 'Fan',
                      activeStatus: true,
                      applianceIcon: Icon(Icons.snowboarding),
                    )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 1,
                    child: ApplianceStatusCard(
                      applianceName: 'Cooler',
                      activeStatus: false,
                      applianceIcon: Icon(Icons.ac_unit_outlined),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
