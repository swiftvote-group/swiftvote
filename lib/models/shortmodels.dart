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

  static Future init() async => _prefs = await SharedPreferences.getInstance();

  static Future setDef(String key, String value) async {
    await _prefs!.setString(key, value);
  }

  static String? getDef(String key) => _prefs!.getString(key);

  static Future setDefInt(String key, int value) async =>
      await _prefs!.setInt(key, value);

  static int? getDefInt(String key) => _prefs!.getInt(key);
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
