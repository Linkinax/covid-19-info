import 'package:covid_info/utils/JsonHandler.dart';
import 'package:covid_info/utils/JsonParser.dart';
import 'package:flutter/material.dart';

class NewsFeedWidget extends StatelessWidget {
  final jH = JsonHandler();

  NewsFeedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: jH.getJsonCasi(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.hasError);
          print(snapshot);
          return const Center(
            child: Text('An error has occurred!'),
          );
        } else if (snapshot.hasData) {
          print(snapshot.data);

          var jP;
          jH.getJsonCasi().then((value) => {
                jP = JsonParser(value),
                print("\n\ncasi:\t" + jP.getInfected().toString()),
              });

          print("\n\n\nJson\n\n\n");

          //JsonParser jP = JsonParser();
          return Text("Data retrived!");
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
