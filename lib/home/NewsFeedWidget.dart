import 'package:covid_info/utils/CovidWebScraper.dart';
import 'package:covid_info/utils/JsonHandler.dart';
import 'package:covid_info/utils/JsonParser.dart';
import 'package:flutter/material.dart';

class NewsFeedWidget extends StatelessWidget {
  final jH = JsonHandler();
  //final cws = CovidWebScraper();

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

          //var cws = CovidWebScraper();
          //var news = cws.getNews();

          var jP;
          jH.getJsonCasi().then((value) => {
                jP = JsonParser(value),
                print("\n\ncasi:\t" + jP.getInfected().toString()),
              });


          //Mock up data
          var listTitles = ["Notizia 1", "Notizia 2"];
          var listTexts = ["Nell'ambito dell'iniziativa che si terrà dal 15 al 17 giugno, il Ministero della Salute perteciperà alla sessione del 15 giugno \"Nuove frontiere nella promozione della salute. Uno sguardo al futuro della pandemia di COVID-19: l'esperienza dell'Italia\" in diretta streaming dalle ore 15",
            "Lieve aumento dell'incidenza, 222 casi su 100mila abitanti. Rt, 0,75. Il tasso di occupazione dei posti letto in area medica si attesta a 6,6% e in terapia intensiva 2,2%. È bene continuare a a mantenere comportamenti prudenti e monitorare l'andamento della situazione negli altri Paesi europei. Per le persone anziane e per quelle fragili è bene completare il ciclo vaccinale con la quarta dose"];
          //JsonParser jP = JsonParser();
          return
            Container(
              height: 250,
              child: Scrollbar(

                child: ListView.builder(itemBuilder: (BuildContext, index){
                  return Card(
                    child: ListTile(
                      title: Text(listTitles[index]),
                      subtitle: Text(listTexts[index]),
                    ),
                  );
                },
                  itemCount: 2,
                  scrollDirection: Axis.vertical,),
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
