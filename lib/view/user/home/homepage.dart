import 'package:connect_care/utils/commonwidget/logout_slert.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<List<Color>> gradients = [
    [
      const Color(0xFF9DD366),
      const Color(0xFF8EC254)
    ], // Green gradient for first item
    [const Color(0xFFEB5565), const Color(0xFFDB4655)],
  ];
  // Example gradient list
  final List<String> content1 = ["HOD'S", "Recruiter's"];
  // Example content
  final List<String> content2 = ["16", "62"];
  // Example titles
  final List<String> content3 = ["View HODS", "View "];
  List<String> page = ['/hod', ' /recruiter'];
  // Example subtitles
  final int index = 0;
  // Example index
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [Padding(
          padding: const EdgeInsets.only(right: 30),
          child: IconButton(
              onPressed: () {
                logoutAlertDialog(context, screenHeight, screenWidth);
              },
              icon: Icon(
                Icons.logout,
                size: 25,
                color: Colors.black,
              )),
        ),],
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Admin',
            style: GoogleFonts.merriweatherSans(
                fontSize: 17, fontWeight: FontWeight.w400),
          ),
        ),
      ),
      body: Column(
        children: [
          // First container with content
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildContentContainer(screenHeight, screenWidth, 0),
              SizedBox(
                width: screenWidth * 0.05,
              ),
              buildContentContainer(screenHeight, screenWidth, 1),
            ],
          ),
          // Second container with content
          SizedBox(
            height: 15,
          ),
          // TabBar with TabBarView
          Expanded(
            child: DefaultTabController(
              length: 2, // Number of tabs
              child: Column(
                children: [
                  const TabBar(
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: 'Head of Department'),
                      Tab(text: 'Recruiters'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        TabContent(),
                        // Tab 2 with ListView.builder
                        TabContent(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to create content containers with shared styling
  Widget buildContentContainer(
      double screenHeight, double screenWidth, int ind) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, page[ind]);
      },
      child: Container(
        height: screenHeight * 0.15,
        width: screenWidth * 0.35,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradients[ind],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                content1[ind],
                style: GoogleFonts.merriweatherSans(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                content2[ind],
                style: GoogleFonts.merriweatherSans(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    content3[ind],
                    style: GoogleFonts.merriweatherSans(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: 5),
                  const Icon(Icons.chevron_right,
                      color: Colors.white, size: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 35),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.person, size: 30, color: Colors.white),
              ),
              // const SizedBox(width: 15),

              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Ayisha Kasim',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
    );
  }
}
