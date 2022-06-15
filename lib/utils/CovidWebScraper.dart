import 'package:web_scraper/web_scraper.dart';

class CovidWebScraper {
  final webScraper1 = WebScraper(
      'https://salute.gov.it/');

  Future<List<String>> getNews() async {
    List<String> news = ["Nothing yet"];

    final webScraper = WebScraper('https://webscraper.io/');

    if (await webScraper1.loadWebPage('portale/nuovocoronavirus/archivioNotizieNuovoCoronavirus.jsp')) {
      List<Map<String, dynamic>> elements =
          webScraper1.getElement('dt', []);

      elements.forEach((element) {
        print(element['title']);
        news.add( element['title']);

      });

      return news;
    }



    return news;
  }
}
