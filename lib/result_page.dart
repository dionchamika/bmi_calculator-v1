import 'package:flutter/material.dart';

/// The result page displaying Output BMI information!!

class ResultPage extends StatelessWidget {
  /// The calculated BMI value.
  final double bmi;

  /// Constructor to initialize the [bmi].
  ResultPage({required this.bmi});

  @override
  Widget build(BuildContext context) {
    // Determine the BMI category based on the calculated BMI.
    String category = _getCategory();

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Information'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your BMI: $bmi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Category: $category',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
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

  /// Determines the BMI category based on the BMI value.
  String _getCategory() {
    if (bmi < 16) {
      return 'Severe undernourishment';
    } else if (bmi >= 16 && bmi < 17) {
      return 'Medium undernourishment';
    } else if (bmi >= 17 && bmi < 18.5) {
      return 'Slight undernourishment';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Normal nutrition state';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Overweight';
    } else if (bmi >= 30 && bmi < 40) {
      return 'Obesity';
    } else {
      return 'Pathological obesity';
    }
  }
}
