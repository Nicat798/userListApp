import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:user_list_app/models/user_photo_model.dart';

class UserProfilePhotoCall {
  Future<UserProfilePictureModel?> getProfilePicture(int userId) async {
    var url = Uri.parse('https://picsum.photos/id/$userId/info');

    try {
      var response = await http.get(url);

      if (response.statusCode == HttpStatus.ok) {
        var pictureData = jsonDecode(response.body);

        return UserProfilePictureModel.fromJson(pictureData);
      } else {
        return null;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Problem');
    }
    return null;
  }
}
