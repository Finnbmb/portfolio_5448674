import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider Seite"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              divisions: 100,
              label: _sliderValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              "Aktueller Wert: ${_sliderValue.round()}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Container(
              width: _sliderValue * 2, // verändert sich mit dem Wert
              height: 20,
              color: Colors.blue.withOpacity(_sliderValue / 100), // transparenter bei niedrigen Werten
            ),
          ],
        ),
      ),
    );
  }
}
