import 'package:dribblestack/screens/home/index.dart';
import 'package:dribblestack/screens/home/temperature_controller_sheet/widgets/current_temperature_tile.dart';
import 'package:dribblestack/screens/home/temperature_controller_sheet/widgets/meter.dart';
import 'package:dribblestack/screens/home/temperature_controller_sheet/widgets/option_card1.dart';
import 'package:dribblestack/screens/home/temperature_controller_sheet/widgets/option_card2.dart';
import 'package:dribblestack/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class TempertaureControllerSheet extends StatelessWidget {
  bool isTempertaureCardActive;
  Function toggleActiveStatus;
  TempertaureControllerSheet(
      {Key? key,
      required this.isTempertaureCardActive,
      required this.toggleActiveStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ConstrainedBox(
      constraints: new BoxConstraints(
        minHeight: 0,
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.toWidth),
                topRight: Radius.circular(30.toWidth))),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.toWidth, 12.toHeight, 15.toWidth, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.toHeight),
                    child: Container(
                      height: 3.toHeight,
                      width: 35.toWidth,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              BorderRadius.all(Radius.circular(5.toWidth))),
                    ),
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 6.toHeight,
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
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 22.toFont,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 1.toHeight,
                              ),
                              Text(
                                'Home Temperature',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 14.toFont),
                              )
                            ],
                          ),
                          FlutterSwitch(
                            value: isTempertaureCardActive,
                            height: 20.toHeight,
                            toggleSize: 18.5.toHeight,
                            width: 48.toWidth,
                            activeColor:
                                Theme.of(context).colorScheme.primaryVariant,
                            inactiveColor: Colors.white.withOpacity(0.3),
                            padding: 1.2.toWidth,
                            onToggle: (newActiveStatus) => toggleActiveStatus(
                                ApplianceService.temperatureControllerService,
                                newActiveStatus),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35.toWidth,
                      ),
                      Meter(),
                      SizedBox(
                        height: 23.toHeight,
                      ),
                      CurrentTemperatureVariableTile(),
                      SizedBox(
                        height: 18.toHeight,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: TemperatureStatusCard(
                                  labelText: 'Heating', temperature: 20)),
                          SizedBox(
                            width: 8.toHeight,
                          ),
                          Expanded(
                              flex: 1,
                              child: TemperatureStatusCard(
                                  labelText: 'Cooling', temperature: 20)),
                          SizedBox(
                            width: 8.toHeight,
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
                        height: 8.toHeight,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: ApplianceStatusCard(
                                applianceName: 'Fan',
                                activeStatus: true,
                                applianceIcon: Icon(
                                  Icons.ac_unit,
                                  size: 25.toHeight,
                                  color: Colors.grey.withOpacity(0.4),
                                ),
                              )),
                          SizedBox(
                            width: 10.toWidth,
                          ),
                          Expanded(
                              flex: 1,
                              child: ApplianceStatusCard(
                                applianceName: 'Cooler',
                                activeStatus: false,
                                applianceIcon: Icon(
                                  Icons.ac_unit,
                                  size: 25.toHeight,
                                  color: Colors.grey.withOpacity(0.4),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.toHeight,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
