import 'package:Collectables/utilities/index.dart';

class NavigationBarPortrait extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarPortrait> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final currentIndex = Provider.of<CurrentIndexProvider>(context);

    final List<Widget> _children = [
      HomeScreenPortrait(),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: _children[currentIndex.getIndex()],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex.getIndex(),
          onTap: (index) {
            setState(() {
              currentIndex.setIndex(index);
            });
          },
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Theme.of(context).secondaryHeaderColor,
          backgroundColor: Theme.of(context).cardColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
                semanticLabel: 'Home Page',
              ),
              title: Text(
                'Home',
                style: kNavigationBarTextStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.shoppingCart,
                semanticLabel: 'Shopping Page',
              ),
              title: Text(
                'Shop',
                style: kNavigationBarTextStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.shoppingBag,
                semanticLabel: 'Bag',
              ),
              title: Text(
                'Bag',
                style: kNavigationBarTextStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.solidHeart,
                semanticLabel: 'Favorites',
              ),
              title: Text(
                'Favorites',
                style: kNavigationBarTextStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.solidUser,
                semanticLabel: 'Profile',
              ),
              title: Text(
                'Profile',
                style: kNavigationBarTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
