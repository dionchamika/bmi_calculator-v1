import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

// Main application widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using GetMaterialApp 
    return GetMaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ProductSans',
      ),
      home: CalculateScreen(),
    );
  }
}

// BMI calculation
class CalculateScreen extends StatelessWidget {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Using Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculate BMI',
          style: TextStyle(color: Colors.grey[800]),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextFields for user input
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Height (cm)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Weight (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Button to BMI calculation and navigate to InfoScreen
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                // Calculate BMI and navigate to InfoScreen
                double height = double.tryParse(heightController.text) ?? 0.0;
                double weight = double.tryParse(weightController.text) ?? 0.0;
                double bmi = weight / ((height / 100) * (height / 100));
                Get.to(() => InfoScreen(bmi: bmi));
              },
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
      // BottomAppBar for footer with my name
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
}

// display BMI information
class InfoScreen extends StatelessWidget {
  final double bmi;

  InfoScreen({required this.bmi});

  @override
  Widget build(BuildContext context) {
    String category = _getCategory();

    // Scaffold 
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Information',
          style: TextStyle(color: Colors.grey[800]),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display calculated BMI and category
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
      // Footer with my name
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

  // determine BMI category
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
