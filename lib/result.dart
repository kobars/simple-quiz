import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore < 30) {
      resultText = 'Sinau sek Bro!';
    } else {
      resultText = "Selamat, kamu lulus!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 50),
      padding: EdgeInsets.all(0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Image(
                  image: NetworkImage(resultScore < 30
                      ? 'https://cdn.dribbble.com/users/1075152/screenshots/4746283/toy-soldier.gif'
                      : 'https://cdn.dribbble.com/users/69311/screenshots/1226327/congrats-gif-edit.gif')),
            ),
          ],
        ),
      ),
    );
  }
}
