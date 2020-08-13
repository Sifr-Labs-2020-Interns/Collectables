import 'package:Collectables/utilities/index.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  bool newCardCheckedValue = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.chevron_left,
          ),
        ),
        title: Text('Payment Methods'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CreditCardWidget(
            cardNumber: '1010 1010 1010 8181',
            expiryDate: '03/01',
            cardHolderName: 'John Doe',
            cvvCode: '801',
            showBackView: false,
            cardBgColor: Theme.of(context).accentColor,
          ),
        ],
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
                            'Add new card',
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
                            child: getTextField(context, 'Card Holder Name',
                                cardNameController, TextInputType.text),
                          ),
                          sizedBox(20, 0),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: getTextField(context, 'Card Number',
                                cardNameController, TextInputType.number),
                          ),
                          sizedBox(20, 0),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: getTextField(context, 'Expire Date',
                                cardNameController, TextInputType.number),
                          ),
                          sizedBox(20, 0),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: getTextField(context, 'CVV',
                                cardNameController, TextInputType.number),
                          ),
                          sizedBox(20, 0),
                          CheckboxListTile(
                            title: Text("Use as default payment method"),
                            value: newCardCheckedValue,
                            onChanged: (newValue) {
                              setState(() {
                                newCardCheckedValue = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: getButton(context, 'ADD NEW CARD', () {}),
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
