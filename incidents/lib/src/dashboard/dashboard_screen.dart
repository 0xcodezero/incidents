import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:incidents/src/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const routeName = '/dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DashboardProvider(),
      child: Consumer<DashboardProvider>(
          builder: (context, dashboardProvider, child) => Scaffold(
              appBar: AppBar(
                title: Text(AppLocalizations.of(context)!.dashboard),
              ),
              body: dashboardProvider.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //Initialize the chart widget
                        Center(
                          child: SfCartesianChart(
                            series: <BarSeries>[
                              BarSeries<IncidentsStatusFrequency, String>(
                                dataSource: dashboardProvider.incidentsPoints,
                                xValueMapper:
                                    (IncidentsStatusFrequency point, _) =>
                                        point.progressStatus.value,
                                yValueMapper:
                                    (IncidentsStatusFrequency point, _) =>
                                        point.frequency,
                                // name: AppLocalizations.of(context)!.settingsDarkTheme,
                                // Enable data label
                                dataLabelSettings:
                                    const DataLabelSettings(isVisible: true),
                              )
                            ],
                            primaryXAxis: const CategoryAxis(),
                          ),
                        ),
                      ],
                    ))),
    );
  }
}
