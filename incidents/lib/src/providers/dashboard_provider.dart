import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:incidents/src/models/ProgressStatues.dart';
import 'package:incidents/src/utils/api_endpoints.dart';

// Main Provider to handle the Dashboard DataPoints
class DashboardProvider extends ChangeNotifier {
  var client = http.Client();
  List<IncidentsStatusFrequency> _incidentsPoints = [];
  bool isLoading = true;

  List<IncidentsStatusFrequency> get incidentsPoints => _incidentsPoints;

  DashboardProvider() {
    loadDashboard();
  }

  List<IncidentsStatusFrequency> dataPoints() {
    return [..._incidentsPoints];
  }

  Future<List<IncidentsStatusFrequency>> loadDashboard() async {
    try {
      isLoading = true;
      notifyListeners();

      final String dashbaordEndPoint =
          ApiEndpoints.withBaseUrl(ApiEndpoints.dashboard);

      final response = await http.get(
        Uri.parse(dashbaordEndPoint),
      );

      isLoading = false;
      if (response.statusCode == 200) {
        final Map<dynamic, dynamic> incidentsJson = json.decode(response.body);
        List<dynamic> incidentsListJson = incidentsJson['incidents'];
        _incidentsPoints = ApiEndpoints.deserializeList(
              incidentsListJson,
              (m) => IncidentsStatusFrequency.fromJson(m),
            ) ??
            [];
      }
      notifyListeners();
      return _incidentsPoints;
    } finally {
      client.close();
    }
  }
}

class IncidentsStatusFrequency {
  IncidentsStatusFrequency(this.progressStatus, this.frequency);

  final ProgressStatus progressStatus;
  final int frequency;

  factory IncidentsStatusFrequency.fromJson(Map<String, dynamic> json) {
    final point = IncidentsStatusFrequency(
      ProgressStatus.fromIndex(json['status']),
      json['_count']['status'] ?? 0,
    );

    return point;
  }
}
