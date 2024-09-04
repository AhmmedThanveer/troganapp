import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurvedBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipPath(
          clipper: BottomNavBarClipper(),
          child: Container(
            height: 80.0, // Adjust the height of the nav bar
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 229, 219, 230),
                  Color.fromARGB(255, 223, 220, 222)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20.0), // Adjust the position
              child: FloatingActionButton(
                  shape: CircleBorder(),
                  backgroundColor: Color(0xFF512E7E),
                  onPressed: () {
                    // Handle onPress for the center floating action button
                  },
                  child: Image.asset(
                    'assets/images/trophy.png',
                  )),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              selectedFontSize: 16,
              elevation: 0,
              unselectedFontSize: 15,
              unselectedLabelStyle: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              selectedLabelStyle: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              selectedItemColor: Color(0xFF512E7E),
              unselectedItemColor: const Color.fromARGB(179, 180, 176, 176),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Container(), // Empty container for the center space
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile',
                ),
              ],
              onTap: (index) {
                // Handle navigation onTap
              },
            ),
          ),
        ),
      ],
    );
  }
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double height = 80.0; // Height of the navigation bar
    final double controlPoint = size.width / 2;
    final double dipHeight = 50.0; // Increase the dip height for a deeper curve

    Path path = Path()
      ..lineTo(0, 0)
      ..lineTo(0, size.height - height)
      ..quadraticBezierTo(controlPoint - 100, size.height - height,
          controlPoint, size.height - dipHeight)
      ..quadraticBezierTo(controlPoint + 100, size.height - height, size.width,
          size.height - height)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
