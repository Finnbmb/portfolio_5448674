import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final bool darkMode;
  final bool offlineMode;
  final bool notifications;
  final bool newsletter;

  const SettingsPage({
    Key? key,
    required this.darkMode,
    required this.offlineMode,
    required this.notifications,
    required this.newsletter,
  }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool newsletterSubscribed;
  late bool updatesSubscribed;
  late bool darkMode;
  late bool offlineMode;

  @override
  void initState() {
    super.initState();
    newsletterSubscribed = widget.newsletter;
    updatesSubscribed = widget.notifications;
    darkMode = widget.darkMode;
    offlineMode = widget.offlineMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Einstellungen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, {
              'darkMode': darkMode,
              'offlineMode': offlineMode,
              'notifications': updatesSubscribed,
              'newsletter': newsletterSubscribed,
            });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CheckboxListTile(
              title: const Text('Newsletter abonnieren'),
              value: newsletterSubscribed,
              onChanged: (value) {
                setState(() {
                  newsletterSubscribed = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Updates erhalten'),
              value: updatesSubscribed,
              onChanged: (value) {
                setState(() {
                  updatesSubscribed = value ?? false;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Dunkler Modus'),
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Offline-Modus'),
              value: offlineMode,
              onChanged: (value) {
                setState(() {
                  offlineMode = value;
                });
              },
            ),
            const Spacer(),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Aktuelle Auswahl:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Newsletter: ${newsletterSubscribed ? "Ja" : "Nein"}'),
                    Text('Updates: ${updatesSubscribed ? "Ja" : "Nein"}'),
                    Text('Dunkler Modus: ${darkMode ? "Aktiviert" : "Deaktiviert"}'),
                    Text('Offline-Modus: ${offlineMode ? "Aktiviert" : "Deaktiviert"}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'darkMode': darkMode,
                  'offlineMode': offlineMode,
                  'notifications': updatesSubscribed,
                  'newsletter': newsletterSubscribed,
                });
              },
              child: const Text('Speichern'),
            ),
          ],
        ),
      ),
    );
  }
}