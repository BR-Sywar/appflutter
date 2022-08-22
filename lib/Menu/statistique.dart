import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class statique extends StatelessWidget {
  statique({Key? key}) : super(key: key);

  final dataMap = <String, double>{
    "2018": 5,
    "2017": 6,
    "2016": 7,
  };

  final colorList = <Color>[Colors.greenAccent, Colors.black, Colors.amber];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Statique"),
          backgroundColor: Color.fromARGB(255, 58, 62, 70),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: PieChart(
            dataMap: dataMap,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 3.2,
            colorList: colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.disc,
            ringStrokeWidth: 30,
            centerText: "HYBRID",
            legendOptions: const LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: true,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
              decimalPlaces: 1,
            ),
          ),
        )
        );
        
        
  }
}
