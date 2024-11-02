import 'package:flutter/material.dart';

class SearchBarDelegeteWidget extends SearchDelegate {

  SearchBarDelegeteWidget({required this.azkarList, required this.onTap});

 final List<String> azkarList;
 final void Function()? onTap;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var zekr in azkarList) {
      if(zekr.contains(query)){
        matchQuery.add(zekr);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context,index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: onTap,
        );
      }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var zekr in azkarList) {
      if(zekr.contains(query)){
        matchQuery.add(zekr);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context,index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: onTap,
        );
      }
    );
  }
}