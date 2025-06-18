import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
    const SettingsPage({Key? key}) : super(key: key);

    @override
    State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
    bool newsletterSubscribed = false;
    bool updatesSubscribed = false;
    bool darkMode = false;
    bool offlineMode = false;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Einstellungen'),
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
                    ],
                ),
            ),
        );
    }
}