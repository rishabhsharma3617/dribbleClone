import 'package:flutter/material.dart';

class CurrentTemperatureVariableTile extends StatelessWidget {
  const CurrentTemperatureVariableTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Icon(Icons.ac_unit),
                RichText(
                    text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '24',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Colors.black)),
                    TextSpan(
                        text: '°C',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
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
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Icon(Icons.ac_unit),
                RichText(
                    text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '24',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Colors.black)),
                    TextSpan(
                        text: '°C',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
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
