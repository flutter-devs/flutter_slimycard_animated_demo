import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';

class SlimyCardDemo extends StatefulWidget {
  @override
  _SlimyCardDemoState createState() => _SlimyCardDemoState();
}

class _SlimyCardDemoState extends State<SlimyCardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        automaticallyImplyLeading: false,
        title: Text("SlimyCard Animated Demo"),
      ),
      body: StreamBuilder(
        initialData: false,
        stream: slimyCard.stream,
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: 70),
              SlimyCard(
                color: Colors.indigo[300],
                topCardWidget: topCardWidget((snapshot.data)
                    ? 'assets/images/devs.jpg'
                    : 'assets/images/flutter.png'),
                bottomCardWidget: bottomCardWidget(),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget topCardWidget(String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: AssetImage(imagePath)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Text(
          'Flutter',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 15),
        Center(
          child: Text(
            'Flutter is Google’s UI toolkit for building beautiful, natively compiled applications'
                ' for mobile, web, and desktop from a single codebase.',
            style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget bottomCardWidget() {
    return Column(
      children: [
        Text(
          'https://flutterdevs.com/',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
        Expanded(
          child: Text(
            'FlutterDevs specializes in creating cost-effective and efficient '
                'applications with our perfectly crafted,creative and leading-edge '
                'flutter app development solutions for customers all around the globe.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}