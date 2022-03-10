import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample extends StatefulWidget {
  const LineChartSample({Key? key}) : super(key: key);

  @override
  _LineChartSampleState createState() => _LineChartSampleState();
}

final List<double> values = [
  1.3,
  4,
  3,
  5,
  6,
  5.5,
  6,
  3,
  4,
  5,
  6,
  5.5,
  6,
];

List<FlSpot> spots = values.asMap().entries.map((e) {
  return FlSpot(e.key.toDouble(), e.value);
}).toList();

class _LineChartSampleState extends State<LineChartSample> {
  bool showAvg = false;

  List<Color> gradientColors = [
    const Color(0xffB8BEEE),
    const Color(0xff4151DD),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.60,
          child: LineChart(
            // showAvg ? avgData() : mainData(),
            mainData(),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1.5,
        verticalInterval: 1.5,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xFFD4D8E2),
            strokeWidth: 1,
            dashArray: [6, 6, 6],
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 0,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xFF8A8A8A),
            fontWeight: FontWeight.w500,
            fontFamily: "HK Grotesk",
            fontSize: 13,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'Jan';
              case 4:
                return 'Feb';
              case 6:
                return 'Mar';
              case 8:
                return 'Apr';
              case 10:
                return 'May';
              case 12:
                return 'Jan';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xFF8A8A8A),
            fontWeight: FontWeight.w500,
            fontFamily: "HK Grotesk",
            fontSize: 13,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '\$0k';
              case 2:
                return '\$10k';
              case 4:
                return '\$20k';
              case 6:
                return '\$30k';
            }
            return '';
          },
          reservedSize: 30,
          margin: 5,
        ),
      ),
      borderData: FlBorderData(
          show: true, border: Border.all(color: Colors.transparent, width: 1)),
      minX: 0,
      maxX: 13,
      minY: 0,
      maxY: 7,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          // const [
          //   FlSpot(0, 3),
          //   FlSpot(2.6, 2),
          //   FlSpot(4.9, 5),
          //   FlSpot(6.8, 3.1),
          //   FlSpot(8, 4),
          //   FlSpot(9.5, 3),
          //   FlSpot(11, 4),
          //   FlSpot(12, 4),
          // ],
          isCurved: true,
          shadow: const Shadow(
            color: Color(0xFFE5E6FB),
            offset: Offset(0, 8),
            blurRadius: 2,
          ),
          isStepLineChart: false,
          preventCurveOverShooting: false,
          show: true,
          colors: gradientColors,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: false,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
