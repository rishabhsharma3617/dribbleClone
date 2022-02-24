import 'package:dribblestack/services/responsive_service.dart';
import 'package:flutter/material.dart';

class CurrentTemperatureVariableTile extends StatelessWidget {
  const CurrentTemperatureVariableTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current temp',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17.toFont,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5.toHeight,
            ),
            Row(
              children: [
                Icon(
                  Icons.arrow_drop_up,
                  size: 25.toHeight,
                  color: Colors.grey,
                ),
                RichText(
                    text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '24',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25.toFont,
                          color: Theme.of(context).colorScheme.primary,
                        )),
                    TextSpan(
                        text: '°C',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 20)),
                  ],
                ))
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Current humidity',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17.toFont,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5.toHeight,
            ),
            Row(
              children: [
                Icon(
                  Icons.arrow_drop_down,
                  size: 25.toHeight,
                  color: Colors.grey,
                ),
                RichText(
                    text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '54',
                        style: TextStyle(
                          fontSize: 25.toFont,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        )),
                    TextSpan(
                        text: '%',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 20.toFont)),
                  ],
                ))
              ],
            )
          ],
        )
      ],
    );
  }
}
