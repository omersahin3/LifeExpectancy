import 'package:flutter/material.dart';
import 'package:yasambeklentisi/constants.dart';
import 'package:yasambeklentisi/user_data.dart';
import 'user_data.dart';
import 'package:yasambeklentisi/Hesap.dart';
class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text('Sonuç Sayfası'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 8, child: Center(child: Text(Hesap(_userData).hesaplama().round().toString(),style: kMetinStili))),
          Expanded(
            flex: 1,
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'GERİ DÖN',
                style: kMetinStili,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
