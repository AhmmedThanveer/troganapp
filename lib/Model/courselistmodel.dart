class Courslistmodel {
  int status;
  String message;
  int isPurchased;
  LastUnlocked lastUnlocked;
  LastAttendedExam lastAttendedExam;
  List<Datum> data;
  Package package;

  Courslistmodel({
    required this.status,
    required this.message,
    required this.isPurchased,
    required this.lastUnlocked,
    required this.lastAttendedExam,
    required this.data,
    required this.package,
  });

  factory Courslistmodel.fromJson(Map<String, dynamic> json) => Courslistmodel(
        status: json["status"],
        message: json["message"],
        isPurchased: json["is_purchased"],
        lastUnlocked: LastUnlocked.fromJson(json["last_unlocked"]),
        lastAttendedExam: LastAttendedExam.fromJson(json["last_attended_exam"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        package: Package.fromJson(json["package"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "is_purchased": isPurchased,
        "last_unlocked": lastUnlocked.toJson(),
        "last_attended_exam": lastAttendedExam.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "package": package.toJson(),
      };
}

class Datum {
  String id;
  String title;
  SubjectId subjectId;
  int index;
  IsLocked isLocked;
  List<Section> sections;
  Completion completion;
  dynamic exam;

  Datum({
    required this.id,
    required this.title,
    required this.subjectId,
    required this.index,
    required this.isLocked,
    required this.sections,
    required this.completion,
    required this.exam,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        subjectId: subjectIdValues.map[json["subject_id"]]!,
        index: json["index"],
        isLocked: isLockedValues.map[json["is_locked"]]!,
        sections: List<Section>.from(
            json["sections"].map((x) => Section.fromJson(x))),
        completion: completionValues.map[json["completion"]]!,
        exam: json["exam"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subject_id": subjectIdValues.reverse[subjectId],
        "index": index,
        "is_locked": isLockedValues.reverse[isLocked],
        "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
        "completion": completionValues.reverse[completion],
        "exam": exam,
      };
}

enum Completion { THE_02 }

final completionValues = EnumValues({"0/2": Completion.THE_02});

class ExamClass {
  String id;
  String title;
  String levelTitle;
  String levelId;
  String link;
  int isAttended;
  int isAttendedNew;
  Free free;

  ExamClass({
    required this.id,
    required this.title,
    required this.levelTitle,
    required this.levelId,
    required this.link,
    required this.isAttended,
    required this.isAttendedNew,
    required this.free,
  });

  factory ExamClass.fromJson(Map<String, dynamic> json) => ExamClass(
        id: json["id"],
        title: json["title"],
        levelTitle: json["level_title"],
        levelId: json["level_id"],
        link: json["link"],
        isAttended: json["is_attended"],
        isAttendedNew: json["is_attended_new"],
        free: freeValues.map[json["free"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "level_title": levelTitle,
        "level_id": levelId,
        "link": link,
        "is_attended": isAttended,
        "is_attended_new": isAttendedNew,
        "free": freeValues.reverse[free],
      };
}

enum Free { ON }

final freeValues = EnumValues({"on": Free.ON});

enum IsLocked { OFF }

final isLockedValues = EnumValues({"off": IsLocked.OFF});

class Section {
  String id;
  Title title;
  String thumbnail;
  String icon;
  Free free;
  int total;
  VideoCount videoCount;
  int isCompleted;
  int completed;

  Section({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.icon,
    required this.free,
    required this.total,
    required this.videoCount,
    required this.isCompleted,
    required this.completed,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        title: titleValues.map[json["title"]]!,
        thumbnail: json["thumbnail"],
        icon: json["icon"],
        free: freeValues.map[json["free"]]!,
        total: json["total"],
        videoCount: videoCountValues.map[json["video_count"]]!,
        isCompleted: json["is_completed"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse[title],
        "thumbnail": thumbnail,
        "icon": icon,
        "free": freeValues.reverse[free],
        "total": total,
        "video_count": videoCountValues.reverse[videoCount],
        "is_completed": isCompleted,
        "completed": completed,
      };
}

enum Title { MALAYALAM, PSYCHOLOGY }

final titleValues =
    EnumValues({"Malayalam": Title.MALAYALAM, "Psychology": Title.PSYCHOLOGY});

enum VideoCount { THE_0_VIDEOS, THE_1_VIDEOS }

final videoCountValues = EnumValues(
    {"0 Videos": VideoCount.THE_0_VIDEOS, "1 Videos": VideoCount.THE_1_VIDEOS});

enum SubjectId { THE_12 }

final subjectIdValues = EnumValues({"[\"1\", \"2\"]": SubjectId.THE_12});

class LastAttendedExam {
  LastAttendedExam();

  factory LastAttendedExam.fromJson(Map<String, dynamic> json) =>
      LastAttendedExam();

  Map<String, dynamic> toJson() => {};
}

class LastUnlocked {
  String id;
  String title;
  SubjectId subjectId;
  int index;
  IsLocked isLocked;
  List<Section> sections;
  Completion completion;
  ExamClass exam;

  LastUnlocked({
    required this.id,
    required this.title,
    required this.subjectId,
    required this.index,
    required this.isLocked,
    required this.sections,
    required this.completion,
    required this.exam,
  });

  factory LastUnlocked.fromJson(Map<String, dynamic> json) => LastUnlocked(
        id: json["id"],
        title: json["title"],
        subjectId: subjectIdValues.map[json["subject_id"]]!,
        index: json["index"],
        isLocked: isLockedValues.map[json["is_locked"]]!,
        sections: List<Section>.from(
            json["sections"].map((x) => Section.fromJson(x))),
        completion: completionValues.map[json["completion"]]!,
        exam: ExamClass.fromJson(json["exam"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subject_id": subjectIdValues.reverse[subjectId],
        "index": index,
        "is_locked": isLockedValues.reverse[isLocked],
        "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
        "completion": completionValues.reverse[completion],
        "exam": exam.toJson(),
      };
}

class Package {
  String id;
  String packageName;
  String type;
  String courseId;
  String sectionId;
  String discount;
  dynamic isFree;
  String packageType;
  String remarks;
  String validity;
  String validityInMonth;
  String razorpayApiKey;
  String subtitle;
  String totalAmount;
  String payableAmount;

  Package({
    required this.id,
    required this.packageName,
    required this.type,
    required this.courseId,
    required this.sectionId,
    required this.discount,
    required this.isFree,
    required this.packageType,
    required this.remarks,
    required this.validity,
    required this.validityInMonth,
    required this.razorpayApiKey,
    required this.subtitle,
    required this.totalAmount,
    required this.payableAmount,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        packageName: json["package_name"],
        type: json["type"],
        courseId: json["course_id"],
        sectionId: json["section_id"],
        discount: json["discount"],
        isFree: json["is_free"],
        packageType: json["package_type"],
        remarks: json["remarks"],
        validity: json["validity"],
        validityInMonth: json["validity_in_month"],
        razorpayApiKey: json["razorpay_api_key"],
        subtitle: json["subtitle"],
        totalAmount: json["total_amount"],
        payableAmount: json["payable_amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "package_name": packageName,
        "type": type,
        "course_id": courseId,
        "section_id": sectionId,
        "discount": discount,
        "is_free": isFree,
        "package_type": packageType,
        "remarks": remarks,
        "validity": validity,
        "validity_in_month": validityInMonth,
        "razorpay_api_key": razorpayApiKey,
        "subtitle": subtitle,
        "total_amount": totalAmount,
        "payable_amount": payableAmount,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
