import 'package:Collectables/utilities/index.dart';

class ItemPage extends StatefulWidget {
  @override
  ItemPageState createState() => ItemPageState();
}

class ItemPageState extends State<ItemPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            height: screenHeight(context) * 0.35,
            child: SliderBanner(
              slides: slideList,
              autoScroll: false,
            ),
          ),
          sizedBox(15, 0),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quantity',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        sizedBox(10, 0),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.minusCircle,
                              color: Theme.of(context).secondaryHeaderColor,
                              size: 24,
                            ),
                            sizedBox(0, 20),
                            Text(
                              '1',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            sizedBox(0, 20),
                            Icon(
                              FontAwesomeIcons.plusCircle,
                              color: Theme.of(context).secondaryHeaderColor,
                              size: 24,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Card(
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
                  ],
                ),
                sizedBox(10, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Item Name',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Seller Name',
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          'Verified Seller ✔️',
                          style: TextStyle(
                            fontSize: 11,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'AED 20',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                sizedBox(20, 0),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 48,
                        width: screenWidth(context) * 0.9,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).accentColor),
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        margin: EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Center(
                          child: Text('ADD TO CART'),
                        ),
                      ),
                    ],
                  ),
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getItemInfoCard(context, 'Weight', '0.05g'),
                      getItemInfoCard(context, 'Condition', 'UNC'),
                      getItemInfoCard(context, 'Grading', 'PCGS'),
                      getItemInfoCard(context, 'Metal', 'Copper'),
                    ],
                  ),
                ),
                Center(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getItemInfoCard(context, 'Country', 'India'),
                        getItemInfoCard(context, 'Year', '1975'),
                      ],
                    ),
                  ),
                ),
                sizedBox(10, 0),
                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                sizedBox(5, 0),
                Text(
                  'Irure esse anim quis ad ipsum laboris elit. Cupidatat laboris excepteur pariatur nostrud nulla qui tempor proident esse consectetur in qui aute. Dolore ipsum nisi anim anim sit labore ut. Non velit ullamco in do mollit esse ipsum sunt nulla consequat eu dolore consectetur. Consectetur reprehenderit laboris est tempor aliquip anim quis ipsum mollit. Quis ipsum tempor deserunt aute.',
                ),
                sizedBox(10, 0),
                Divider(),
                sizedBox(5, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping Info',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
                sizedBox(5, 0),
                Divider(),
                sizedBox(5, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Seller Reviews',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
                sizedBox(5, 0),
                Divider(),
                sizedBox(10, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Similar Items',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '12 Items',
                      style: TextStyle(
                        fontSize: 11,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                  ],
                ),
                sizedBox(10, 0),
                getItemCardList(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container getItemInfoCard(
      BuildContext context, String title, String subtitle) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 60,
      // width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(
          color: Theme.of(context).accentColor,
          width: 1,
        ),
      ),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
