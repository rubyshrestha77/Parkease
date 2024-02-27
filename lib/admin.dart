import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parkease/dashboard.dart';

class UserData {
  final String username;
  final String email;
  final String address;
  // final int number;
  final String vehicleNumber;

  UserData({
    required this.username,
    required this.email,
    required this.address,
    // required this.number,
    required this.vehicleNumber,
  });
}

class MyDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data Table'),
        backgroundColor: Color.fromARGB(255, 98, 190, 236),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          },
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          List<UserData> userDataList = [];
          snapshot.data!.docs.forEach((doc) {
            userDataList.add(UserData(
              username: doc['username'],
              email: doc['email'],
              address: doc['address'],
              // number: int['number'],
              vehicleNumber: doc['vehicleNumber'],
            ));
          });

          return DataTable(
            columns: [
              DataColumn(label: Text('Username')),
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('Address')),
              // DataColumn(label: Text('Number')),
              DataColumn(label: Text('Vehicle Number')),
              DataColumn(label: Text('Edit')), // Additional column for editing
            ],
            rows: userDataList.map((userData) {
              return DataRow(cells: [
                DataCell(Text(userData.username)),
                DataCell(Text(userData.email)),
                DataCell(Text(userData.address)),
                // DataCell(Text(userData.number)),
                DataCell(Text(userData.vehicleNumber)),
                DataCell(IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Implement editing functionality here
                    // You can navigate to a new screen or show a dialog for editing
                  },
                )),
              ]);
            }).toList(),
          );
        },
      ),
    );
  }
}
