import 'package:flutter/material.dart';
import 'results_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'loader_screen.dart';

class TeamSelectionPage extends StatefulWidget {
  @override
  _TeamSelectionPageState createState() => _TeamSelectionPageState();
}

class _TeamSelectionPageState extends State<TeamSelectionPage> {
  String? selectedHomeTeam;
  String? selectedAwayTeam;

  // List of teams
  final List<String> teams = [
    'Perugia',
    'Monza',
    'Modena',
    'Trentino',
    'Cisterna',
    'Lube Civitanova',
    'Milano',
    'Padova',
    'Piacenza',
    'Taranto',
    'Saturnia Acicastello',
    'Verona'
  ];

  void getPrediction() async {
    if (selectedHomeTeam == null || selectedAwayTeam == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Please select both home and away teams."),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text("OK")),
          ],
        ),
      );
      return;
    }

    // Show the loader screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoaderScreen()),
    );

    // Ensure a minimum loading time of 2 seconds
    await Future.delayed(Duration(seconds: 2));

    // Make a request to your backend
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/match-details'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'home_team': selectedHomeTeam,
        'away_team': selectedAwayTeam,
      }),
    );

    // Pop the loader screen
    Navigator.pop(context);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsPage(result: result),
        ),
      );
    } else {
      // Handle error
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Failed to fetch prediction"),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text("OK")),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Team Selection")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedHomeTeam,
              hint: Text("Select Home Team"),
              isExpanded: true,
              items: teams.map((String team) {
                return DropdownMenuItem<String>(
                  value: team,
                  child: Text(team),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedHomeTeam = newValue;
                });
              },
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedAwayTeam,
              hint: Text("Select Away Team"),
              isExpanded: true,
              items: teams.map((String team) {
                return DropdownMenuItem<String>(
                  value: team,
                  child: Text(team),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedAwayTeam = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: getPrediction,
              child: Text("Get Prediction"),
            ),
          ],
        ),
      ),
    );
  }
}
