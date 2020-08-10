import 'package:Collectables/screens/portrait/shop/filtersPage.dart';
import 'package:Collectables/screens/portrait/shop/itemPage.dart';
import 'package:Collectables/screens/portrait/shop/sortByPage.dart';
import 'package:Collectables/utilities/index.dart';
import 'package:Collectables/widgets/common/searchFilters.dart';

class FavoritesScreenPortrait extends StatefulWidget {
  @override
  _FavoritesScreenPortraitState createState() =>
      _FavoritesScreenPortraitState();
}

class _FavoritesScreenPortraitState extends State<FavoritesScreenPortrait> {
  bool grid = true;
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
        title: Text('Favorites'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
            screenHeight(context) * 0.06,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              children: [
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
                      icon: (grid == false)
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
                  return Stack(
                    children: [
                      getItemCard(
                        context,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemPage(),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        top: 20,
                        left: 120,
                        child: GestureDetector(
                          onTap: () {
                            // if (favorite[index] != null)
                            //   favorite[index] = !favorite[index];
                            // else
                            //   favorite[index] = true;
                            // setState();
                          },
                          child: Icon(
                            Icons.clear,
                            color: Theme.of(context).secondaryHeaderColor,
                            size: 22,
                          ),
                        ),
                      ),
                    ],
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
                          top: 15,
                          left: 295,
                          child: GestureDetector(
                            onTap: () {
                              // if (favorite[index] != null)
                              //   favorite[index] = !favorite[index];
                              // else
                              //   favorite[index] = true;
                              // setState();
                            },
                            child: Icon(
                              Icons.clear,
                              color: Theme.of(context).secondaryHeaderColor,
                              size: 22,
                            ),
                          ),
                        ),
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
}
