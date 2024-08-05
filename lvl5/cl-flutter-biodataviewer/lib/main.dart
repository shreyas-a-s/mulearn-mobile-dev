import 'package:flutter/material.dart';
import 'bio_data.dart'; // Import the biodata.dart file

void main() {
  runApp(
    MaterialApp(
      title: 'BioData App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system, // Switch based on system theme
      home: BioDataPage(), // Set the home property to BioDataPage
      debugShowCheckedModeBanner: false, // Remove debug banner in final app
    ),
  );
}

class BioDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final biodata = Biodata.defaultData(); // Use default data

    return Scaffold(
      appBar: AppBar(
        title: Text('BioData'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${biodata.name}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Gender: ${biodata.gender}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Age: ${biodata.age}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('DOB: ${biodata.dob}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Place: ${biodata.place}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Occupation: ${biodata.occupation}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Blood Group: ${biodata.bloodGroup}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
