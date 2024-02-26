// ignore: unused_import
// import 'dart:js';

import 'package:flutter/material.dart';
// import 'package:khalti_flutter/khalti_flutter.dart';

class SPBook extends StatefulWidget {
  @override
  _SPBookState createState() => _SPBookState();
}

class _SPBookState extends State<SPBook> {
  int totalSlots = 15;
  int availableSlots = 15;
  int columns = 3;
  double slotSize = 60.0;
  double outerBoxMargin = 20.0;

  List<bool> isSlotBooked =
      List.generate(18, (index) => false); // Track booked slots

  @override
  Widget build(BuildContext context) {
    //number of slots per row
    int slotsPerRow = (totalSlots / columns).ceil();

    List<Widget> slots = [];
    for (int i = 0; i < totalSlots; i++) {
      // Generate slots
      slots.add(Column(
        children: [
          GestureDetector(
            onTap: () {
              // Check if slot is available
              if (!isSlotBooked[i]) {
                // Reduce available slots after booking
                setState(() {
                  isSlotBooked[i] = true;
                  availableSlots--;
                });
                // Show booking confirmation dialog
                _showBookingConfirmation(context);
              }
            },
            child: Container(
              width: slotSize,
              height: slotSize,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: isSlotBooked[i]
                    ? Colors.red
                    : (availableSlots > 0
                        ? Colors.green
                        : Colors
                            .grey), // Change color if slot is booked or not available
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10), // Add border radius
              ),
              child: Center(
                child: Text(
                  isSlotBooked[i]
                      ? 'Booked'
                      : '', // Show "Booked" text if slot is booked
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 98, 190, 236),
        title: Text(
          'Sitapaila Parking Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 98, 190, 236),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Box to display total and available slots
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Total Slots: $totalSlots'),
                    SizedBox(width: 20), // Add space between text
                    Text('Available Slots: $availableSlots'),
                  ],
                ),
              ),
              // Outer box with border radius
              Container(
                margin: EdgeInsets.all(outerBoxMargin),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30), // Border radius
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                      20.0), // Padding for the inner content
                  child: Column(
                    children: [
                      // Slot area
                      for (int i = 0; i < slotsPerRow; i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: slots.sublist(
                              i * columns,
                              (i + 1) * columns > totalSlots
                                  ? totalSlots
                                  : (i + 1) * columns),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Show booking confirmation dialog
  Future<void> _showBookingConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button to dismiss
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your slot has been booked successfully.'),
                SizedBox(height: 10),
                Text(
                    'If you do not arrive in 30 minutes, booking will be cancelled.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Pay Now'),
              onPressed: () {
                // Navigator.of(context).pop();
                //   final config = PaymentConfig(
                //     amount: 10000, // Amount should be in paisa
                //     productIdentity: 'dell-g5-g5510-2021',
                //     productName: 'Dell G5 G5510 2021',
                //     productUrl: 'https://www.khalti.com/#/bazaar',
                //     additionalData: {
                //       // Not mandatory; can be used for reporting purpose
                //       'vendor': 'Khalti Bazaar',
                //     },
                //     mobile:
                //         '9800000001', // Not mandatory; can be used to fill mobile number field
                //     mobileReadOnly:
                //         true, // Not mandatory; makes the mobile field not editable
                //   );

                //   KhaltiButton(
                //     config: config,
                //     preferences: [
                //       // Not providing this will enable all the payment methods.
                //       PaymentPreference.khalti,
                //       PaymentPreference.eBanking,
                //     ],
                //     onSuccess: (successModel) {
                //       // Perform Server Verification
                //     },
                //     onFailure: (failureModel) {
                //       // What to do on failure?
                //     },
                //     onCancel: () {
                //       // User manually cancelled the transaction
                //     },
                //   );
              },
            ),
          ],
        );
      },
    );
  }
}

// payWithKhaltiInApp() {
//   final config = PaymentConfig(
//     amount: 10000, // Amount should be in paisa
//     productIdentity: 'dell-g5-g5510-2021',
//     productName: 'Dell G5 G5510 2021',
//     productUrl: 'https://www.khalti.com/#/bazaar',
//     additionalData: {
//       // Not mandatory; can be used for reporting purpose
//       'vendor': 'Khalti Bazaar',
//     },
//     mobile:
//         '9800000001', // Not mandatory; can be used to fill mobile number field
//     mobileReadOnly: true, // Not mandatory; makes the mobile field not editable
//   );

//   KhaltiButton(
//     config: config,
//     preferences: [
//       // Not providing this will enable all the payment methods.
//       PaymentPreference.khalti,
//       PaymentPreference.eBanking,
//     ],
//     onSuccess: (successModel) {
//       // Perform Server Verification
//       (BuildContext context) {
//         return AlertDialog(
//           title: Text('Booking Confirmation'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text('Your slot has been booked successfully.'),
//                 SizedBox(height: 10),
//                 Text(
//                     'If you do not arrive in 30 minutes, booking will be cancelled.'),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       };
//     },
//     onFailure: (failureModel) {
//       // What to do on failure?
//     },
//     onCancel: () {
//       // User manually cancelled the transaction
//     },
//   );
// }
