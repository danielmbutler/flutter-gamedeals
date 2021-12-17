

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function buttonHandler;
  SearchBar(this.buttonHandler);


  @override
  _SearchBarState createState() => _SearchBarState(buttonHandler);

}

class _SearchBarState extends State<SearchBar> {
  final Function aFunction;
  bool _isSearching = false;

  _SearchBarState(this.aFunction);



  void _toggleSearching() {
    setState(() {
      if (!_isSearching) {
        _isSearching = true;
      }
    });
  }


  @override
  Widget build(BuildContext context) {

  var searchString = "";
  TextEditingController controller = TextEditingController();
  controller.addListener(() {
    if(controller.text.length > 1){
      searchString = controller.text.toString();
    }
  });


    return Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          autofocus: false,
          maxLines: 1,
          controller: controller,
          onTap: _toggleSearching,
          decoration: InputDecoration(
              hintText: "Search Games...",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Colors.lightBlue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Colors.lightBlue),
              ),
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon: (_isSearching
                  ? IconButton(
                    icon: Icon(Icons.search_sharp),
                onPressed: () => widget.buttonHandler(searchString) ,): null),
          ),
          style: const TextStyle(color: Colors.black, fontSize: 16.0),
        ));
  }
}
