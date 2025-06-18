import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  final double initialValue;
  const SliderPage({Key? key, required this.initialValue}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  late double _sliderValue;

  @override
  void initState() {
    super.initState();
    _sliderValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider Seite"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, _sliderValue);
          },
        ),
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
              width: _sliderValue * 2,
              height: 20,
              color: Colors.blue.withOpacity(_sliderValue / 100),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _sliderValue);
              },
              child: const Text('Speichern und zurück'),
            ),
          ],
        ),
      ),
    );
  }
}
