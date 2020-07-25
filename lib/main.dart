import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainWidget();
  }
}

class MainWidget extends StatefulWidget {
  @override
  MainWidgetState createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> {
  final TextEditingController controller = new TextEditingController();
  String result = "";
  Color mainColor = Colors.white;

  String punctuation() {
    var comma = ", ";
    if (result != "") {
      return result = comma + result;
    }
    return result;
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tapper',
        home: Scaffold(
          backgroundColor: mainColor,
          appBar: AppBar(
            title: Text('Tapper'),
          ),
          body: Stack(
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(hintText: 'Input your name'),
                onSubmitted: (String str) {
                  setState(() {
                    result = str;
                  });
                  controller.text = "";
                },
                controller: controller,
              ),
              Center(
                child: Text('Good ' + greeting() + punctuation(),
                    style: TextStyle(fontSize: 32.0)),
              ),
              Listener(
                behavior: HitTestBehavior.translucent,
                onPointerDown: (e) {
                  setState(() {
                    mainColor = Color.fromRGBO(
                        Random().nextInt(254) + 1,
                        Random().nextInt(254) + 1,
                        Random().nextInt(254) + 1,
                        1);
                  });
                },
              ),
            ],
          ),
        ));
  }
}
