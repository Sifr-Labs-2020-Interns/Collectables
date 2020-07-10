import 'package:Collectables/utilities/index.dart';
import 'package:country_provider/country_provider.dart';
import 'package:search_page/search_page.dart';

class ShopScreenPortrait extends StatefulWidget {
  @override
  _ShopScreenPortraitState createState() => _ShopScreenPortraitState();
}

class _ShopScreenPortraitState extends State<ShopScreenPortrait> {
  List countries = [
    'Asia',
    'Europe',
    'Americas',
    'Africa',
    'Oceania',
  ];
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
                showSearch(
                  context: context,
                  delegate: SearchPage(
                    barTheme: (Provider.of<ThemeModel>(context, listen: false)
                                .currentTheme ==
                            darkTheme)
                        ? ThemeData(
                            primaryColor: Colors.black,
                            textTheme: TextTheme(
                              headline6: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            fontFamily: 'Montserrat',
                          )
                        : ThemeData(
                            primaryColor: Colors.white,
                            textTheme: TextTheme(
                              headline6: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            fontFamily: 'Montserrat',
                          ),
                    items: ['Campaign Name', 'Campaign Name', 'Campaign Name'],
                    searchLabel: 'Search Campaigns',
                    suggestion: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getHomeHeader(context, 'Recent Searches',
                              'Campaigns that you have searched previously'),
                          sizedBox(10, 0),
                          getItemCardList(context, () {
                            setState(() {});
                          }),
                        ],
                      ),
                    ),
                    // failure: Center(
                    //   child: Text('No Campaign Found :('),
                    // ),
                    failure: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: GridView.builder(
                          itemCount: 5,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: screenWidth(context) *
                                0.5 /
                                (screenHeight(context) * 0.35),
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return getItemCard(
                              context,
                              () {
                                setState(() {});
                              },
                            );
                          }),
                    ),
                    filter: (filter) => [],
                    builder: (filter) => getItemCardList(
                      context,
                      () {
                        setState(() {});
                      },
                    ),
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
                  color: Theme.of(context).buttonColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Hurry up before its over!',
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).buttonColor,
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
          itemCount: countries.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                  dividerTheme: DividerThemeData(
                      color: Theme.of(context).colorScheme.background),
                ),
                child: ExpansionTile(
                  onExpansionChanged: (boolean) {
                    setState(() {});
                    getCountryByContinent(countries[index]);
                  },
                  tilePadding: EdgeInsets.zero,
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/7/70/Kawasaki_Candy_Lime_Green.png',
                        height: screenHeight(context) * 0.15,
                        fit: BoxFit.cover,
                      ),
                      AutoSizeText(
                        countries[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getButton(context, 'VIEW ALL ITEMS', () {}),
                          sizedBox(10, 0),
                          Text(
                            'Choose Country',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                          sizedBox(10, 0),
                          Container(
                            height: screenHeight(context) * 0.2,
                            child: (isLoading == true)
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: result.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10.0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              result[index].name,
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                            Divider(
                                              color:
                                                  Theme.of(context).buttonColor,
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
