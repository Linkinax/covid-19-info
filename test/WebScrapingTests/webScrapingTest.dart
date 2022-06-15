import 'package:covid_info/utils/CovidWebScraper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CovidWebScraper cws = CovidWebScraper();

  test('returns the list of scraped news if successfull', () async {
    List<String> result = await cws.getNews();
    print("Scraping completed");
    expect(result.isNotEmpty, true);
  });
}
