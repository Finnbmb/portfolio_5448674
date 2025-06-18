import 'package:flutter/material.dart';
import 'slider_page.dart';
import 'profile_form_page.dart';
import 'settings_page.dart';
import 'summary_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = '';
  String email = '';
  String aboutMe = '';
  double sliderValue = 50.0;
  bool darkMode = false;
  bool offlineMode = false;
  bool notifications = false;
  bool newsletter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () async {
              final result = await Navigator.push<Map<String, dynamic>>(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(
                    darkMode: darkMode,
                    offlineMode: offlineMode,
                    notifications: notifications,
                    newsletter: newsletter,
                  ),
                ),
              );
              if (result != null) {
                setState(() {
                  darkMode = result['darkMode'] ?? darkMode;
                  offlineMode = result['offlineMode'] ?? offlineMode;
                  notifications = result['notifications'] ?? notifications;
                  newsletter = result['newsletter'] ?? newsletter;
                });
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Willkommen im Portfolio von Finn Beimborn'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push<double>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SliderPage(initialValue: sliderValue),
                  ),
                );
                if (result != null) {
                  setState(() {
                    sliderValue = result;
                  });
                }
              },
              child: const Text('Zur SliderPage'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push<Map<String, String>>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileFormPage(
                      name: name,
                      email: email,
                      aboutMe: aboutMe,
                    ),
                  ),
                );
                if (result != null) {
                  setState(() {
                    name = result['name'] ?? name;
                    email = result['email'] ?? email;
                    aboutMe = result['aboutMe'] ?? aboutMe;
                  });
                }
              },
              child: const Text('Profil bearbeiten'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SummaryPage(
                      profileInfo: ProfileInfo(
                        name: name,
                        email: email,
                        aboutMe: aboutMe,
                      ),
                      sliderValue: sliderValue,
                      settings: Settings(
                        darkMode: darkMode,
                        offlineMode: offlineMode,
                        notifications: notifications,
                        newsletter: newsletter,
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Zur Zusammenfassung'),
            ),
          ],
        ),
      ),
    );
  }
}
