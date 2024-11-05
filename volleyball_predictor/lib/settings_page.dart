import 'package:flutter/material.dart';
import 'nav_bar.dart';


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 20),
            // Example Settings Toggle
            SwitchListTile(
              title: Text("Dark Mode"),
              value: false, // replace with actual theme state if implementing theme changes
              onChanged: (value) {
                // Add functionality for changing theme
              },
            ),
            Divider(),
            ListTile(
              title: Text("About the App"),
              subtitle: Text("Version 1.0.0"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2),

    );
  }
}
