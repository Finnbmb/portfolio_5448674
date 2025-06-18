import 'package:flutter/material.dart';

// Datenklassen für die Zusammenfassung
class ProfileInfo {
  final String name;
  final String email;
  final String aboutMe; // Über mich

  ProfileInfo({
    required this.name,
    required this.email,
    required this.aboutMe,
  });
}

class Settings {
  final bool darkMode;
  final bool offlineMode;
  final bool notifications;
  final bool newsletter;

  Settings({
    required this.darkMode,
    required this.offlineMode,
    required this.notifications,
    required this.newsletter,
  });
}

class SummaryPage extends StatelessWidget {
  final ProfileInfo profileInfo;
  final double sliderValue;
  final Settings settings;

  const SummaryPage({
    Key? key,
    required this.profileInfo,
    required this.sliderValue,
    required this.settings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zusammenfassung')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Name: ${profileInfo.name}'),
              subtitle: Text(
                  'E-Mail: ${profileInfo.email}\nÜber mich: ${profileInfo.aboutMe}'),
            ),
            ListTile(
              title: Text('Slider-Wert: ${sliderValue.toStringAsFixed(2)}'),
            ),
            ListTile(
              title: Text('Dark Mode: ${settings.darkMode ? "An" : "Aus"}'),
              subtitle: Text(
                  'Offline Modus: ${settings.offlineMode ? "An" : "Aus"}\n'
                  'Benachrichtigungen: ${settings.notifications ? "An" : "Aus"}\n'
                  'Newsletter: ${settings.newsletter ? "An" : "Aus"}'),
            ),
          ],
        ),
      ),
    );
  }
}
