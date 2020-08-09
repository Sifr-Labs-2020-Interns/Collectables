import 'package:Collectables/screens/portrait/shop/filtersPage.dart';
import 'package:Collectables/screens/portrait/shop/itemPage.dart';
import 'package:Collectables/utilities/index.dart';
import 'package:Collectables/screens/portrait/shop/sortByPage.dart';

class ItemsPagePortrait extends StatefulWidget {
  final bool autofocus;
  ItemsPagePortrait({@required this.autofocus});
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
                    autofocus: widget.autofocus,
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
                    getSearchFilters(
                      Icons.filter_list,
                      'Filters',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FiltersPage(),
                          ),
                        );
                      },
                    ),
                    getSearchFilters(
                        Icons.compare_arrows, sort[getCurrentIndex()], () {
                      settingModalBottomSheet(context, () => setState(() {}));
                    }),
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
        child: (grid == true)
            ? GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: screenWidth(context) *
                      0.5 /
                      (screenHeight(context) * 0.35),
                ),
                itemBuilder: (BuildContext context, int index) {
                  return getItemCard(
                    context,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemPage(),
                        ),
                      );
                    },
                  );
                })
            : ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 60,
                          left: 280,
                          child: GestureDetector(
                            onTap: () {
                              // if (favorite[index] != null)
                              //   favorite[index] = !favorite[index];
                              // else
                              //   favorite[index] = true;
                              // setState();
                            },
                            child: Card(
                              elevation: 2,
                              shape: CircleBorder(),
                              child: CircleAvatar(
                                backgroundColor: Theme.of(context).buttonColor,
                                child: Icon(
                                  // (favorite[index] == false)
                                  //     ? FontAwesomeIcons.heart
                                  //     : FontAwesomeIcons.solidHeart,
                                  FontAwesomeIcons.heart,
                                  // color: (favorite[index] == false)
                                  //     ? Theme.of(context).secondaryHeaderColor
                                  //     : Theme.of(context).accentColor,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                                child: Image.network(
                                  'https://upload.wikimedia.org/wikipedia/commons/7/70/Kawasaki_Candy_Lime_Green.png',
                                  height: screenHeight(context) * 0.15,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            sizedBox(0, 10),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      AutoSizeText(
                                        'Item',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 2,
                                      ),
                                      AutoSizeText(
                                        'Seller',
                                        style: TextStyle(
                                          fontSize: 11,
                                          // fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .secondaryHeaderColor,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                  sizedBox(20, 0),
                                  AutoSizeText(
                                    '₹500',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
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
          sizedBox(0, 5),
          Text(text),
        ],
      ),
    );
  }
}
