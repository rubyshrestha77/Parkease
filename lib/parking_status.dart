import 'package:flutter/material.dart';
import 'package:parkease/dashboard.dart';
import 'package:parkease/parking_details.dart';

class ParkingStatusPage extends StatefulWidget {
  @override
  _ParkingStatusPageState createState() => _ParkingStatusPageState();
}

class _ParkingStatusPageState extends State<ParkingStatusPage> {
  DateTime _startTime = DateTime.now();
  int _selectedDuration = 1; // Default duration in hours
  final List<int> _durations = [1, 2, 3, 4, 5]; // List of available durations
  double _costPerHour = 15.0; // cost per hour

  @override
  Widget build(BuildContext context) {
    double totalCost = _selectedDuration * _costPerHour;

    return Scaffold(
      appBar: AppBar(
        title: Text('Parking Status'),
        backgroundColor: Color.fromARGB(255, 98, 190, 236),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Starting Time: $_startTime'),
            SizedBox(height: 20),
            Text('Select Parking Duration (hours):'),
            DropdownButton<int>(
              value: _selectedDuration,
              onChanged: (newValue) {
                setState(() {
                  _selectedDuration = newValue!;
                });
              },
              items: _durations.map((duration) {
                return DropdownMenuItem<int>(
                  value: duration,
                  child: Text('$duration hours'),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text('End Time: ${_calculateEndTime().toString()}'),
            SizedBox(height: 20),
            Text('Cost per Hour: \Rs. $_costPerHour'),
            SizedBox(height: 20),
            Text('Total Cost: \Rs. ${totalCost.toStringAsFixed(2)}'),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    ); // Close the page
                  },
                  child: Text('Confirm'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 98, 190, 236),
                    //textStyle: TextStyle(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Store parking details
                    ParkingDetails parking = ParkingDetails(
                        startTime: _startTime, duration: _selectedDuration);
                    //to navigate to new page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                    // Implement confirmation logic here
                    // For example, you can store parking details and navigate to a new page.
                  },
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 98, 190, 236),
                    //textStyle: TextStyle(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => Dashboard()),
            //     );
            //     // Implement confirmation logic here
            //   },
            //   child: Text('Confirm Parking'),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Color.fromARGB(255, 98, 190, 236),
            //     //textStyle: TextStyle(color: Colors.black),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  DateTime _calculateEndTime() {
    return _startTime.add(Duration(hours: _selectedDuration));
  }
}
