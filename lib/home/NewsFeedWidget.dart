import 'package:covid_info/utils/CovidWebScraper.dart';
import 'package:covid_info/utils/JsonHandler.dart';
import 'package:flutter/material.dart';

class NewsFeedWidget extends StatefulWidget {
  NewsFeedWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<NewsFeedWidget> createState() => _NewsFeedWidgetState();
}

class _NewsFeedWidgetState extends State<NewsFeedWidget> {
  Map<String, List<String>> res = {
    'news': ['Nothing yet'],
    'titles': ['Nothing yet']
  };

  final jH = JsonHandler();
  final cws = CovidWebScraper();

  @override
  void initState() {
    cws.getResults().then((onValue) => res = onValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: cws.getResults(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.hasError);
          print(snapshot);
          return const Center(
            child: Text('An error has occurred!'),
          );
        } else if (snapshot.hasData) {
          print("\n\n\n\n\n SNAPSHOT \n\n\n\n\n\n");
          print(snapshot.data);

          //Mock up data

          print("\n\n\n\n\nRES!!!!!!!!\n\n\n\n");

          print(res);

          //JsonParser jP = JsonParser();
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            height: 250,
            child: Scrollbar(
              child: ListView.builder(
                itemBuilder: (BuildContext, index) {
                  return Card(
                    color: Colors.white10,
                    borderOnForeground: true,
                    child: ListTile(
                      title: Text(
                        res['titles']!.elementAt(index).toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        res['news']!.elementAt(index).toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  );
                },
                itemCount: res['titles']!.length,
                scrollDirection: Axis.vertical,
              ),
            ),
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
