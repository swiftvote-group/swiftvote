import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:swiftvote/models/shortmodels.dart';

class HttpService {
  static const baseURL = "swiftvote.io";
  static const urlCheckLink = "/upload-mutiple";
  static const urlAdminLogin = "/upload-mutiple";

  static const reqSuccess = "success";
  static const reqFailure = "failure";

  late bool isNotConnected;

  Future<void> _noConnection() async {
    final b = await Connectivity().checkConnectivity();
    final c =
        (b == ConnectivityResult.none || b == ConnectivityResult.bluetooth);
    if (c) {
      Get.snackbar(
          "No Internet Connection", "Please check your internet connection");
    }
    isNotConnected = c;
  }

  HttpService() {
    _noConnection();
  }

  //FLOW OF VOTER
  Future<Election?> checkVoterLink(
      String electionURL, String electionPassword) async {
    if (isNotConnected) return null;
    Uri uri = parseURI(urlCheckLink);
    final res = await http.post(uri, body: {
      "electionUrl": electionURL,
      "electionPassword": electionPassword
    });
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      return Election.fromJSON(json);
    }
    return null;
  }

  Future<String?> checkVoterBio(Map<String, String> data) async {
    if (isNotConnected) return null;
    Uri uri = parseURI(urlCheckLink);
    final res = await http.post(uri, body: data);
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      return json.id;
    }
    return null;
  }

  Future<bool> sendVoterCode(String email, String phone) async {
    if (isNotConnected) return false;
    Uri uri = parseURI(urlCheckLink);
    final res = await http.post(uri, body: {
      "email": email,
      "phone": phone,
    });
    if (res.statusCode == 200) {
      //final json = jsonDecode(res.body);
      return true;
    }
    return false;
  }

  Future<bool> confirmVoterCode(String id, String passcode) async {
    if (isNotConnected) return false;
    Uri uri = parseURI(urlCheckLink);
    final res = await http.post(uri, body: {
      "id": id,
      "code": passcode,
    });
    if (res.statusCode == 200) {
      //final json = jsonDecode(res.body);
      return true;
    }
    return false;
  }

  Future<bool> uploadPhoto(String id, String face, String idcard) async {
    if (isNotConnected) return false;
    Uri uri = parseURI('http://10.0.0.103:5000/profile/upload-mutiple');
    final request = http.MultipartRequest('POST', uri);
    request.fields['id'] = id;
    request.files.add(await http.MultipartFile.fromPath('face', face));
    request.files.add(await http.MultipartFile.fromPath('card', idcard));

    final res = await request.send();
    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> adminLogin(String adminID, String adminPassword) async {
    if (isNotConnected) return false;
    Uri uri = parseURI(urlAdminLogin);
    final res = await http
        .post(uri, body: {"id": adminID, "adminPassword": adminPassword});
    if (res.statusCode == 200) {
      return await MyPrefs.adminLogin(adminID);
    }
    return false;
  }

//This gets all Election, Candidate, User, ElectionHistory
  Future<List<T>?> httpGetAll<T>() async {
    if (isNotConnected) return null;
    Uri uri = parseURI(_getLink<T>());
    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final resJson = jsonDecode(res.body);
      return _listOf<T>(resJson);
    }
    return null;
  }

//This gets a single Election, Candidate, User, ElectionHistory
  Future<T?> httpGet<T>(String id) async {
    if (isNotConnected) return null;
    Uri uri = parseURI(_getLink<T>(), {"id": id});
    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final resJson = jsonDecode(res.body);
      return _get<T>(resJson);
    }
    return null;
  }

  T _get<T>(dynamic m) {
    switch (T) {
      case Candidate:
        return Candidate.fromJSON(m) as T;
      case Election:
        return Election.fromJSON(m) as T;
      case ElectionHistory:
        return ElectionHistory.fromJSON(m) as T;
      default:
        return User.fromJSON(m) as T;
    }
  }

  String _getLink<T>() {
    switch (T) {
      case User:
        return urlCheckLink;
      case Candidate:
        return urlCheckLink;
      case Election:
        return urlCheckLink;
      case ElectionHistory:
        return urlCheckLink;
      default:
        return urlCheckLink;
    }
  }

  Future<String?> adminFPSendMail(String email) async {
    if (isNotConnected) return null;
    Uri uri = parseURI(urlCheckLink);
    final res = await http.post(uri, body: {
      "email": email,
    });
    if (res.statusCode == 200) {
      final resJson = jsonDecode(res.body);
      return resJson["id"];
    }
    return null;
  }

  Future<bool> adminFPVerify(String id, String passcode) async {
    if (isNotConnected) return false;
    Uri uri = parseURI(urlCheckLink, {"id": id, "passcode": passcode});
    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final resJson = jsonDecode(res.body);
      return resJson["status"] == reqSuccess;
    }
    return false;
  }

  Future<bool> adminFPUpdate(String password, String adminId) async {
    if (isNotConnected) return false;
    Uri uri = parseURI(urlCheckLink, {"id": adminId});
    final res = await http.patch(uri, body: {
      "password": password,
    });
    if (res.statusCode == 200) {
      final resJson = jsonDecode(res.body);
      return resJson["status"] == reqSuccess;
    }
    return false;
  }

  List<T> _listOf<T>(dynamic m) {
    return (m as List<T>).map((e) => _get<T>(m)).toList();
  }

  Uri parseURI(String url, [Map<String, String>? rawData]) =>
      parseURI(url, rawData);
}
