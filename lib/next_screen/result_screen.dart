import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final yesCounter;

  ResultScreen({this.yesCounter});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<String> _result = [
    "とても健康ですね！",
    "自宅でゆっくり休息を!",
    "念のため病院で診察を!",
    "早めに病院で診察を!",
  ];

  List<String> _subResult = [
    "体調管理ができていて素晴らしいです！疲れた時はゆっくり休んで、健康維持を心がけましょう。",
    "少し風邪気味のようです。ストレス等で体調を崩している場合もあるので、リラックスできる環境でゆっくりと休息をとることをお勧めします。長期間症状が続くようであれば迷わず病院へ行きましょう。",
    "ウイルス感染等の危険もあるので、念のため病院での診察をお勧めします。お仕事も無理せず休んで、しっかり休養をとって治療して下さいね。",
    "症状が重いようですので、早めに病院で診察を受けることをお勧めします。よくあるウイルスでも状態によっては死にいたる危険性もありますので、明日、明後日にでも病院で受診しましょう！",
  ];

  int _textInt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("診断結果"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              _textResult(),
              SizedBox(
                height: 30,
              ),
              Divider(
                height: 30.0,
                color: Colors.white,
                indent: 8,
                endIndent: 8,
              ),
              SizedBox(
                height: 30,
              ),
              _subTextResult(),
              SizedBox(
                height: 100,
              ),
              _endButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textResult() {
      if (widget.yesCounter == 0) {
      _textInt = 0;
    } else if (widget.yesCounter == 1 ||
        widget.yesCounter == 2 ||
        widget.yesCounter == 3) {
      _textInt = 1;
    } else if (widget.yesCounter == 4 ||
        widget.yesCounter == 5 ||
        widget.yesCounter == 6) {
      _textInt = 2;
    } else {
      _textInt = 3;
    } return
      Text(
      _result[_textInt],
      style: TextStyle(fontSize: 30),
    );
  }

  Widget _subTextResult() {
    if (widget.yesCounter == 0) {
      _textInt = 0;
    } else if (widget.yesCounter == 1 ||
        widget.yesCounter == 2 ||
        widget.yesCounter == 3) {
      _textInt = 1;
    } else if (widget.yesCounter == 4 ||
        widget.yesCounter == 5 ||
        widget.yesCounter == 6) {
      _textInt = 2;
    } else {
      _textInt = 3;
    } return
      Text(
        _subResult[_textInt],
        style: TextStyle(fontSize: 18),
      );
  }

  Widget _endButton() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(child: Text("終了"), onPressed: () => _endPop()),
    );
  }

  _endPop() {
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
