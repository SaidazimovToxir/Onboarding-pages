import 'package:flutter/material.dart';

class TemperaturaApp extends StatefulWidget {
  @override
  _TemperaturaAppState createState() => _TemperaturaAppState();
}

class _TemperaturaAppState extends State<TemperaturaApp> {
  late double value;
  String _convertedValue = '';
  bool _isCelsius = true;

  final TextEditingController _controller = TextEditingController();

  void _convertTemperature() {
    setState(() {
      double inputValue = double.tryParse(_controller.text) ?? 0;
      if (_isCelsius) {
        double fahrenheitValue = (inputValue * 9 / 5) + 32;
        _convertedValue = '${fahrenheitValue.toStringAsFixed(2)} °F';
      } else {
        double celsiusValue = (inputValue - 32) * 5 / 9;
        _convertedValue = '${celsiusValue.toStringAsFixed(2)} °C';
      }
    });
  }

  void _toggleConversion() {
    setState(() {
      _isCelsius = !_isCelsius;
      _convertedValue = '';
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculate Temperature'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                labelText:
                    'Enter Temperature in ${_isCelsius ? 'Celsius' : 'Fahrenheit'}',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertTemperature,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            Text(
              _convertedValue,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleConversion,
              child: Text(
                  'Switch to ${_isCelsius ? 'Fahrenheit to Celsius' : 'Celsius to Fahrenheit'}'),
            ),
          ],
        ),
      ),
    );
  }
}
