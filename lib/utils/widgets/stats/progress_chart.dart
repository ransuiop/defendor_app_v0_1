// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProgressChart extends StatelessWidget {
  const ProgressChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('placeProgress', 80),
    ];

    return Center(
      child: SizedBox(
        height: 450,
        width: 450,
        child: SfCircularChart(
          margin: EdgeInsets.all(0),
          palette: [defLBlu],
          series: [
            DoughnutSeries<ChartData, String>(
              dataSource: chartData,
              radius: '170',
              innerRadius: '75%',
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
            )
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
