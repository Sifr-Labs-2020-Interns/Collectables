import 'package:Collectables/screens/portrait/cart/cardPage.dart';
import 'package:Collectables/utilities/index.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.chevron_left,
          ),
        ),
        title: Text('Checkout'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            sizedBox(5, 0),
            Text(
              'Shipping Address',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            sizedBox(10, 0),
            Card(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Doe',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        sizedBox(5, 0),
                        Container(
                          width: screenWidth(context) * 0.6,
                          child: AutoSizeText(
                            '3 Newbridge Court Chino Hills, CA 91709, United States',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Change',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ),
            sizedBox(10, 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CardPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Change',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            sizedBox(10, 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    'assets/images/visa.png',
                    height: 40,
                    width: 30,
                  ),
                ),
                sizedBox(0, 10),
                Expanded(
                  flex: 3,
                  child: Text('**** **** **** 8181'),
                )
              ],
            )
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
                Text('Order:'),
                Text(
                  'AED 12',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            sizedBox(10, 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delivery:'),
                Text(
                  'AED 12',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            sizedBox(10, 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Amount:'),
                Text(
                  'AED 24',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            sizedBox(20, 0),
            getButton(
              context,
              'SUBMIT ORDER',
              () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => CheckoutPage(),
                //   ),
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardPage(),
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
