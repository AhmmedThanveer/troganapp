import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StackedImageContainerWidget extends StatelessWidget {
  const StackedImageContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Stack(
        clipBehavior: Clip.none, // Allows the child to be outside of the box
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: double.infinity,
              height: 140,
              padding: EdgeInsets.only(
                  top: 40, left: 20, right: 20, bottom: 20), // Adjusted padding
              decoration: BoxDecoration(
                color: Color.fromRGBO(
                    246, 234, 182, 0.5), // Set the RGBA color here
                borderRadius: BorderRadius.circular(12),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black26,
                //     blurRadius: 8,
                //     offset: Offset(0, 2),
                //   ),
                // ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Practice With Previous Year\nQuestion Papers',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10), // Space for the image
                ],
              ),
            ),
          ),
          Positioned(
              top:
                  -30, // Position where part of the image is outside the container
              right: 30, // Left margin from the container
              child: Image.asset('assets/images/pngtree-boy.png')),
          Positioned(
            bottom:
                -20, // Position the button half outside the top of the container
            left: 0,
            right: 0,
            child: Center(
              // Center the button horizontally
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.deepPurple,
                  child: Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
