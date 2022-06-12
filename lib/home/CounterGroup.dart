import 'package:flutter/material.dart';
import 'CounterWidget.dart';

class CounterGroup extends StatelessWidget {
  const CounterGroup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GroupRow();
  }
}

class GroupRow extends StatelessWidget {
  const GroupRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CounterWidget(
          number: 1655,
          color: Colors.orange,
          title: "Infetti",
        ),
        CounterWidget(
          number: 325,
          color: Colors.red,
          title: "Morti",
        ),
        CounterWidget(
          number: 636,
          color: Colors.green,
          title: "Guariti",
        ),
      ],
    );
  }
}
