import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const routeName = '/dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<_IncidentsStatusFrequency> _data = [
    _IncidentsStatusFrequency('Submitted', 21),
    _IncidentsStatusFrequency('InProgress', 5),
    _IncidentsStatusFrequency('Completed', 1),
    _IncidentsStatusFrequency('Rejected', 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.dashboard),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Initialize the chart widget
            Center(
              child: SfCartesianChart(
                series: <BarSeries>[
                  BarSeries<_IncidentsStatusFrequency, String>(
                    dataSource: _data,
                    xValueMapper: (_IncidentsStatusFrequency point, _) =>
                        point.incidentStatus,
                    yValueMapper: (_IncidentsStatusFrequency point, _) =>
                        point.frequency,
                    // name: AppLocalizations.of(context)!.settingsDarkTheme,
                    // Enable data label
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  )
                ],
                primaryXAxis: const CategoryAxis(),
              ),
            ),
          ],
        ));
  }
}

class _IncidentsStatusFrequency {
  _IncidentsStatusFrequency(this.incidentStatus, this.frequency);

  final String incidentStatus;
  final double frequency;
}
