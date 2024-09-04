import 'dart:ffi';

class MycourseModel {
  int status;
  String message;
  Data data;

  MycourseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MycourseModel.fromJson(Map<String, dynamic> json) => MycourseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Userdata userdata;
  List<Subject> subjects;
  List<dynamic> pyqExams;
  List<dynamic> upcomingExams;
  String syllabus;
  String practiceLink;
  int isValidLogin;
  String validityMessage;

  Data({
    required this.userdata,
    required this.subjects,
    required this.pyqExams,
    required this.upcomingExams,
    required this.syllabus,
    required this.practiceLink,
    required this.isValidLogin,
    required this.validityMessage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userdata: Userdata.fromJson(json["userdata"]),
        subjects: List<Subject>.from(
            json["subjects"].map((x) => Subject.fromJson(x))),
        pyqExams: List<dynamic>.from(json["pyq_exams"].map((x) => x)),
        upcomingExams: List<dynamic>.from(json["upcoming_exams"].map((x) => x)),
        syllabus: json["syllabus"],
        practiceLink: json["practice_link"],
        isValidLogin: json["is_valid_login"],
        validityMessage: json["validity_message"],
      );

  Map<String, dynamic> toJson() => {
        "userdata": userdata.toJson(),
        "subjects": List<dynamic>.from(subjects.map((x) => x.toJson())),
        "pyq_exams": List<dynamic>.from(pyqExams.map((x) => x)),
        "upcoming_exams": List<dynamic>.from(upcomingExams.map((x) => x)),
        "syllabus": syllabus,
        "practice_link": practiceLink,
        "is_valid_login": isValidLogin,
        "validity_message": validityMessage,
      };
}

class Subject {
  String id;
  String title;
  Int courseId;
  String levelId;
  String order;
  String thumbnail;
  String background;
  String icon;
  String free;
  dynamic instructorId;
  Int oldSectionId;

  Subject({
    required this.id,
    required this.title,
    required this.courseId,
    required this.levelId,
    required this.order,
    required this.thumbnail,
    required this.background,
    required this.icon,
    required this.free,
    required this.instructorId,
    required this.oldSectionId,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        title: json["title"],
        courseId: json["course_id"],
        levelId: json["level_id"],
        order: json["order"],
        thumbnail: json["thumbnail"],
        background: json["background"],
        icon: json["icon"],
        free: json["free"],
        instructorId: json["instructor_id"],
        oldSectionId: json["old_section_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "course_id": courseId,
        "level_id": levelId,
        "order": order,
        "thumbnail": thumbnail,
        "background": background,
        "icon": icon,
        "free": free,
        "instructor_id": instructorId,
        "old_section_id": oldSectionId,
      };
}

class Userdata {
  String id;
  String firstName;
  String lastName;
  String phone;
  String countryCode;
  dynamic phoneSecondary;
  String userEmail;
  String email;
  String gender;
  String place;
  String roleId;
  String roleLabel;
  String deviceId;
  String status;
  String courseId;
  String courseName;
  String courseType;
  String image;
  dynamic androidVersion;
  String deviceIdMessage;
  String noCourseText;
  String noCourseImage;
  String contactEmail;
  String contactPhone;
  String contactWhatsapp;
  String contactAddress;
  String contactAbout;
  String zoomId;
  String zoomPassword;
  String zoomApiKey;
  String zoomSecretKey;
  String zoomWebDomain;
  String token;
  String privacyPolicy;
  String privacyPolicyText;
  String coins;

  Userdata({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.countryCode,
    required this.phoneSecondary,
    required this.userEmail,
    required this.email,
    required this.gender,
    required this.place,
    required this.roleId,
    required this.roleLabel,
    required this.deviceId,
    required this.status,
    required this.courseId,
    required this.courseName,
    required this.courseType,
    required this.image,
    required this.androidVersion,
    required this.deviceIdMessage,
    required this.noCourseText,
    required this.noCourseImage,
    required this.contactEmail,
    required this.contactPhone,
    required this.contactWhatsapp,
    required this.contactAddress,
    required this.contactAbout,
    required this.zoomId,
    required this.zoomPassword,
    required this.zoomApiKey,
    required this.zoomSecretKey,
    required this.zoomWebDomain,
    required this.token,
    required this.privacyPolicy,
    required this.privacyPolicyText,
    required this.coins,
  });

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        countryCode: json["country_code"],
        phoneSecondary: json["phone_secondary"],
        userEmail: json["user_email"],
        email: json["email"],
        gender: json["gender"],
        place: json["place"],
        roleId: json["role_id"],
        roleLabel: json["role_label"],
        deviceId: json["device_id"],
        status: json["status"],
        courseId: json["course_id"],
        courseName: json["course_name"],
        courseType: json["course_type"],
        image: json["image"],
        androidVersion: json["android_version"],
        deviceIdMessage: json["device_id_message"],
        noCourseText: json["no_course_text"],
        noCourseImage: json["no_course_image"],
        contactEmail: json["contact_email"],
        contactPhone: json["contact_phone"],
        contactWhatsapp: json["contact_whatsapp"],
        contactAddress: json["contact_address"],
        contactAbout: json["contact_about"],
        zoomId: json["zoom_id"],
        zoomPassword: json["zoom_password"],
        zoomApiKey: json["zoom_api_key"],
        zoomSecretKey: json["zoom_secret_key"],
        zoomWebDomain: json["zoom_web_domain"],
        token: json["token"],
        privacyPolicy: json["privacy_policy"],
        privacyPolicyText: json["privacy_policy_text"],
        coins: json["coins"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "country_code": countryCode,
        "phone_secondary": phoneSecondary,
        "user_email": userEmail,
        "email": email,
        "gender": gender,
        "place": place,
        "role_id": roleId,
        "role_label": roleLabel,
        "device_id": deviceId,
        "status": status,
        "course_id": courseId,
        "course_name": courseName,
        "course_type": courseType,
        "image": image,
        "android_version": androidVersion,
        "device_id_message": deviceIdMessage,
        "no_course_text": noCourseText,
        "no_course_image": noCourseImage,
        "contact_email": contactEmail,
        "contact_phone": contactPhone,
        "contact_whatsapp": contactWhatsapp,
        "contact_address": contactAddress,
        "contact_about": contactAbout,
        "zoom_id": zoomId,
        "zoom_password": zoomPassword,
        "zoom_api_key": zoomApiKey,
        "zoom_secret_key": zoomSecretKey,
        "zoom_web_domain": zoomWebDomain,
        "token": token,
        "privacy_policy": privacyPolicy,
        "privacy_policy_text": privacyPolicyText,
        "coins": coins,
      };
}
