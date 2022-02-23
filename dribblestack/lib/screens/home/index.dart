import 'package:dribblestack/screens/home/footer/index.dart.dart';
import 'package:dribblestack/screens/home/header/index.dart';
import 'package:dribblestack/screens/home/middle/index.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//@@@@ Defining static services for the Dribble UI
enum ApplianceService {
  temperatureControllerService,
  plugWallService,
  smartTvService
}

class _HomeScreenState extends State<HomeScreen> {
  //@@@@ Local state to store current activation status of a particular appliance--

  bool isTemperatureCardActive = true;
  bool isPlugWallActive = false;
  bool isSmartTvCardActive = false;

  //@@@ Local function to change the active state of the appliance service
  toggleApplianceServiceStatus(
      ApplianceService applianceService, bool newActiveStatus) {
    setState(() {
      switch (applianceService) {
        case ApplianceService.temperatureControllerService:
          isTemperatureCardActive = newActiveStatus;
          break;
        case ApplianceService.plugWallService:
          isPlugWallActive = newActiveStatus;
          break;
        case ApplianceService.smartTvService:
          isSmartTvCardActive = newActiveStatus;
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home_background2.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GreetingsHeader(userName: 'Christopher'),
                SizedBox(
                  height: 15,
                ),
                MiddleOptionsHeader(
                  isTemperatureCardActive: isTemperatureCardActive,
                  isPlugWallActive: isPlugWallActive,
                  isSmartTvCardActive: isSmartTvCardActive,
                  toggleServiceStatus: toggleApplianceServiceStatus,
                ),
                SizedBox(
                  height: 15,
                ),
                FooterSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
