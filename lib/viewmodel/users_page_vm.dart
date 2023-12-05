import 'package:flutter/material.dart';
import 'package:user_list_app/models/user_model.dart';
import 'package:user_list_app/models/user_photo_model.dart';
import 'package:user_list_app/services/user_api_call.dart';
import 'package:user_list_app/services/user_photo_call.dart';

class UsersPageViewModel extends ChangeNotifier {
  UsersPageViewModel() {
    getUserInfoFromApi();
  }
  UserProfilePhotoCall userProfilePhotoCall = UserProfilePhotoCall();
  UserApiCall userapicall = UserApiCall();
  List<UserModel?> mainUserList = [];
  List<UserModel?>? displayedList;
  UserProfilePictureModel? userProfilePictureModel;
  final TextEditingController searchTextController = TextEditingController();

  Future<void> getUserInfoFromApi() async {
    mainUserList = await userapicall.getUsersFromApi() ?? [];
    displayedList = mainUserList;
    notifyListeners();
  }

  Future<UserProfilePictureModel?> getUserProfilePicture(int index) async {
    userProfilePictureModel = await userProfilePhotoCall
        .getProfilePicture(mainUserList[index]?.id ?? 0);

    return userProfilePictureModel;
  }

  void searcInList(String userInput) {
    displayedList = mainUserList
        .where((element) =>
            element!.name!.toLowerCase().contains(userInput.toLowerCase()))
        .toList();

    notifyListeners();
  }

  void clearSearchText() {
    searchTextController.clear();
    displayedList = mainUserList;

    notifyListeners();
  }
}
