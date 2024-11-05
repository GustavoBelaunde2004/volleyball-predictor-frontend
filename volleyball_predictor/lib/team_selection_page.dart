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
    'Perugia', 'Monza', 'Modena', 'Trentino', 'Cisterna', 'Lube Civitanova',
    'Milano', 'Padova', 'Piacenza', 'Taranto', 'Saturnia Acicastello', 'Verona'
  ];

void getPrediction() async {
  if (selectedHomeTeam == null || selectedAwayTeam == null) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text("Please select both home and away teams."),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text("OK")),
        ],
      ),
    );
    return;
  }

  // Show the loader screen with a fade transition
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoaderScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
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
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ResultsPage(result: result),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
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
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text("OK")),
        ],
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),  // Set your desired height here
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: Text(
              "Volleyball Predictor",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.blueGrey,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("App Info"),
                    content: Text("Please select 2 team names from the Italian Super Lega and we will give you a prediction of the result of the match based on previous data!"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("OK"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Teams",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
            SizedBox(height: 16),
            // Home Team Selection Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Home Team",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey[700]),
                    ),
                    DropdownButton<String>(
                      value: selectedHomeTeam,
                      hint: Text("Choose a team"),
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Away Team Selection Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Away Team",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey[700]),
                    ),
                    DropdownButton<String>(
                      value: selectedAwayTeam,
                      hint: Text("Choose a team"),
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
                  ],
                ),
              ),
            ),
            Spacer(),
            // Prediction Button
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: getPrediction,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Get Prediction",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blueGrey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics, color: Colors.grey),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.grey),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle navigation taps if needed
        },
      ),
    );
  }
}
