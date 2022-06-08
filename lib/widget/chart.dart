import 'package:covid19staticstics/model/covid_statistics_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../utils/data_utils.dart';

class CovidChart extends StatelessWidget {

  final List<CovidStatisticsModel> covidDatas;
  final double maxY;
  const CovidChart({Key? key, required this.covidDatas, required this.maxY}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    int valueX = 0;

    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: covidDatas.map<BarChartGroupData>((data) {
          return BarChartGroupData(x: valueX++,barRods: [
            BarChartRodData(
                toY: data.calcDecideCnt.toDouble(),gradient: _barsGradient)
          ],showingTooltipIndicators: [0]);
        }).toList(),
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: maxY*1.5,
      ),
    );

  }

  BarTouchData get barTouchData => BarTouchData(
    enabled: false,
    touchTooltipData: BarTouchTooltipData(
      tooltipBgColor: Colors.transparent,
      tooltipPadding: const EdgeInsets.all(0),
      tooltipMargin: 8,
      getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
          ) {
        return BarTooltipItem(
          rod.toY.round().toString(),
          const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    ),
  );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text = DataUtils.simpleDayFormat(covidDatas[value.toInt()].stateDt!);
    switch (value.toInt()) {
      case 0:
        text;
        break;
      case 1:
        text;
        break;
      case 2:
        text;
        break;
      case 3:
        text;
        break;
      case 4:
        text;
        break;
      case 5:
        text;
        break;
      case 6:
        text ;
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4.0,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTitlesWidget: getTitles,
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    rightTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
  );

  FlBorderData get borderData => FlBorderData(
    show: false,
  );

  final _barsGradient = const LinearGradient(
    colors: [
      Colors.lightBlueAccent,
      Colors.greenAccent,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
}
