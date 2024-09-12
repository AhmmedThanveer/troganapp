import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestseriesGriditem extends StatelessWidget {
  const TestseriesGriditem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        shrinkWrap: true,

        scrollDirection: Axis.horizontal,
        // physics: NeverScrollableScrollPhysics(),

        itemCount: 2, // Number of test series
        itemBuilder: (context, index) {
          // Define gradient colors for each card
          final List<List<Color>> gradients = [
            [
              Color.fromARGB(255, 200, 122, 214),
              Color(0xFF8E24AA)
            ], // Gradient for first item
            [
              Color.fromARGB(255, 240, 191, 176),
              Color.fromARGB(255, 235, 107, 68)
            ], // Gradient for second item
          ];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomShapeCard(
              gradientColors:
                  gradients[index], // Pass gradient colors to the card
            ),
          );
        },
      ),
    );
  }
}

class CustomShapeCard extends StatelessWidget {
  final List<Color> gradientColors;

  const CustomShapeCard({
    Key? key,
    required this.gradientColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      child: SizedBox(
        width: screenW / 2, // Adjust the width as needed
        height: screenH / 5, // Adjust the height as needed
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// Background color
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: gradientColors,
                  stops: [0.0142, 0.9858],
                  transform: GradientRotation(
                      -pi / 4), // Apply angle of 136.72 degrees
                ),
              ),
            ),
            CustomPaint(
              painter: CardPaint(gradientColors: gradientColors),
              size: Size(300, 200), // Match the size to ClipRRect
            ),
            // Add other UI elements on top of the painted card here
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Exam 102 - Biology ",
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                  Spacer(),
                  Text(
                    '10 Questions 120 mins',
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                  ),
                  Spacer(),
                  SizedBox(
                    width: screenW / 0.5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {},
                      child: Text(
                        "Attempt Now",
                        style: GoogleFonts.inter(
                            color: Color.fromARGB(255, 18, 18, 19),
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardPaint extends CustomPainter {
  final List<Color> gradientColors;

  CardPaint({required this.gradientColors});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: gradientColors,
        stops: [0.0142, 0.9858],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    Path path = Path()
      ..moveTo(size.width, size.height) // Start at the bottom-right
      ..lineTo(size.width * 0.85,
          size.height) // Move to three-quarters to the bottom-left
      ..lineTo(0, size.height * 0.58) // Move to the bottom-left
      ..lineTo(0, 0) // Move to the top-left
      ..lineTo(size.width, 0) // Move to the top-right
      ..close(); // Close the path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
