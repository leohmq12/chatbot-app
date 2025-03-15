import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double income = 0;
  double tax = 0;

  void calculateTax() {
    // Simple tax calculation logic (replace with actual tax rules)
    setState(() {
      tax = income * 0.2; // 20% tax rate for example
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tax Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter Income'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  income = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateTax,
              child: Text('Calculate Tax'),
            ),
            SizedBox(height: 20),
            Text('Tax: £${tax.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}