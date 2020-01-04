import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../components/themeContainer.dart';
import '../../util/StoragePreference.dart';
import '../loseView/exitbutton.dart';
import '../mainView/mainview.dart';
import '../../util/adInfo.dart';
import '../../style/theme.dart';

class Performance extends StatefulWidget {

  @override

  _LineChartSample2State createState() {
    print('performance start');


    return _LineChartSample2State();
  }
}

class _LineChartSample2State extends State<Performance> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  List<FlSpot> data;
  double nPoints = 0;


  _LineChartSample2State() {
        // load region preference
    StoragePreference.getScore().then((item) {
      print('stored scores: ${item.toString()}');
        List<FlSpot> _data = new List<FlSpot>();
        for (int i = 0; i < item.length; i++) {
          _data.add(FlSpot(i.toDouble(), double.parse(item[i]) * 10));
        }
        setState(() {
          this.data = _data;
          this.nPoints = item.length.toDouble();
          print(this.data);
          print(nPoints);
        });
      });

    loadInterstitial(() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return MyApp();
      }));
    });
  }

   buttonOnPressed(String caller) {
     if(!showInterstitial()) {
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return MyApp();
      }));
     }
   }

  @override
  Widget build(BuildContext context) {
    return ThemeBodyContainer(Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(padding: EdgeInsets.all(20), child: Text('Your Score Tracker',
        style: TextStyle(fontFamily: 'font2', fontSize: 28,
                                  color: Color(0xFFFFFFFF)))),
        AspectRatio(
          aspectRatio: MediaQuery.of(context).size.width  / (MediaQuery.of(context).size.height - 300),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(18),
                ),
                color: const Color(0xFFffcdbd)),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
        ExitButton(buttonName: 'Home', myOnClick: this.buttonOnPressed),
        Container(child: adBanner),
      ],
    ));
  }

  LineChartData mainData() {
    return LineChartData(
      backgroundColor: Color(0xFFff9977),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
              color: const Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            return value.toInt().toString();
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            return (value.toInt() * 10).toString() + '%';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: this.nPoints,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: this.data,
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}