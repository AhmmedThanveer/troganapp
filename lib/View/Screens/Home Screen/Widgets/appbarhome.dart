import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:troganapp/Model/CourseModel.dart';

class appbarhome extends StatelessWidget {
  const appbarhome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(child: SizedBox.shrink()),
    );
  }
}

// import 'package:flutter/material.dart';

LinearGradient myGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF512E7E), // #512E7E
    Color(0xFFA073DA), // #A073DA
  ],
  stops: [0.0852, 1.0],
  transform: GradientRotation(194.66 *
      (3.14159265358979323846264338327950288 /
          180.0)), // Convert degrees to radians
);

class appbarhomewidget extends StatelessWidget {
  const appbarhomewidget({
    super.key,
    required this.userData,
  });

  final Userdata userData;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 30,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              Image.asset(
                "assets/images/dollar.png",
                // color: const Color(0xFFF6B647),
                width: 35.0, // Optional width
                // colorBlendMode: BlendMode.color,
                height: 20.0, // Optional height
              ),
              Text(
                userData.coins,
                style: GoogleFonts.inter(
                  color: Color(0xFFF6B647),
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(userData.image),
          ),
        )
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(28),
              bottomRight: Radius.circular(28)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF512E7E), // #512E7E
              Color(0xFFA073DA), // #A073DA
            ],
            stops: [0.0852, 1.0],
            transform: GradientRotation(194.66 *
                (3.14159265358979323846264338327950288 /
                    180.0)), // Convert degrees to radians
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 35),
              child: Text(
                'Hi Good Morning !',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text(
                userData.firstName.trim(),
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selected Course',
                                style: GoogleFonts.inter(
                                  color: Color(0xFF707070),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Montessori',
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 2,
                                  backgroundColor: Color(0xFF512E7E),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    'Change',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Image.asset('assets/images/switch.png',
                                      color: Colors.white)
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
