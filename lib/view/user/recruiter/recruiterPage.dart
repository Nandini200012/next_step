import 'package:connect_care/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Recruiterpage extends StatefulWidget {
  const Recruiterpage({super.key});

  @override
  State<Recruiterpage> createState() => _RecruiterpageState();
}

class _RecruiterpageState extends State<Recruiterpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recruiters',
          style: GoogleFonts.merriweatherSans(
              fontSize: 15, fontWeight: FontWeight.w400),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_recruiter');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor, // Set button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
              ),
              child: const Text(
                'Add Recruiter +',
                style: TextStyle(color: Colors.white), // Set text color
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Sorting Container
          Container(
            padding: const EdgeInsets.all(12.0),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sort by:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  value: 'Name',
                  items: <String>['Name', 'Position', 'Department']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    // Add sorting logic here
                  },
                ),
              ],
            ),
          ),

          // HOD List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              itemCount: 10, // Example item count
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blueAccent,
                        child:
                            Icon(Icons.person, size: 30, color: Colors.white),
                      ),
                      SizedBox(width: 15),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' Ayisha Kasim',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text('Bachelor of Computer application'),
                          Text('ayisha007@gmil.com'),
                          Text('+91 7865473286'),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
