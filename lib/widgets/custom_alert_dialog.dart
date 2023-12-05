import 'package:flutter/material.dart';
import 'package:user_list_app/viewmodel/users_page_vm.dart';
import 'package:user_list_app/widgets/custom_user_profile_image.dart';

customAlert({
  required BuildContext context,
  required UsersPageViewModel userPageVm,
  required int currentIndex,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      content: SizedBox(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            CustomUserImage(
                userPageVm: userPageVm,
                currentIndex: currentIndex,
                circleAvatarRadius: 50.0),
            const SizedBox(
              height: 50.0,
            ),
            Text(userPageVm.displayedList?[currentIndex]?.name ?? ''),
            Text(
                '@ ${userPageVm.displayedList?[currentIndex]?.username ?? ''}'),
            Text(
                'Telefon ${userPageVm.displayedList?[currentIndex]?.phone ?? ''}'),
            Text(
                'Adres ${userPageVm.displayedList?[currentIndex]?.address?.street ?? ''}'),
            Text(
                'Şehir ${userPageVm.displayedList?[currentIndex]?.address?.city ?? ''}'),
            Text(
                'Konum ${userPageVm.displayedList?[currentIndex]?.address?.geo?.lat ?? ''}'),
          ],
        ),
      ),
    ),
  );
}
