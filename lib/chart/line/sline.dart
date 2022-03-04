import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:swiftvote/chart/bar/vbar.dart';
import 'package:swiftvote/models/shortmodels.dart';

class _LineChart extends StatelessWidget {
  const _LineChart({required this.hd});
  final int stime = 0, etime = 0, maxVote = 0;
  final HistoryData hd;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData => LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesData,
        borderData: borderData,
        lineBarsData: [lineChartBarData],
        minX: minTime.toDouble(), //start time
        maxX: maxTime.toDouble(), //end Time
        maxY: getMaxOfVal(maxVote).toDouble(), //maxVote
        minY: 0,
      );

  LineTouchData get lineTouchData => LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: bottomTitles,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        leftTitles: leftTitles,
      );

  SideTitles get leftTitles => SideTitles(
        showTitles: true,
        margin: 8,
        interval: 1,
        reservedSize: 40,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xff9c9c9c),
        ),
        getTitles: (value) {
          int jtv = getMaxOfVal(maxVote);

          if (value % (jtv / 5) == 0) {
            return '$value';
          } else {
            return '';
          }
        },
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 22,
        margin: 10,
        interval: 1,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xff9c9c9c),
        ),
        getTitles: (value) {
          if ((value.toInt() - minTime) % 7200 == 0) {
            DateTime dt =
                DateTime.fromMillisecondsSinceEpoch(value.toInt() * 1000);
            return "${dt.hour}:${dt.minute}";
          }
          return '';
        },
      );

  FlGridData get gridData => FlGridData(
        show: true,
        drawHorizontalLine: false,
        drawVerticalLine: true,
        getDrawingVerticalLine: (value) {
          if ((value.toInt() - minTime) % 7200 == 0) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          }
          return FlLine(strokeWidth: 0);
        },
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Colors.transparent),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData => LineChartBarData(
        isCurved: true,
        colors: const [Color(0xFF007AFF)],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          colors: [
            const Color(0xFF007AFF),
            const Color(0xFF007AFF).withOpacity(0.33),
          ],
        ),
        spots: List.generate(
            hd.allHistory!.length,
            (index) =>
                FlSpot(int.parse(hd.allHistory![index].time).toDouble(), 1)),
      );

  int get minTime => getMinOfTime(stime);

  int get maxTime => getMaxOfTime(etime);

  int getMinOfTime(int ntime) {
    //in seconds
    int rtime;
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(ntime * 1000);
    if (dt.hour % 2 == 0) {
      rtime = ntime - dt.minute * 60 - dt.second;
    } else {
      rtime = ntime - 3600 - dt.minute * 60 - dt.second;
    }
    return rtime;
  }

  int getMaxOfTime(int ntime) {
    //in seconds
    int rtime;
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(ntime * 1000);
    if (dt.hour % 2 == 0) {
      rtime = ntime + 3600 + (60 - dt.minute) * 60 + (60 - dt.second);
    } else {
      rtime = ntime + (60 - dt.minute) * 60 + (60 - dt.second);
    }
    return rtime;
  }
}

class SLine extends StatefulWidget {
  const SLine({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SLineState();
}

class SLineState extends State<SLine> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          gradient: LinearGradient(
            colors: [
              Color(0xff2c274c),
              Color(0xff46426c),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 37,
            ),
            const Text(
              'Unfold Shop 2018',
              style: TextStyle(
                color: Color(0xff827daa),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              'Monthly Sales',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 37,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                child: _LineChart(
                  hd: HistoryData(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
