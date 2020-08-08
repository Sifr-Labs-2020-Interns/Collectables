import 'package:Collectables/screens/portrait/shop/itemsPage.dart';
import 'package:Collectables/utilities/index.dart';
import 'package:country_provider/country_provider.dart';

class ShopScreenPortrait extends StatefulWidget {
  @override
  _ShopScreenPortraitState createState() => _ShopScreenPortraitState();
}

class _ShopScreenPortraitState extends State<ShopScreenPortrait> {
  bool isLoading = false;
  List<Country> result = [];
  void getCountryByContinent(String search) async {
    isLoading = true;
    setState(() {});
    result = await CountryProvider.getcountryByRegionalBloc(search);
    isLoading = false;
    setState(() {});
  }

  Map<int, bool> expanded = {};

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Categories',
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ItemsPagePortrait(
                        autofocus: true,
                      );
                    },
                  ),
                );
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Coins'),
              Tab(text: 'Stamps'),
              Tab(text: 'Bank Notes'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            getCountryCardList(context),
            getCountryCardList(context),
            getCountryCardList(context),
          ],
        ),
      ),
    );
  }

  ListView getCountryCardList(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 20,
            left: 15,
            right: 15,
          ),
          height: screenHeight(context) * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).accentColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SALE',
                style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Hurry up before its over!',
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        sizedBox(10, 0),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: kContinents.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemsPagePortrait(autofocus: false),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
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
                    Expanded(
                      child: Center(
                        child: AutoSizeText(
                          kContinents[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                // child: Theme(
                //   data: Theme.of(context).copyWith(
                //     dividerColor: Colors.transparent,
                //     dividerTheme: DividerThemeData(
                //         color: Theme.of(context).colorScheme.background),
                //   ),
                //   child: ExpansionTile(
                //     onExpansionChanged: (boolean) {
                //       setState(() {});
                //       getCountryByContinent(continents[index]);
                //     },
                //     tilePadding: EdgeInsets.zero,
                // title: Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Image.network(
                //       'https://upload.wikimedia.org/wikipedia/commons/7/70/Kawasaki_Candy_Lime_Green.png',
                //       height: screenHeight(context) * 0.15,
                //       fit: BoxFit.cover,
                //     ),
                //     AutoSizeText(
                //       continents[index],
                //       style: TextStyle(
                //         fontSize: 18,
                //         fontWeight: FontWeight.w700,
                //       ),
                //       maxLines: 1,
                //     ),
                //   ],
                // ),
                //     trailing: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [],
                //     ),
                //     expandedCrossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 10,
                //         ),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             getButton(context, 'VIEW ALL ITEMS', () {}),
                //             sizedBox(10, 0),
                //             Text(
                //               'Choose Country',
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 color: Theme.of(context).secondaryHeaderColor,
                //               ),
                //             ),
                //             sizedBox(10, 0),
                //             Container(
                //               height: screenHeight(context) * 0.2,
                //               child: (isLoading == true)
                //                   ? Center(
                //                       child: CircularProgressIndicator(),
                //                     )
                //                   : ListView.builder(
                //                       shrinkWrap: true,
                //                       itemCount: result.length,
                //                       itemBuilder: (context, index) {
                //                         return Container(
                //                           padding: const EdgeInsets.symmetric(
                //                             vertical: 10.0,
                //                           ),
                //                           child: Column(
                //                             crossAxisAlignment:
                //                                 CrossAxisAlignment.start,
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment.spaceAround,
                //                             children: [
                //                               Text(
                //                                 result[index].name,
                //                                 style: TextStyle(
                //                                   fontSize: 14,
                //                                 ),
                //                               ),
                //                               Divider(
                //                                 color:
                //                                     Theme.of(context).buttonColor,
                //                               ),
                //                             ],
                //                           ),
                //                         );
                //                       }),
                //             )
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
            );
          },
        )
      ],
    );
  }
}
