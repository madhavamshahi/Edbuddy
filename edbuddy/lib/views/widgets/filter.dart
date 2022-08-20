import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  List<String> subjects = [
    "Computer Science",
    "Data Science",
    "Economics",
    "Biology",
    "Maths",
    "Chemistry",
    "Pshycology",
    "Music",
    "Macroeconomics",
    "History",
    "Political Science",
    "Business",
    "Geology",
    "Astronomy",
    "Finance",
    "Civics",
    "Geography",
    "Physics",
  ];

  Future<void> _openFilterDialog({required BuildContext context}) async {
    List<String> selectedList = [];
    await FilterListDialog.display<String>(
      context,
      hideSelectedTextCount: true,
      themeData: FilterListThemeData(context),
      headlineText: 'Select Users',
      height: 500,
      listData: subjects,
      selectedListData: selectedList,
      choiceChipLabel: (item) {
        String g = item as String;
        return g;
      },
      validateSelectedItem: (list, val) => list!.contains(val),
      controlButtons: [ControlButtonType.All, ControlButtonType.Reset],
      onItemSearch: (sub, query) {
        /// When search query change in search bar then this method will be called
        ///
        /// Check if items contains query
        String? f = sub as String;
        return f.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedList = List.from(list!);
        });
        print(selectedList);
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _openFilterDialog(context: context);
      },
      child: Text("Filter"),
    );
  }
}
