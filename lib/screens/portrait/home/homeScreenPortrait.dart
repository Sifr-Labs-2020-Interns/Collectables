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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight(context) * 0.35,
            child: AdvertBanner(),
          ),
          sizedBox(10, 0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Text(
                  'Shop By Categories',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                sizedBox(10, 0),
                Container(
                  height: screenHeight(context) * 0.2,
                  child: Row(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
