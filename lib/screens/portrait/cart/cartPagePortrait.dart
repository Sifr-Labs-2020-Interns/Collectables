import 'package:Collectables/screens/portrait/cart/checkoutPage.dart';
import 'package:Collectables/utilities/index.dart';

class CartScreenPortrait extends StatefulWidget {
  @override
  _CartScreenPortraitState createState() => _CartScreenPortraitState();
}

class _CartScreenPortraitState extends State<CartScreenPortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: ListView(
          children: [
            getRegistrationHeader(3, false, 'My Cart', null),
            sizedBox(40, 0),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              },
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Amount:'),
                Text(
                  'AED 12',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            sizedBox(20, 0),
            getButton(
              context,
              'CHECKOUT',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
