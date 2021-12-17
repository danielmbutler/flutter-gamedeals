import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var lastSearch = "";

class SearchBar extends StatefulWidget {
  final Function buttonHandler;
  SearchBar(this.buttonHandler);


  @override
  _SearchBarState createState() => _SearchBarState(buttonHandler);

}

class _SearchBarState extends State<SearchBar> {
  final Function searchFunction;

  bool _isSearching = false;

  _SearchBarState(this.searchFunction);



  void _toggleSearching() {
    setState(() {
      if (!_isSearching) {
        _isSearching = true;
      }
    });
  }


  void search (String searchString){
    widget.buttonHandler(searchString);
    lastSearch = searchString;
  }



  @override
  Widget build(BuildContext context) {

    debugPrint('search: ${lastSearch}');

  var searchString = "";
  TextEditingController controller = TextEditingController();
  controller.addListener(() {
    if(controller.text.length > 1){
      searchString = controller.text.toString();
    }
  });
  // set textfield text to last search and move cursor to end
  controller.text = lastSearch;
  controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));

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
                onPressed: () => {
                      search(searchString),
                } ,): null),
          ),
          style: const TextStyle(color: Colors.black, fontSize: 16.0),
        ));
  }


}
