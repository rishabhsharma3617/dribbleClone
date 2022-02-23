import 'package:dribblestack/common_widgets/glass_morphic_container.dart';
import 'package:flutter/material.dart';

class GreetingsHeader extends StatelessWidget {
  final String userName;
  const GreetingsHeader({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Good Morning',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              const Text(
                'Rishabh Sharma',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              )
            ],
          ),
          InkWell(
              child: GlassContainer(
            width: 50,
            height: 50,
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
