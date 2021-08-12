import 'package:flutter/material.dart';


class ArticleView extends StatelessWidget {
  String say;
  ArticleView({required this.say});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "ARTICLE",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                  children: <Widget>[
                    new Text(say, style: TextStyle(
                      fontSize: 16,
                    ),),
                  ]
              )
          )
      ),
    );
  }


}
