import 'package:flutter/material.dart';
import 'package:user_list_app/models/user_photo_model.dart';
import 'package:user_list_app/viewmodel/users_page_vm.dart';

class CustomUserImage extends StatelessWidget {
  const CustomUserImage(
      {super.key,
      required this.userPageVm,
      required this.currentIndex,
      this.circleAvatarRadius = 20});

  final UsersPageViewModel userPageVm;
  final int currentIndex;
  final double circleAvatarRadius;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserProfilePictureModel?>(
      future: userPageVm.getUserProfilePicture(currentIndex),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return CircleAvatar(
            radius: circleAvatarRadius,
            backgroundImage: NetworkImage(
              snapshot.data!.downloadUrl!,
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
