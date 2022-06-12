import 'package:covid_info/utils/JsonHandler.dart';
import 'package:flutter/material.dart';
import '../utils/JsonParser.dart';
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

class GroupRow extends StatefulWidget {
  GroupRow({
    Key? key,
  }) : super(key: key);

  @override
  State<GroupRow> createState() => _GroupRowState();
}

class _GroupRowState extends State<GroupRow> {
  final JsonHandler jh = JsonHandler();
  var infected = 0;
  var healed = 0;
  var deaths = 0;

  Future readJson() async {
    var jh = JsonHandler();
    var jP;
    jh.getJsonCasi().then((value) => {
          jP = JsonParser(value),
          print("\n\ncasi:\t" + jP.getInfected().toString()),
          infected = jP.getInfected(),
          healed = jP.getHealed(),
          deaths = jP.getDeaths()
        });
  }

  int getInfected() {
    return infected;
  }

  @override
  Widget build(BuildContext context) {
    readJson();

    return FutureBuilder(
      future: jh.getJsonCasi(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.hasError);
          print(snapshot);
          return const Center(
            child: Text('An error has occurred!'),
          );
        } else if (snapshot.hasData) {
          print(snapshot.data);

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CounterWidget(
                number: infected,
                color: Colors.orange,
                title: "Infetti",
              ),
              CounterWidget(
                number: deaths,
                color: Colors.red,
                title: "Totale decessi",
              ),
              CounterWidget(
                number: healed,
                color: Colors.green,
                title: "Totale Guariti",
              ),
            ],
          );

          //To do: return NewsList(news: snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
