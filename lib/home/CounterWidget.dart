import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final value = NumberFormat("#,###", "en_US");

class CounterWidget extends StatefulWidget {
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
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: widget.color.withOpacity(.26)),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: widget.color, width: 2),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "${value.format(widget.number)}",
          style: TextStyle(color: widget.color, fontSize: 20),
        ),
        Text(
          "${widget.title}",
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
