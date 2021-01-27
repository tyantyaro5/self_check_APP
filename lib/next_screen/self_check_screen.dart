import 'package:flutter/material.dart';
import 'package:self_check/next_screen/result_screen.dart';

class SelfCheckScreen extends StatefulWidget {
  @override
  _SelfCheckScreenState createState() => _SelfCheckScreenState();
}

class _SelfCheckScreenState extends State<SelfCheckScreen> {
  List<String> _textQuestions =
  [
    "頭痛はしますか？",
    "吐き気はありますか？",
    "めまいはしますか？",
    "１週間以上症状が続いていますか？",
    "食欲がないですか？",
    "咳は出ていますか？",
    "熱はありますか？",
    "ひどい痛みがありますか？",
    "持病はお持ちですか？",
    "過去に大きな病気にかかった事がありますか？",
    "お疲れ様でした！",
  ];
  int _index = 0;
  int _yesCounter = 0;

  bool isYesButtonEnabled = true;
  bool isNoButtonEnabled = true;
  bool isBackButtonEnabled = false;
  bool isOkButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("問診"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: _textQuestion(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120.0, left: 50, right: 50),
                child: Row(
                  children: [
                    _yesButton(),
                    _noButton(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 100.0, right: 10.0, left: 10.0),
                child: _backButton(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, right: 10.0, left: 10.0),
                child: _okButton(),
              ),
            ]
        ),
      ),
    );
  }

//問診内容
  Widget _textQuestion() {
    return Text(_textQuestions[_index],style: TextStyle(fontSize: 17),);

  }

//Yesボタン
  Widget _yesButton() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          child: Text("Yes"),
          onPressed: isYesButtonEnabled ? () => _yesNextQuestion() : null,
        ),
      ),
    );
  }

//Noボタン
  Widget _noButton() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
            child: Text("No"),
            onPressed: isNoButtonEnabled ? () => _noNextQuestion() : null,
        ),
      ),
    );
  }

//戻るボタン
  Widget _backButton() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
          child: Text("一つ戻る"),
          onPressed: isBackButtonEnabled ? () => _backQuestion() : null,
      ),
    );
  }

//結果をみるボタン
  Widget _okButton() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
          child: Text("結果を見る"),
          onPressed: isOkButtonEnabled ? () => _resultPage() : null
      ),
    );
  }

  _yesNextQuestion() {
    _index += 1;
    _yesCounter += 1;
    print(_yesCounter);

    if(_index == 0){
      isYesButtonEnabled = true;
      isNoButtonEnabled = true;
      isBackButtonEnabled = false;
      isOkButtonEnabled = false;
    }else if(_index == 10){
      isYesButtonEnabled = false;
      isNoButtonEnabled = false;
      isBackButtonEnabled = false;
      isOkButtonEnabled = true;
    }else{
      isYesButtonEnabled = true;
      isNoButtonEnabled = true;
      isBackButtonEnabled = true;
      isOkButtonEnabled = false;
    }

    setState(() {
    });
  }

  _noNextQuestion() {
    _index += 1;

    if(_index == 0){
      isYesButtonEnabled = true;
      isNoButtonEnabled = true;
      isBackButtonEnabled = false;
      isOkButtonEnabled = false;
    }else if(_index == 10){
      isYesButtonEnabled = false;
      isNoButtonEnabled = false;
      isBackButtonEnabled = false;
      isOkButtonEnabled = true;
    }else{
      isYesButtonEnabled = true;
      isNoButtonEnabled = true;
      isBackButtonEnabled = true;
      isOkButtonEnabled = false;
    }

    setState(() {
    });
  }

  _backQuestion() {
    _index -= 1;
    if(_index == 0){
      isYesButtonEnabled = true;
      isNoButtonEnabled = true;
      isBackButtonEnabled = false;
      isOkButtonEnabled = false;
    }else if(_index == 10){
      isYesButtonEnabled = false;
      isNoButtonEnabled = false;
      isBackButtonEnabled = false;
      isOkButtonEnabled = true;
    }else{
      isYesButtonEnabled = true;
      isNoButtonEnabled = true;
      isBackButtonEnabled = true;
      isOkButtonEnabled = false;
    }
    setState(() {
    });
  }

  _resultPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ResultScreen(
      yesCounter: _yesCounter,
    )));
  }


  }



