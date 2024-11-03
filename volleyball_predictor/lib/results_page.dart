import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final Map<String, dynamic> result;

  ResultsPage({required this.result});

  @override
  Widget build(BuildContext context) {
    final winner = result['winner'];
    final homeSetsWon = result['home_sets_won'];
    final awaySetsWon = result['away_sets_won'];
    final sets = result['sets'];

    return Scaffold(
      appBar: AppBar(title: Text("Prediction Results")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Winner: $winner", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Home Sets Won: $homeSetsWon", style: TextStyle(fontSize: 18)),
            Text("Away Sets Won: $awaySetsWon", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Set Scores:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ...sets.entries.map((entry) {
              final team = entry.key;
              final scores = entry.value;
              return Text("$team: ${scores.join(", ")}", style: TextStyle(fontSize: 18));
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("New Prediction"),
            ),
          ],
        ),
      ),
    );
  }
}
