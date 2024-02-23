import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'result_page.dart';

/// This is the main input page for the BMI Calculator app!!

class InputPage extends StatelessWidget {
  // Controllers for height and weight input fields
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with the title
      appBar: AppBar(
        title: Text('Calculate BMI'),
        centerTitle: true,
      ),
      // Body section with input fields and calculate button
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input field for height
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
              decoration: InputDecoration(
                labelText: 'Enter Height (cm)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Input field for weight
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
              decoration: InputDecoration(
                labelText: 'Enter Weight (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Button to calculate BMI
            ElevatedButton(
              onPressed: () {
                // Retrieve height and weight from input fields
                double height = double.tryParse(heightController.text) ?? 0.0;
                double weight = double.tryParse(weightController.text) ?? 0.0;

                // Check if valid numbers are entered
                if (height == 0.0 || weight == 0.0) {
                  _showWarningDialog(context, 'Please enter valid numbers for height and weight.');
                } else {
                  // Calculate BMI and navigate to result page
                  double bmi = weight / ((height / 100) * (height / 100));
                  Get.to(() => ResultPage(bmi: bmi));
                }
              },
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
      // Bottom navigation bar with developer information
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Container(
          height: 50.0,
          child: Center(
            child: Text(
              'Developed by Dion Chamika',
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ),
      ),
    );
  }

  /// Shows a warning dialog with the given [message].
  void _showWarningDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
