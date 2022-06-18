import 'package:web_scraper/web_scraper.dart';

class CovidWebScraper {
  final webScraper1 = WebScraper('https://salute.gov.it/');

  Future<List<String>> getNews() async {
    List<String> news = ["Nothing yet"];
    final webScraper = WebScraper('https://webscraper.io/');

    if (await webScraper1.loadWebPage(
        'portale/nuovocoronavirus/archivioNotizieNuovoCoronavirus.jsp')) {
      List<Map<String, dynamic>> elements = webScraper1.getElement('dt', []);

      elements.forEach((element) {
        print(element['title']);
        news.add(element['title']);
      });
    }
    return news;
  }

  Future<Map<String, List<String>>> getResults() async {
    var d = <String, List<String>>{
      'news': ['No news retrived'],
      'titles': ['No titles retrived']
    };

    List<String> titles = ["Nothing yet"];
    List<String> news = ["Nothing yet"];

    final webScraper = WebScraper('https://salute.gov.it/');

    if (await webScraper.loadWebPage(
        'portale/nuovocoronavirus/archivioNotizieNuovoCoronavirus.jsp')) {
      List<Map<String, dynamic>> elementsTitle =
          webScraper.getElement('dt', []);
      List<Map<String, dynamic>> elementsBody = webScraper.getElement('dd', []);

      titles.clear();
      elementsTitle.forEach((element) {
        print("Adding title: ${element['title']}");
        titles.add(element['title']);
      });

      news.clear();
      elementsBody.forEach((element) {
        print("Adding body: ${element['title']}");
        news.add(element['title']);
      });

      d.update('news', (value) => news);
      d.update('titles', (value) => titles);
    }

    return d;
  }
}
