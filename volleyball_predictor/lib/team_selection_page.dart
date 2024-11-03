import 'package:flutter/material.dart';
import 'results_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TeamSelectionPage extends StatefulWidget {
  @override
  _TeamSelectionPageState createState() => _TeamSelectionPageState();
}

class _TeamSelectionPageState extends State<TeamSelectionPage> {
  final TextEditingController homeTeamController = TextEditingController();
  final TextEditingController awayTeamController = TextEditingController();

  void getPrediction() async {
    final String homeTeam = homeTeamController.text;
    final String awayTeam = awayTeamController.text;

    // Make a request to your backend
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/match-details'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'home_team': homeTeam,
        'away_team': awayTeam,
      }),
    );

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
            TextField(
              controller: homeTeamController,
              decoration: InputDecoration(labelText: "Home Team"),
            ),
            TextField(
              controller: awayTeamController,
              decoration: InputDecoration(labelText: "Away Team"),
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
