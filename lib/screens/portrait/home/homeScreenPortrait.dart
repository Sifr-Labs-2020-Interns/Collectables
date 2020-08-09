import 'package:Collectables/utilities/index.dart';

class HomeScreenPortrait extends StatefulWidget {
  @override
  _HomeScreenPortraitState createState() => _HomeScreenPortraitState();
}

class _HomeScreenPortraitState extends State<HomeScreenPortrait> {
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
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight(context) * 0.35,
              child: SliderBanner(
                slides: slideList,
                autoScroll: true,
              ),
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
                      for (int i = 0; i < kCategories.length; i++)
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Theme.of(context).accentColor,
                            ),
                            sizedBox(10, 0),
                            Text(
                              kCategories[i],
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                    ],
                  ),
                  sizedBox(15, 0),
                  getHomeHeader(context, 'Sale', 'Items currently on sale'),
                  sizedBox(5, 0),
                  getItemCardList(context),
                  sizedBox(5, 0),
                  getHomeHeader(context, 'New', 'Latest entries to the store!'),
                  sizedBox(5, 0),
                  getItemCardList(context),
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
