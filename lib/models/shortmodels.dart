import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiftvote/swiftvote.dart';

class History {
  String candName, candPosition, time;
  History(this.candName, this.candPosition, this.time);

  factory History.fromJSON(Map<String, dynamic> json) {
    return History(json["candName"], json["candPosition"], json["time"]);
  }
}

class Candidate {
  String candName, candPosition;
  String? candImgUrl, candManifesto;
  Color? ccol;
  int voteCount;

  Candidate(
      {required this.candName,
      required this.candPosition,
      this.candImgUrl,
      this.ccol,
      this.voteCount = 0,
      this.candManifesto});

  factory Candidate.fromJSON(Map<String, dynamic> json) {
    return Candidate(
        candName: json["candName"],
        candPosition: json["candPosition"],
        candImgUrl: json["candImgUrl"],
        voteCount: json["voteCount"],
        candManifesto: json["candManifesto"]);
  }

  double percentVote(int totalVote) {
    return (voteCount / totalVote) * 100;
  }
}

class User {
  String userName, userEmail;
  bool isStudent;
  String? regNo, dept, faculty, level;

  User(
      {required this.userName,
      required this.userEmail,
      this.isStudent = true,
      this.regNo,
      this.dept,
      this.faculty,
      this.level});

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
        userName: json["username"],
        userEmail: json["useremail"],
        isStudent: json["isStudent"],
        regNo: json["regNo"],
        dept: json["dept"],
        faculty: json["faculty"],
        level: json["level"]);
  }
}

class VotePositions {
  Map<String, dynamic> positionsRaw;
  Map<String, List<Candidate>> positions = {};

  VotePositions({required this.positionsRaw}) {
    positions = positionsRaw.map((key, value) {
      List<Candidate> mycands = [];
      value.forEach((element) {
        mycands.add(Candidate.fromJSON(element));
      });
      return MapEntry(key, mycands);
    });
  }

  factory VotePositions.fromJSON(Map<String, dynamic> json) {
    return VotePositions(positionsRaw: json["positions"]);
  }

  int totalVote(String key) {
    int voteCount = 0;
    for (Candidate cand in positions[key]!) {
      voteCount += cand.voteCount;
    }
    return voteCount;
  }

  int totalCand(String key) {
    return positions[key]!.length;
  }
}

class MyPrefs {
  static SharedPreferences? _prefs;
  static const String mpAdminID = "admin-id";
  static const String mpUserID = "user-id";
  static const String mpElectionID = "election-id";
  static const String mpIsLoggedIn = "IsLoggedIn";
  static const String mpUserLogInDuration = "LoginDuration";

  static Future init() async => _prefs = await SharedPreferences.getInstance();

  static Future setDef(String key, String value) async {
    await _prefs!.setString(key, value);
  }

  static String? getDef(String key) => _prefs!.getString(key);

  static Future<bool> setDefInt(String key, int value) async =>
      await _prefs!.setInt(key, value);

  static int? getDefInt(String key) => _prefs!.getInt(key);

  static Future<bool> adminLogin(String adminid) async {
    setDef(mpAdminID, adminid);
    return await _prefs!.setBool(mpIsLoggedIn, true);
  }

  static Future<bool> logout() async =>
      await _prefs!.setBool(mpIsLoggedIn, false);

  static Future<bool> userLogin(String adminid, String duration) async {
    setDef(mpUserID, adminid);
    setDef(mpUserLogInDuration, duration);
    return await _prefs!.setBool(mpIsLoggedIn, true);
  }
}

class MyNotif with ChangeNotifier {
  String? posTitle;

  void changePosTitle(String a) {
    posTitle = a;
    notifyListeners();
  }
}

class CandData {
  int totalVote, maxVote = 0;
  List<Candidate>? allCand;

  CandData({this.totalVote = 0, this.allCand}) {
    List<Color> aColors = [];
    aColors.addAll(Colors.accents);
    aColors.shuffle();
    for (int i = 0; i < allCand!.length; i++) {
      allCand![i].ccol = aColors[i];
      if (allCand![i].voteCount > maxVote) {
        maxVote = allCand![i].voteCount;
      }
    }
  }
}

class HistoryData {
  List<History>? allHistory;

  HistoryData({this.allHistory});
}

class UserImages {
  File? faceImage;
  File? cardImage;

  UserImages({this.faceImage, this.cardImage});
}

class Election {
  String? name, icon, id, url, password, etype, duration, startDate, endDate;
  int votersCnt, candCnt;

  String get retype {
    if (etype!.length > 57) {
      return etype!.substring(0, 57) + "...";
    }
    return etype!;
  }

  Election(
      {this.name = "University of Nigeria, Nsukka",
      this.etype = "Medicine & Surgery Departmental Election",
      this.id,
      this.icon,
      this.url,
      this.password,
      this.duration,
      this.startDate,
      this.endDate = "16th April 2022",
      this.votersCnt = 0,
      this.candCnt = 0});

  factory Election.fromJSON(Map<String, dynamic> json) {
    return Election(
        name: json["candName"],
        etype: json["candPosition"],
        id: json["candImgUrl"],
        password: json["password"],
        icon: json["icon"],
        url: json["voteCount"],
        votersCnt: json["candImgUrl"],
        candCnt: json["voteCount"],
        startDate: json["candImgUrl"],
        endDate: json["voteCount"],
        duration: json["candManifesto"]);
  }
}

class AdminNotificationModel {
  String? notifType, notifDesc, notifTime;

  AdminNotificationModel(this.notifType, this.notifDesc, this.notifTime);
}

class ElectionHistory {
  String? voter, cand, election, date, pos, id;

  ElectionHistory(
      {this.voter = "University of Nigeria, Nsukka",
      this.cand = "Medicine & Surgery Departmental Election",
      this.election,
      this.date,
      this.pos,
      this.id});

  factory ElectionHistory.fromJSON(Map<String, dynamic> json) {
    return ElectionHistory(
      voter: json["voter"],
      cand: json["cand"],
      id: json["id"],
      election: json["election"],
      pos: json["pos"],
    );
  }
}

class PollChooserItem {
  PollType pt;
  List<String> choices;
  Map<String, int> choiceMaps = {};
  Map<String, List<int>> handMaps = {}; //[2]
  Map<String, double> ratingMaps = {};
  Map<String, List<int>> scaleMaps = {}; //[10]
  Map<String, List<int>> prefMaps = {}; //[3]

  PollChooserItem(
    this.pt,
    this.choices,
  ) {
    for (final element in choices) {
      choiceMaps[element] = 0;
      handMaps[element] = [0, 0];
      ratingMaps[element] = 5;
      scaleMaps[element] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      prefMaps[element] = [0, 0, 0];
    }
  }

  Map<String, dynamic> getChooserItem() {
    switch (pt) {
      case PollType.choice:
        return choiceMaps;
      case PollType.hand:
        return handMaps;
      case PollType.star:
        return ratingMaps;
      case PollType.scale:
        return scaleMaps;
      case PollType.pref:
        return prefMaps;

      default:
        return choiceMaps;
    }
  }
}

class Poll {
  String title, desc;
  PollChooserItem pci;

  Poll(this.title, this.desc, this.pci);
}
