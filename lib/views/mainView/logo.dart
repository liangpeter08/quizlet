import 'package:flutter/material.dart';
class Logo extends StatelessWidget {
  const Logo();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            padding: EdgeInsets.only(top: 10),
            //color: Color(0xFFFFFF00),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Container(
                    //color: Color(0xFF00FF00),
                    child: Image.asset('assets/logo7medium.png', width: 50.0)),
                Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Text(
                    'Quetzal Labs',
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
              ])
            ])));
  }
}
