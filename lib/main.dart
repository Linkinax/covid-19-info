import 'package:covid_info/home/CounterWidget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home/NewsFeedWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var infetti = 0;
  var morti = 0;
  var guariti = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Info covid-19',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage("assets/images/covid-virus-3d-modeling.jpg"),
                  fit: BoxFit.fill),
            ),
            child: Column(
              children: <Widget>[],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: const Color(0xFFE5E5E5)),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  "assets/icons/location-sign.svg",
                  height: 25,
                  width: 25,
                  color: const Color.fromARGB(255, 152, 31, 26),
                ),
              ),
              const Expanded(
                flex: 5,
                child: Text(
                  "Italia",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Casi Attuali",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: "  data odiera",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ]),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20,
            ),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 25,
                  color: Color.fromARGB(255, 209, 209, 209)),
            ],
          ),
          child: Row(
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
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        NewsFeedWidget()
      ]),
    );
  }
}

class NewsList extends StatelessWidget {
  NewsList({Key? key, required this.news}) : super(key: key);

  final List<String> news;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: news.length,
      itemBuilder: (context, index) {
        return Text(news[index]);
      },
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 75);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 75);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
