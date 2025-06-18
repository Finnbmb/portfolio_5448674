import 'package:flutter/material.dart';

// Beispiel-Datenklassen für die zu übergebenden Informationen
class ProfileInfo {
    final String name;
    final String email;

    ProfileInfo({required this.name, required this.email});
}

class Settings {
    final bool darkMode;
    final String language;

    Settings({required this.darkMode, required this.language});
}

// Die SummaryPage erhält alle Daten als Konstruktorparameter
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
            appBar: AppBar(
                title: const Text('Zusammenfassung'),
            ),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                    children: [
                        const Text(
                            'Profilinformationen',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(profileInfo.name),
                            subtitle: Text(profileInfo.email),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                            'Slider-Wert',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        ListTile(
                            leading: const Icon(Icons.tune),
                            title: Text('Wert: ${sliderValue.toStringAsFixed(2)}'),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                            'Einstellungen',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        ListTile(
                            leading: const Icon(Icons.settings),
                            title: Text('Dark Mode: ${settings.darkMode ? "An" : "Aus"}'),
                            subtitle: Text('Sprache: ${settings.language}'),
                        ),
                    ],
                ),
            ),
        );
    }
}