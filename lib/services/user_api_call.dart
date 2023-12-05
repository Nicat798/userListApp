import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:user_list_app/constants/strings.dart';
import 'package:user_list_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserApiCall {
  Future<List<UserModel>?> getUsersFromApi() async {
    final url = Uri.parse(ProjectStrings.userApiUrl);

    try {
      final response = await http.get(url);

      if (response.statusCode == HttpStatus.ok) {
        final userData = jsonDecode(response.body);

        if (userData is List) {
          return userData.map((e) => UserModel.fromJson(e)).toList();
        }
      }
      return null;
    } catch (_) {
      Fluttertoast.showToast(
        msg: ProjectStrings.errorText,
      );
    }
    return null;
  }
}
