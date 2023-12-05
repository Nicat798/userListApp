import 'package:flutter/material.dart';
import 'package:user_list_app/constants/strings.dart';
import 'package:user_list_app/viewmodel/users_page_vm.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.userpageVm});
  final UsersPageViewModel userpageVm;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: TextField(
        onChanged: (currentUserInput) =>
            userpageVm.searcInList(currentUserInput),
        controller: userpageVm.searchTextController,
        decoration: InputDecoration(
          hintText: ProjectStrings.searchText,
          suffixIcon: IconButton(
            onPressed: () {
              userpageVm.searchTextController.text.isNotEmpty
                  ? userpageVm.clearSearchText()
                  : null;
            },
            icon: Icon(userpageVm.searchTextController.text.isEmpty
                ? Icons.search
                : Icons.clear),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(20.0),
        ),
      ),
    );
  }
}
