import 'package:flutter/material.dart';
import 'package:user_list_app/constants/strings.dart';
import 'package:user_list_app/viewmodel/users_page_vm.dart';
import 'package:user_list_app/widgets/custom_user_profile_image.dart';
import 'package:user_list_app/widgets/custom_alert_dialog.dart';

class UserListView extends StatelessWidget {
  const UserListView({
    super.key,
    required this.userPageViewModel,
  });

  final UsersPageViewModel userPageViewModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: userPageViewModel.displayedList!.isEmpty
          ? const Center(
              child: Text('Bulunamadı'),
            )
          : ListView.builder(
              itemCount: userPageViewModel.displayedList?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      customAlert(
                        context: context,
                        userPageVm: userPageViewModel,
                        currentIndex: index,
                      );
                    },
                    title: Text(userPageViewModel.displayedList?[index]?.name ??
                        ProjectStrings.emptyText),
                    leading: CustomUserImage(
                        userPageVm: userPageViewModel, currentIndex: index),
                  ),
                );
              },
            ),
    );
  }
}
