import 'dart:io';
import 'package:connect_care/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddrecruiterPage extends StatefulWidget {
  const AddrecruiterPage({super.key});

  @override
  State<AddrecruiterPage> createState() => _AddrecruiterPageState();
}

class _AddrecruiterPageState extends State<AddrecruiterPage> {
  // Add other controllers here for text fields
  final TextEditingController _HodnameController = TextEditingController();
  final TextEditingController _HoddepartmentController =
      TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers that are used
    _HodnameController.dispose();
    _HoddepartmentController.dispose();
    _mailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Recruiter',
          style: GoogleFonts.merriweatherSans(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal:  36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HOD Name, Department, Email, and Phone input fields
            commonTextfield(
              controller: _HodnameController,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              title: "HOD Name",
              hintText: "Enter HOD Name",
              keyboardType: TextInputType.text,
            ),
            commonTextfield(
              controller: _HoddepartmentController,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              title: "Department",
              hintText: "Enter Department",
              keyboardType: TextInputType.text,
            ),
            commonTextfield(
              controller: _mailController,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              title: "Email",
              hintText: "Enter Email",
              keyboardType: TextInputType.emailAddress,
            ),
            commonTextfield(
              controller: _phoneController,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              title: "Phone",
              hintText: "Enter Phone Number",
              keyboardType: TextInputType.phone,
            ),Padding(
        padding: EdgeInsets.only(bottom: screenHeight * 0.03,top:screenHeight * 0.03, ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Cancel Button
            Container(
              height: screenHeight * 0.06,
              width: screenWidth * 0.34,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Logic to cancel action (navigate back)
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  // padding:
                  //     const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text(
                  'Cancel',
                  style: GoogleFonts.merriweatherSans(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            // Add Button
            Container(
              height: screenHeight * 0.06,
              width: screenWidth * 0.34,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Logic to add recruiter (e.g., save data)
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text(
                  'Add',
                  style: GoogleFonts.merriweatherSans(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
          ],
        ),
      ),
     
    );
  }

  Widget commonTextfield({
    required TextEditingController? controller,
    required double screenHeight,
    required double screenWidth,
    required String title,
    String? hintText,
    required TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.02),
        Text(
          title,
          style: GoogleFonts.merriweatherSans(
              fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: screenHeight * 0.008),

        // Category Name Input
        Container(
          height: screenHeight * 0.06,
          width: screenWidth * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(2, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
