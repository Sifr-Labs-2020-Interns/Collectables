import 'package:Collectables/utilities/index.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class ShippingAddressPage extends StatefulWidget {
  @override
  _ShippingAddressPageState createState() => _ShippingAddressPageState();
}

class _ShippingAddressPageState extends State<ShippingAddressPage> {
  int radioValue = 0;
  TextEditingController fullName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zip = TextEditingController();
  TextEditingController country = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.chevron_left,
          ),
        ),
        title: Text('Shipping Address'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                            ),
                            sizedBox(5, 0),
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
                    Container(
                      child: FittedBox(
                        child: CheckboxGroup(
                          labels: <String>[
                            "Use as the shipping address",
                          ],
                          onSelected: (List<String> checked) => print(
                            checked.toString(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext bc) {
              return Container(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Wrap(
                    children: <Widget>[
                      Center(
                        child: Container(
                          height: 10,
                          width: 50,
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 20,
                            bottom: 10,
                          ),
                          child: Text(
                            'Add new address',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          sizedBox(20, 0),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: getTextField(context, 'Full Name', fullName,
                                TextInputType.text),
                          ),
                          sizedBox(20, 0),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: getTextField(context, 'Address', address,
                                TextInputType.text),
                          ),
                          sizedBox(20, 0),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: getTextField(
                                context, 'City', city, TextInputType.text),
                          ),
                          sizedBox(20, 0),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: getTextField(
                                context, 'State', state, TextInputType.text),
                          ),
                          sizedBox(20, 0),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: getTextField(context, 'ZIP Code', state,
                                TextInputType.number),
                          ),
                          sizedBox(20, 0),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: getTextField(
                                context, 'Country', state, TextInputType.text),
                          ),
                          sizedBox(20, 0),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: getButton(context, 'ADD NEW ADDRESS', () {}),
                          ),
                          sizedBox(20, 0),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
