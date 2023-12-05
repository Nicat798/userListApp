import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_list_app/viewmodel/users_page_vm.dart';
import 'package:user_list_app/widgets/custom_searchbar.dart';
import 'package:user_list_app/widgets/user_listview.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsersPageViewModel(),
      child: Consumer<UsersPageViewModel>(
        builder: (context, userPageVm, child) => Scaffold(
          body: userPageVm.displayedList == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    CustomSearchBar(userpageVm: userPageVm),
                    UserListView(userPageViewModel: userPageVm),
                  ],
                ),
        ),
      ),
    );
  }
}
