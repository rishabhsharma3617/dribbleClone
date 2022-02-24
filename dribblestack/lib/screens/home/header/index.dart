import 'package:dribblestack/common_widgets/glass_morphic_container.dart';
import 'package:dribblestack/services/responsive_service.dart';
import 'package:dribblestack/utils/constants/text_constants.dart'
    as textCconstants;
import 'package:flutter/material.dart';

class GreetingsHeader extends StatelessWidget {
  final String userName;
  const GreetingsHeader({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textCconstants.wishingText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.toFont,
                ),
              ),
              SizedBox(
                height: 2.toHeight,
              ),
              Text(
                'Rishabh Sharma',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 27.toFont,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          InkWell(
              child: GlassContainer(
            width: 47.toWidth,
            height: 47.toWidth,
            child: Center(
              child: Icon(Icons.add, color: Colors.white, size: 23.toHeight),
            ),
          ))
        ],
      ),
    );
  }
}
