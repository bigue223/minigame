import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text('تطابق صورة'),
          titleTextStyle: TextStyle(
            fontFamily: 'Amiri',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          backgroundColor: Colors.indigo.shade900,
        ),
        body: ImagePage(),
      ),
    ),
  );
}

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  var x = 1;
  var y = 1;
  var txt = "PLAY";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [
        Text(
          txt,
          style: TextStyle(
            fontFamily: 'Amiri',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image(image: AssetImage('images/image-$x.png')),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image(image: AssetImage('images/image-$y.png')),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              setState(() {
                y = Random().nextInt(9) + 1;
                x = Random().nextInt(9) + 1;

                if (x == y) {
                  txt = "CONGRATS ! YOU WIN";
                } else {
                  txt = "TRY AGAIN";
                }
              });
            },
            child: Image(image: AssetImage('images/play.png')),
          ),
        ),
      ],
    );
  }
}
