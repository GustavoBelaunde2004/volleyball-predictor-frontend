import 'package:flutter/material.dart';
import 'nav_bar.dart';


class StatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Stats"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Statistics Overview",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 20),
            // Example Stat Box
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
                      "Top Teams",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                    ),
                    SizedBox(height: 8),
                    Text("Perugia - 85% Win Rate", style: TextStyle(fontSize: 16)),
                    Text("Modena - 78% Win Rate", style: TextStyle(fontSize: 16)),
                    // Add more stats as needed
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1),

    );
  }
}
