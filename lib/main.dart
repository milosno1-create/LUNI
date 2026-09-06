import 'package:flutter/material.dart';

void main() {
  runApp(const LuniApp());
}

class LuniApp extends StatelessWidget {
  const LuniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calcolatrice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _input = "";

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _input = "";
        _output = "0";
      } else if (buttonText == "=") {
        if (_input == "1234") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatScreen()),
          );
        } else {
          _output = "Errore";
        }
      } else {
        _input += buttonText;
        _output = _input;
      }
    });
  }

  Widget _buildButton(String text, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(22.0),
          ),
          onPressed: () => _buttonPressed(text),
          child: Text(text, style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calcolatrice')),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(_output, style: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold)),
          ),
          const Expanded(child: Divider()),
          Column(
            children: [
              Row(children: [_buildButton("7", Colors.grey[800]!), _buildButton("8", Colors.grey[800]!), _buildButton("9", Colors.grey[800]!), _buildButton("/", Colors.orange)]),
              Row(children: [_buildButton("4", Colors.grey[800]!), _buildButton("5", Colors.grey[800]!), _buildButton("6", Colors.grey[800]!), _buildButton("X", Colors.orange)]),
              Row(children: [_buildButton("1", Colors.grey[800]!), _buildButton("2", Colors.grey[800]!), _buildButton("3", Colors.grey[800]!), _buildButton("-", Colors.orange)]),
              Row(children: [_buildButton("C", Colors.redAccent), _buildButton("0", Colors.grey[800]!), _buildButton("=", Colors.green), _buildButton("+", Colors.orange)]),
            ],
          )
        ],
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LUNI Private Chat')),
      body: const Center(
        child: Text('Benvenuto in LUNI Messenger!', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
