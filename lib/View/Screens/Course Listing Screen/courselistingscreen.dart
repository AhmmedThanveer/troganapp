import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:troganapp/Model/courselistmodel.dart';
import 'package:troganapp/View%20Model/Provider/ApiService.dart';
import 'package:troganapp/View/Screens/Course%20Listing%20Screen/Widgets/Appbar.dart';
import 'package:troganapp/View/Screens/Course%20Listing%20Screen/Widgets/upgradecoursetile.dart';
import 'package:troganapp/View/Screens/Course%20Listing%20Screen/Widgets/whatsapptile.dart';

class Courselistingscreen extends StatefulWidget {
  final String courseid;
  final String sectionid;

  const Courselistingscreen({
    super.key,
    required this.courseid,
    required this.sectionid,
  });

  @override
  _CourselistingscreenState createState() => _CourselistingscreenState();
}

class _CourselistingscreenState extends State<Courselistingscreen> {
  int _selectedIndex = 0;

  Future<Courslistmodel> fetchCourseData() async {
    final response = await http.get(Uri.parse(
        '${Api.baseUrl}levels_by_course?course_id=${widget.courseid}&section_id=${widget.sectionid}&auth_token=${Api.authtoken}'));
    if (response.statusCode == 200) {
      return Courslistmodel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load course data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CourselistingAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Container(
                      height: screenH / 5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF512E7E),
                            Color(0xFFA073DA),
                          ],
                          stops: [0.0852, 1.0],
                          transform: GradientRotation(194.66 *
                              (3.14159265358979323846264338327950288 / 180.0)),
                        ),
                      ),
                    ),
                    SizedBox(height: screenH / 6.5 - 40),
                  ],
                ),
                Positioned(
                  top: screenH / 5.5 - 40,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 25),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(7, (index) {
                          bool isSelected = index == _selectedIndex;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              child: Container(
                                width: 60,
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: isSelected
                                          ? Color.fromARGB(255, 154, 133, 184)
                                          : Colors.white),
                                  color: isSelected
                                      ? Color(0xFF512E7E)
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Day ',
                                        style: GoogleFonts.poppins(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        '${index + 1}',
                                        style: GoogleFonts.poppins(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        '${index + 1}/${index + 2}',
                                        style: GoogleFonts.poppins(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Upgradecoursetile(screenH: screenH),
            whatsapptile(screenH: screenH),
            FutureBuilder<Courslistmodel>(
              future: fetchCourseData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('404 not found');
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.data.length,
                    itemBuilder: (context, index) {
                      Datum section = snapshot.data!.data[index];
                      return ListTile(
                        leading:
                            Image.network(section.sections[index].thumbnail),
                        title: Text(section.title!),
                      );
                    },
                  );
                } else {
                  return Text('No data found');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
