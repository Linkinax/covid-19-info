import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class UpperWidget extends StatelessWidget {
  final now = DateTime.now();
  final formatter = DateFormat('yyyy-MM-dd');

  UpperWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
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
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Casi Attuali  ",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: formatter.format(now).toString(),
                        style: const TextStyle(
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
      ]),
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
