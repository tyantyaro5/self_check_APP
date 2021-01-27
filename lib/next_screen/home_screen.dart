import 'package:flutter/material.dart';
import 'package:self_check/next_screen/self_check_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset("assets/images/765984.png"),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Divider(
                    height: 30,
                    color: Colors.white,
                    indent: 8,
                    endIndent: 8,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    "簡単セルフチェック",
                    style: TextStyle(fontSize: 30, fontFamily: "Lanobe"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: RaisedButton.icon(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      onPressed: () => startSelfCheck(context),
                      icon: Icon(Icons.skip_next),
                      label: Text(
                        "START",
                        style: TextStyle(fontSize: 30),
                      ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 45.0),
                  child: Text(
                    "powered by Tyantyaro LLC 2021@",
                    style: TextStyle(fontFamily: "Mont"),
            ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  startSelfCheck(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SelfCheckScreen()));
  }
}
