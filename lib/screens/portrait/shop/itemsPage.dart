import 'package:Collectables/utilities/index.dart';

class ItemsPagePortrait extends StatefulWidget {
  @override
  _ItemsPagePortraitState createState() => _ItemsPagePortraitState();
}

class _ItemsPagePortraitState extends State<ItemsPagePortrait> {
  String searchText = '';
  bool onSaved = false;
  TextEditingController searchController = TextEditingController();
  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 14.0),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.chevron_left,
              size: 30,
            ),
          ),
        ),
        actions: [
          (searchText == '' || onSaved == true)
              ? Padding(
                  padding: EdgeInsets.only(
                    right: 14.0,
                  ),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          onSaved = false;
                          searchController.clear();
                          searchText = '';
                          myFocusNode.requestFocus();
                        });
                      },
                      icon: Icon(Icons.search)),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    right: 14.0,
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        searchController.clear();
                        searchText = '';
                      });
                    },
                    icon: Icon(
                      Icons.clear,
                    ),
                  ),
                ),
        ],
        bottom: PreferredSize(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              children: [
                TextField(
                  focusNode: myFocusNode,
                  controller: searchController,
                  autofocus: true,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  onSubmitted: (value) {
                    setState(() {
                      onSaved = true;
                    });
                  },
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(
            screenHeight(context) * 0.08,
          ),
        ),
      ),
    );
  }
}
