import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/detail_presence_controller.dart';

class DetailPresenceView extends GetView<DetailPresenceController> {
  final Map<String, dynamic> data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Presence'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "${DateFormat.yMMMMEEEEd().format(DateTime.parse(data['date']))}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Masuk",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Time: ${DateFormat.jms().format(DateTime.parse(data['masuk']!['date']))}",
                ),
                Text(
                  "Position: ${data['masuk']!['lat']} , ${data['masuk']!['long']}",
                ),
                Text(
                  "Status: ${data['masuk']!['status']}",
                ),
                Text(
                  "Distance: ${data['masuk']!['distance'].toString().split(".").first} meter",
                ),
                Text(
                  "Address: ${data['masuk']!['address']}",
                ),

                SizedBox(height: 20),

                Text(
                  "Keluar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data['keluar']?['date'] == null
                      ? "Jam: -"
                      : "Jam : ${DateFormat.jms().format(DateTime.parse(data['keluar']!['date']))}",
                ),
                Text(
                  data['keluar']?['lat'] == null &&
                          data['keluar']?['long'] == null
                      ? "Position: -"
                      : "Position: ${data['keluar']!['lat']} , ${data['keluar']!['long']}",
                ),
                Text(
                  data['keluar']?['status'] == null
                      ? "Status: -"
                      : "Status: ${data['keluar']!['status']}",
                ),
                Text(
                  data['keluar']?['distance'] == null
                      ? "Distance: -"
                      : "Distance: ${data['keluar']!['distance'].toString().split(".").first} meter",
                ),
                Text(
                  data['keluar']?['address'] == null
                      ? "Address: -"
                      : "Address: ${data['keluar']!['address']}",
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[200],
            ),
          ),
        ],
      ),
    );
  }
}
