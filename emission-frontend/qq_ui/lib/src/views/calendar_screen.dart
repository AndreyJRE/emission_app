import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:provider/provider.dart';
import 'package:qq_ui/listeners/emissionValut.dart';
import 'package:qq_ui/src/widget/emission_card.dart';
import 'package:table_calendar/table_calendar.dart';

List<Color> lineColor = [
    Color(0xfff3f169),
];

List<LineChartBarData> lineChartBarData = [
  LineChartBarData(
    color: Colors.black,
    isCurved: true,
    spots: [
      FlSpot(1, 2),
  FlSpot(2, 500),
  FlSpot(3, 600),
  FlSpot(4, 200),
  FlSpot(5, 300),
  FlSpot(6,400),
  FlSpot(7, 600),
    ]
  )
];
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({
    super.key,
  });

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}
class LineChartContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 1,
        minY: 0,
        maxX: 10,
        maxY: 2000,
        lineBarsData: lineChartBarData,
      ),
    );
  }
}


class _CalendarScreenState extends State<CalendarScreen> {
  late bool isShowingMainData = true;

  @override
  Widget build(BuildContext context) {
    EmissionVault taskState = context.watch<EmissionVault>();
    return Container(
          color: Color(0xfff0f0f0),
          child: ListView(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
            children: <Widget>[
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChartContainer(
                  title: 'Your Last Emissions', 
                  color: Colors.grey.shade300, 
                  chart: LineChartContent(),
                ),
              ), SizedBox(height: 20),
              Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade100),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('Produced Emissions:',
                                          style:
                                              TextStyle(color: Colors.black)),

                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Text('Total Emissions:',
                                          style:
                                              TextStyle(color: Colors.black,fontSize: 10)),
                                  FAProgressBar(
                                    direction: Axis.horizontal,
                                    backgroundColor: Colors.blueGrey,
                                    verticalDirection: VerticalDirection.up,
                                    currentValue:
                                        taskState.user.totalEmissions,
                                    displayText: ' kg CO2',
                                    maxValue: 2000,
                                    progressGradient: LinearGradient(
                                      colors: [
                                        Colors.green.withOpacity(0.75),
                                        Colors.red.withOpacity(0.75),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
            Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade100,
                              border: Border.all(
                                color: Colors.grey.shade400,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 4.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(0, 30),
                                )
                              ]),
                          height: 200.0,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: taskState.actvitites.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return EmissionCard(
                                  task: taskState.actvitites[index].co2,
                                  type: taskState.actvitites[index].activity);
                            },
                          ),
                        )],
          ));
  }

  List<Color> lineColor = [
    Color(0xfff3f169),
];

List<LineChartBarData> lineChartBarData = [
  LineChartBarData(
    color: Colors.black,
    isCurved: true,
    spots: [
      FlSpot(1, 8),
      FlSpot(2, 12.4),
      FlSpot(3, 10.8),
      FlSpot(4, 9),
      FlSpot(5, 8),
      FlSpot(6, 8.6),
      FlSpot(7, 10)
    ]
  )
];

  LineChartData get sampleData1 => LineChartData(
    lineTouchData: lineTouchData1,
    gridData: gridData,
    titlesData: titlesData1,
    borderData: borderData,
    lineBarsData: lineBarsData1,
    minX: 0,
    maxX: 14,
    maxY: 4,
    minY: 0,
  );

  LineChartData get sampleData2 => LineChartData(
    lineTouchData: lineTouchData2,
    gridData: gridData,
    titlesData: titlesData2,
    borderData: borderData,
    lineBarsData: lineBarsData2,
    minX: 0,
    maxX: 14,
    maxY: 6,
    minY: 0,
  );

  LineTouchData get lineTouchData1 => LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      getTooltipColor: (touchedSpot) => Colors.blueGrey.withOpacity(0.8),
    ),
  );

  FlTitlesData get titlesData1 => FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles,
    ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: AxisTitles(
      sideTitles: leftTitles(),
    ),
  );

  List<LineChartBarData> get lineBarsData1 => [
    lineChartBarData1_1,
    lineChartBarData1_2,
    lineChartBarData1_3,
  ];

  LineTouchData get lineTouchData2 => const LineTouchData(
    enabled: false,
  );

  FlTitlesData get titlesData2 => FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles,
    ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: AxisTitles(
      sideTitles: leftTitles(),
    ),
  );

  List<LineChartBarData> get lineBarsData2 => [
    lineChartBarData2_1,
    lineChartBarData2_2,
    lineChartBarData2_3,
  ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1m';
        break;
      case 2:
        text = '2m';
        break;
      case 3:
        text = '3m';
        break;
      case 4:
        text = '5m';
        break;
      case 5:
        text = '6m';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
    getTitlesWidget: leftTitleWidgets,
    showTitles: true,
    interval: 1,
    reservedSize: 40,
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('SEPT', style: style);
        break;
      case 7:
        text = const Text('OCT', style: style);
        break;
      case 12:
        text = const Text('DEC', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 32,
    interval: 1,
    getTitlesWidget: bottomTitleWidgets,
  );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
    show: true,
    border: Border(
      bottom:
      BorderSide(color:Colors.white.withOpacity(0.2), width: 4),
      left: const BorderSide(color: Colors.transparent),
      right: const BorderSide(color: Colors.transparent),
      top: const BorderSide(color: Colors.transparent),
    ),
  );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
    isCurved: true,
    color: Colors.green,
    barWidth: 8,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 1),
      FlSpot(3, 1.5),
      FlSpot(5, 1.4),
      FlSpot(7, 3.4),
      FlSpot(10, 2),
      FlSpot(12, 2.2),
      FlSpot(13, 1.8),
    ],
  );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
    isCurved: true,
    color: Colors.pink,
    barWidth: 8,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(
      show: false,
      color: Colors.pink.withOpacity(0),
    ),
    spots: const [
      FlSpot(1, 1),
      FlSpot(3, 2.8),
      FlSpot(7, 1.2),
      FlSpot(10, 2.8),
      FlSpot(12, 2.6),
      FlSpot(13, 3.9),
    ],
  );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
    isCurved: true,
    color: Colors.cyan,
    barWidth: 8,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 2.8),
      FlSpot(3, 1.9),
      FlSpot(6, 3),
      FlSpot(10, 1.3),
      FlSpot(13, 2.5),
    ],
  );

  LineChartBarData get lineChartBarData2_1 => LineChartBarData(
    isCurved: true,
    curveSmoothness: 0,
    color: Colors.green.withOpacity(0.5),
    barWidth: 4,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 1),
      FlSpot(3, 4),
      FlSpot(5, 1.8),
      FlSpot(7, 5),
      FlSpot(10, 2),
      FlSpot(12, 2.2),
      FlSpot(13, 1.8),
    ],
  );

  LineChartBarData get lineChartBarData2_2 => LineChartBarData(
    isCurved: true,
    color: Colors.pink.withOpacity(0.5),
    barWidth: 4,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(
      show: true,
      color: Colors.pink.withOpacity(0.2),
    ),
    spots: const [
      FlSpot(1, 1),
      FlSpot(3, 2.8),
      FlSpot(7, 1.2),
      FlSpot(10, 2.8),
      FlSpot(12, 2.6),
      FlSpot(13, 3.9),
    ],
  );

  LineChartBarData get lineChartBarData2_3 => LineChartBarData(
    isCurved: true,
    curveSmoothness: 0,
    color:Colors.cyan.withOpacity(0.5),
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: true),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 3.8),
      FlSpot(3, 1.9),
      FlSpot(6, 5),
      FlSpot(10, 3.3),
      FlSpot(13, 4.5),
    ],
  );

  
}
class ChartContainer extends StatelessWidget {
  final Color color;
  final String title;
  final Widget chart;

  const ChartContainer({
    Key? key,
    required this.title,
    required this.color,
    required this.chart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.width * 0.95 * 0.65,
        padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(top: 10),
              child: chart,
            ))
          ],
        ),
      ),
    );
  }
}
