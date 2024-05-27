import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:incidents/src/providers/Incident.dart';
import 'package:incidents/src/utils/api_endpoints.dart';

// Main Provider to handle the Dashboard DataPoints
class IncidentsProvider extends ChangeNotifier {
  var client = http.Client();
  List<Incident> _incidents = [];
  bool isLoading = true;

  List<Incident> get incidents => _incidents;

  IncidentsProvider() {
    loadIncidents();
  }

  List<Incident> data() {
    return [..._incidents];
  }

  Future<List<Incident>> loadIncidents() async {
    try {
      isLoading = true;
      notifyListeners();

      final String dashbaordEndPoint =
          ApiEndpoints.withBaseUrl(ApiEndpoints.incidents);

      final response = await http.get(
        Uri.parse(dashbaordEndPoint),
      );

      isLoading = false;
      if (response.statusCode == 200) {
        final Map<dynamic, dynamic> incidentsJson = json.decode(response.body);
        List<dynamic> incidentsListJson = incidentsJson['incidents'];
        _incidents = ApiEndpoints.deserializeList(
              incidentsListJson,
              (m) => Incident.fromJson(m),
            ) ??
            [];
      }
      notifyListeners();
      return _incidents;
    } finally {
      client.close();
    }
  }
}
