import 'package:flutter/material.dart';
import '../style/theme.dart' as Themes;

class ThemeBodyContainer extends StatelessWidget {
  final Column body;
  const ThemeBodyContainer(this.body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Themes.Colors.mainPageStart,
                    Themes.Colors.mainPageEnd,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: body));
  }
}
