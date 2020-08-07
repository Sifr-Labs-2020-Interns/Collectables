import 'package:Collectables/utilities/index.dart';

class ItemsPagePortrait extends StatefulWidget {
  @override
  _ItemsPagePortraitState createState() => _ItemsPagePortraitState();
}

class _ItemsPagePortraitState extends State<ItemsPagePortrait> {
  String searchText = '';
  bool onSaved = false;
  bool grid = true;
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
        elevation: 1,
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
                    top: 5.0,
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
                    icon: Icon(
                      Icons.search,
                    ),
                  ),
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
          preferredSize: Size.fromHeight(
            screenHeight(context) * 0.13,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: TextField(
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getSearchFilters(Icons.filter_list, 'Filters', () {}),
                    getSearchFilters(
                        Icons.compare_arrows, 'Price: Low to High', () {}),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          grid = !grid;
                        });
                      },
                      icon: (grid == true)
                          ? Icon(Icons.grid_on)
                          : Icon(Icons.list),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:
                  screenWidth(context) * 0.5 / (screenHeight(context) * 0.35),
            ),
            itemBuilder: (BuildContext context, int index) {
              return getItemCard(context, setState);
            }),
      ),
    );
  }

  InkWell getSearchFilters(IconData icon, String text, Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
          ),
          sizedBox(0, 2),
          Text(text),
        ],
      ),
    );
  }
}
