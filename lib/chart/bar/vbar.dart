import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:swiftvote/models/shortmodels.dart';
import 'package:swiftvote/swiftvote.dart';

class VBar extends StatefulWidget {
  final List<Color> availableColors = Colors.accents;
  final CandData cd;
  final bool isVertical;
  const VBar({required this.cd, this.isVertical = true, Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => VBarState();
}

class VBarState extends State<VBar> {
  final Color barBackgroundColor = const Color(0xFFF0F1F1);
  final Duration animDuration = const Duration(milliseconds: 250);
  late int lenCand;
  bool isV = true;

  int touchedIndex = -1;

  @override
  void initState() {
    lenCand = widget.cd.allCand!.length;
    isV = widget.isVertical;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.78,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: const Color(0xFFF0F1F1),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isV = !isV;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    isV ? 'Votes - Candidates' : 'Candidates - Vote%',
                    style: const TextStyle(
                      color: Color(0xff0f4a3c),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: isV
                      ? BarChart(
                          mainBarData(),
                          swapAnimationDuration: animDuration,
                        )
                      : RotatedBox(
                          quarterTurns: 1,
                          child: BarChart(
                            mainBarData(),
                            swapAnimationDuration: animDuration,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched
              ? [SwiftVote.primaryColor]
              : [widget.cd.allCand![x].ccol!],
          width: SwiftVote.getBarWidth(lenCand, isV),
          borderSide: isTouched
              ? const BorderSide(color: Colors.yellow, width: 1)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: isV
                ? getMaxY().toDouble()
                : (widget.cd.maxVote / widget.cd.totalVote) * 100,
            colors: [barBackgroundColor],
          ),
        ),
      ],
    );
  }

  double _candVC(int i) {
    return widget.cd.allCand![i].voteCount.toDouble();
  }

  double _candVCP(int i) {
    return (widget.cd.allCand![i].voteCount / widget.cd.totalVote) * 100;
  }

  double candY(int i) {
    return isV ? _candVC(i) : _candVCP(i);
  }

  List<BarChartGroupData> showingGroups() => List.generate(lenCand, (i) {
        return makeGroupData(i, candY(i), isTouched: i == touchedIndex);
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            rotateAngle: isV ? 0 : -90,
            tooltipPadding: EdgeInsets.all(4),
            fitInsideHorizontally: true,
            fitInsideVertically: true,
            tooltipMargin: 4,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                widget.cd.allCand![group.x].candName + '\n',
                const TextStyle(
                  color: Colors.white,
                  fontFamily: 'NotoSans',
                  fontSize: 10,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: isV
                        ? "${(rod.y - 1).toInt()} votes"
                        : "${(rod.y - 1).toInt()}%",
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: isV
            ? SideTitles(showTitles: false)
            : SideTitles(
                showTitles: true,
                rotateAngle: -90,
                reservedSize: 28,
                interval: 1,
                getTextStyles: (context, value) => const TextStyle(
                    color: Colors.black, fontFamily: 'NotoSans', fontSize: 11),
                getTitles: (value) {
                  int jtv = getMaxOfVal(
                      ((widget.cd.maxVote / widget.cd.totalVote) * 100)
                          .round());

                  if (value % (jtv / 5) == 0) {
                    return '${value.toInt()}%';
                  } else {
                    return '';
                  }
                },
              ),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
              color: Colors.black, fontFamily: 'NotoSans', fontSize: 12),
          margin: 16,
          rotateAngle: isV ? 0 : -90,
          getTitles: (double value) {
            String n = widget.cd.allCand![value.toInt()].candName;
            String v = n.split(" ")[0][0] + "." + n.split(" ")[1][0];
            return v;
          },
        ),
        leftTitles: isV
            ? SideTitles(
                showTitles: true,
                getTextStyles: (context, value) => const TextStyle(
                    color: Color(0xff7589a2),
                    fontFamily: 'NotoSans',
                    fontSize: 12),
                margin: 8,
                interval: 1,
                getTitles: (value) {
                  int jtv = getMaxY();

                  if (value % (jtv / 5) == 0) {
                    return '${value.toInt()}';
                  } else {
                    return '';
                  }
                },
              )
            : SideTitles(showTitles: false),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  int getMaxY() {
    int tv = widget.cd.maxVote;
    return getMaxOfVal(tv);
  }
}

int getMaxOfVal(int tv) {
  int jtv = 0;
  if (tv % 10 == 0) {
    jtv = tv;
  } else {
    jtv = tv + (10 - (tv % 10));
  }
  return jtv;
}
