import 'package:flutter/material.dart';

class ProfileFormPage extends StatefulWidget {
    const ProfileFormPage({Key? key}) : super(key: key);

    @override
    State<ProfileFormPage> createState() => _ProfileFormPageState();
}

class _ProfileFormPageState extends State<ProfileFormPage> {
    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _emailController = TextEditingController();
    final _aboutController = TextEditingController();

    @override
    void dispose() {
        _nameController.dispose();
        _emailController.dispose();
        _aboutController.dispose();
        super.dispose();
    }

    void _showResultDialog(String name, String email, String about) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: const Text('Eingegebene Daten'),
                content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text('Name: $name'),
                        Text('E-Mail: $email'),
                        Text('Über mich: $about'),
                    ],
                ),
                actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('OK'),
                    ),
                ],
            ),
        );
    }

    String? _validateEmail(String? value) {
        if (value == null || value.isEmpty) return 'Bitte E-Mail-Adresse eingeben';
        final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
        if (!emailRegex.hasMatch(value)) return 'Ungültige E-Mail-Adresse';
        return null;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('Profil bearbeiten')),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                    key: _formKey,
                    child: ListView(
                        children: [
                            TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                    labelText: 'Name',
                                    border: OutlineInputBorder(),
                                ),
                                validator: (value) =>
                                        value == null || value.isEmpty ? 'Bitte Name eingeben' : null,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                    labelText: 'E-Mail-Adresse',
                                    border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: _validateEmail,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                                controller: _aboutController,
                                decoration: const InputDecoration(
                                    labelText: 'Über mich',
                                    border: OutlineInputBorder(),
                                ),
                                maxLines: 5,
                                validator: (value) =>
                                        value == null || value.isEmpty ? 'Bitte etwas über dich schreiben' : null,
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                                onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                        _showResultDialog(
                                            _nameController.text,
                                            _emailController.text,
                                            _aboutController.text,
                                        );
                                    }
                                },
                                child: const Text('Absenden'),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}