import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  static const baseURL = "https://www.swiftvote.io";
  static const urlCheckLink = "/upload-mutiple";
  static const urlAdminLogin = "/upload-mutiple";

  static const reqSuccess = "success";
  static const reqFailure = "failure";

  Future<String> uploadPhoto(String path) async {
    Uri uri = Uri.parse('http://10.0.0.103:5000/profile/upload-mutiple');
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('files', path));

    http.StreamedResponse response = await request.send();
    final responseBytes = await response.stream.toBytes();
    final responseString = utf8.decode(responseBytes);
    //jsonDecode(responseString)
    // print('\n\n');
    // print('RESPONSE WITH HTTP');
    // print(responseString);
    // print('\n\n');
    return responseString;
  }

  Future<bool> checkVoterLink(
      String electionURL, String electionPassword) async {
    Uri uri = Uri.parse(urlCheckLink);
    final res = await http.post(uri, body: {
      "electionUrl": electionURL,
      "electionPassword": electionPassword
    });
    final resJson = jsonDecode(res.body);
    return resJson["status"] == reqSuccess;
  }

  Future<bool> adminLogin(String adminID, String adminPassword) async {
    Uri uri = Uri.parse(urlAdminLogin);
    final res = await http
        .post(uri, body: {"id": adminID, "adminPassword": adminPassword});
    final resJson = jsonDecode(res.body);
    return resJson["status"] == reqSuccess;
  }

  Future<bool> adminGetElection(String adminId) async {
    Uri uri = Uri.https(baseURL, urlCheckLink, {"id": adminId});
    final res = await http.get(uri);
    //at backend, get recent election id
    //then get Election
    final resJson = jsonDecode(res.body);
    return resJson["status"] == reqSuccess;
  }

  Future<String?> adminFPSendMail(String email) async {
    Uri uri = Uri.parse(urlCheckLink);
    final res = await http.post(uri, body: {
      "email": email,
    });
    final resJson = jsonDecode(res.body);
    return resJson["id"];
  }

  Future<bool> adminFPVerify(String id, String passcode) async {
    Uri uri =
        Uri.https(baseURL, urlCheckLink, {"id": id, "passcode": passcode});
    final res = await http.get(uri);
    final resJson = jsonDecode(res.body);
    return resJson["status"] == reqSuccess;
  }

  Future<bool> adminFPUpdate(String password, String adminId) async {
    Uri uri = Uri.https(baseURL, urlCheckLink, {"id": adminId});
    final res = await http.patch(uri, body: {
      "password": password,
    });
    final resJson = jsonDecode(res.body);
    return resJson["status"] == reqSuccess;
  }
}
