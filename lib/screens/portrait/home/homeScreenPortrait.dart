import 'package:Collectables/utilities/index.dart';

class HomeScreenPortrait extends StatefulWidget {
  @override
  _HomeScreenPortraitState createState() => _HomeScreenPortraitState();
}

class _HomeScreenPortraitState extends State<HomeScreenPortrait> {
  List<String> categories = [
    'Coins',
    'Stamps',
    'Bank Notes',
    'Antiques',
    'Art'
  ];
  Map favorite = {};

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: 60,
        width: 60,
        child: Card(
          shape: CircleBorder(),
          elevation: 3,
          color: Theme.of(context).accentColor,
          child: Icon(
            Icons.message,
            color: Theme.of(context).buttonColor,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight(context) * 0.35,
              child: AdvertBanner(),
            ),
            sizedBox(15, 0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shop By Categories',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  sizedBox(15, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (int i = 0; i < categories.length; i++)
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Theme.of(context).accentColor,
                            ),
                            sizedBox(10, 0),
                            Text(
                              categories[i],
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                    ],
                  ),
                  sizedBox(15, 0),
                  getHomeHeader(context, 'Sale', 'Items currently on sale'),
                  sizedBox(5, 0),
                  getCardList(context, favorite, () {
                    setState(() {});
                  }),
                  sizedBox(5, 0),
                  getHomeHeader(context, 'New', 'Latest entries to the store!'),
                  sizedBox(5, 0),
                  getCardList(context,favorite, () {
                    setState(() {});
                  }),
                  sizedBox(5, 0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container getCardList(BuildContext context, Map favorite, Function setState) {
  return Container(
    height: screenHeight(context) * 0.3,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {},
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(5.0),
                width: 150.0,
                child: Card(
                  color: Theme.of(context).cardColor,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  elevation: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/7/70/Kawasaki_Candy_Lime_Green.png',
                        ),
                        fit: BoxFit.cover,
                        width: 150,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Seller',
                              style: TextStyle(
                                fontSize: 11,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              maxLines: 1,
                            ),
                            Text(
                              'Item',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              maxLines: 1,
                            ),
                            Text(
                              '5 AED',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 130,
                left: 100,
                child: GestureDetector(
                  onTap: () {
                    if (favorite[index] != null)
                      favorite[index] = !favorite[index];
                    else
                      favorite[index] = true;
                    setState();
                  },
                  child: Card(
                    elevation: 2,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).buttonColor,
                      child: Icon(
                        (favorite[index] == false)
                            ? FontAwesomeIcons.heart
                            : FontAwesomeIcons.solidHeart,
                        color: (favorite[index] == false)
                            ? Theme.of(context).secondaryHeaderColor
                            : Theme.of(context).accentColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Column getHomeHeader(BuildContext context, String title, String subtitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w800,
        ),
      ),
      Text(
        subtitle,
        style: TextStyle(
          fontSize: 11,
          color: Theme.of(context).secondaryHeaderColor,
        ),
      ),
    ],
  );
}
