import 'package:covid_info/json_handler.dart';
import 'package:flutter/material.dart';

class NewsFeedWidget extends StatelessWidget {
  final jH = json_handler();

  NewsFeedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: jH.getJsonNotizie(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.hasError);
          print(snapshot);
          return const Center(
            child: Text('An error has occurred!'),
          );
        } else if (snapshot.hasData) {
          print(snapshot.data);
          return Text("Retriving data...");
          //return NewsList(news: snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
