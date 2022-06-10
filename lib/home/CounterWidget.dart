import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final int number;
  final Color color;
  final String title;

  const CounterWidget({
    Key? key,
    required this.number,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: color.withOpacity(.26)),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: color, width: 2),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "$number",
          style: TextStyle(color: color, fontSize: 35),
        ),
        Text(
          "$title",
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
