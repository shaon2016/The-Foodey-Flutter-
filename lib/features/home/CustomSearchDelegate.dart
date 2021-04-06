import 'package:flutter/material.dart';
import 'package:foodey/model/food.dart';

class CustomSearchDelegate<T> extends SearchDelegate<Food> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    // return Container(
    //   child: Center(
    //     child: Text(selectedResult),
    //   ),
    // );

    return Column();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestionList = foods
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index].title,
          ),
          onTap: () {
            selectedResult = suggestionList[index].title;
            // showResults(context);

            close(context, suggestionList[index]);
          },
        );
      },
    );
  }
}
