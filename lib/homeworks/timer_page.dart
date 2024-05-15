import 'package:flutter/material.dart';

class TimerApp extends StatefulWidget {
  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  late int _secondsRemaining = 0;
  late TextEditingController _controller;
  bool _isCountingDown = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void _startTimer() {
    int seconds = int.tryParse(_controller.text) ?? 0;
    if (seconds > 0) {
      setState(() {
        _secondsRemaining = seconds;
        _isCountingDown = true;
      });
      _countDown();
      _controller.clear();
    }
  }

  void _stopTimer() {
    setState(() {
      _isCountingDown = false;
    });
  }

  void _countDown() {
    Future.delayed(Duration(seconds: 1), () {
      if (_isCountingDown && _secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
        _countDown();
      } else {
        setState(() {
          _isCountingDown = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_secondsRemaining seconds remaining',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            _isCountingDown
                ? ElevatedButton(
                    onPressed: _stopTimer,
                    child: const Text('Stop Timer'),
                  )
                : ElevatedButton(
                    onPressed: _startTimer,
                    child: const Text('Start Timer'),
                  ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'Set timer (seconds)',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
