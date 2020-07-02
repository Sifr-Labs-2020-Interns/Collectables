import 'package:Collectables/utilities/index.dart';
import 'package:search_page/search_page.dart';

class ShopScreenPortrait extends StatefulWidget {
  @override
  _ShopScreenPortraitState createState() => _ShopScreenPortraitState();
}

class _ShopScreenPortraitState extends State<ShopScreenPortrait> {
  List countries = [
    'Asia & Oceania',
    'Europe',
    'Americas',
    'Africa',
  ];

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
                        ? lightTheme
                        : darkTheme,
                    items: ['1', '2', '3'],
                    searchLabel: 'Search Items',
                    suggestion: Center(
                      child: Text('Filter Items'),
                    ),
                    failure: Center(
                      child: Text('No Item Found'),
                    ),
                    filter: (person) => [],
                    builder: (person) => ListTile(
                      title: Text('Test'),
                      subtitle: Text('Test'),
                      trailing: Text('Test'),
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
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Hurry up before its over!',
                style: TextStyle(
                  fontSize: 15,
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
              height: screenHeight(context) * 0.18,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Card(
                color: Theme.of(context).cardColor,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: AutoSizeText(
                          countries[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Image(
                        image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/7/70/Kawasaki_Candy_Lime_Green.png',
                        ),
                        fit: BoxFit.cover,
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

// class CustomSearchDelegate extends SearchDelegate {
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     if (query.length < 3) {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Center(
//             child: Text(
//               "Search term must be longer than two letters.",
//             ),
//           )
//         ],
//       );
//     }

//     return Column(
//       children: <Widget>[
//         StreamBuilder(
//           stream: null,
//           builder: (context, AsyncSnapshot<List> snapshot) {
//             if (!snapshot.hasData) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Center(child: CircularProgressIndicator()),
//                 ],
//               );
//             } else if (snapshot.data.length == 0) {
//               return Column(
//                 children: <Widget>[
//                   Text(
//                     "No Results Found.",
//                   ),
//                 ],
//               );
//             } else {
//               var results = snapshot.data;
//               return ListView.builder(
//                 itemCount: results.length,
//                 itemBuilder: (context, index) {
//                   var result = results[index];
//                   return ListTile(
//                     title: Text(result.title),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ],
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Column();
//   }
// }
