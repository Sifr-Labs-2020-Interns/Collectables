import 'package:Collectables/utilities/index.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class FiltersPage extends StatefulWidget {
  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  double _lowerValue = 20.0;
  double _upperValue = 80.0;
  Map<String, bool> categories = {
    'Coins': false,
    'Stamps': false,
    'Bank Notes': false,
    'Antiques': false,
    'Art': false,
  };
  Map<String, bool> continents = {
    'Asia': false,
    'Europe': false,
    'Americas': false,
    'Africa': false,
    'Oceania': false,
  };
  Map<String, bool> condition = {
    'UNC': false,
    'Fine': false,
    'Good': false,
    'Fair': false,
  };

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.chevron_left),
        ),
        title: Text('Filters'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          children: [
            Text(
              'Price Range',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            sizedBox(20, 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'AED 0',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  'AED 100',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            FlutterSlider(
              values: [_lowerValue, _upperValue],
              rightHandler: getHandlerDecoration(context),
              handler: getHandlerDecoration(context),
              trackBar: FlutterSliderTrackBar(
                activeTrackBar: BoxDecoration(
                  color: Theme.of(context).accentColor,
                ),
              ),
              tooltip: FlutterSliderTooltip(
                format: (str) {
                  return 'AED $str';
                },
              ),
              rangeSlider: true,
              max: 100,
              min: 0,
              onDragging: (handlerIndex, lowerValue, upperValue) {
                _lowerValue = lowerValue;
                _upperValue = upperValue;
                setState(() {});
              },
            ),
            sizedBox(10, 0),
            Text(
              'Category',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            sizedBox(20, 0),
            getFilterList(context, kCategories, categories),
            sizedBox(10, 0),
            Text(
              'Region',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            sizedBox(20, 0),
            getFilterList(context, kContinents, continents),
            sizedBox(10, 0),
            Text(
              'Condition',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            sizedBox(20, 0),
            getFilterList(context, kCondition, condition),
          ],
        ),
      ),
      bottomSheet: Card(
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            bottom: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: 36,
                  width: 160,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).secondaryHeaderColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text('Discard'),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 36,
                  width: 160,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).accentColor),
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text('Apply'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container getFilterList(BuildContext context, List list, Map map) {
    return Container(
      height: screenHeight(context) * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => setState(
              () {
                map[list[index]] = !map[list[index]];
              },
            ),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 40,
              width: 101,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (map[list[index]] == false)
                    ? Theme.of(context).scaffoldBackgroundColor
                    : Theme.of(context).accentColor,
                border: Border.all(
                  color: (map[list[index]] == false)
                      ? Theme.of(context).secondaryHeaderColor
                      : Theme.of(context).accentColor,
                  width: 1,
                ),
              ),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    list[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: (map[list[index]] == false)
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  FlutterSliderHandler getHandlerDecoration(BuildContext context) {
    return FlutterSliderHandler(
      decoration: BoxDecoration(),
      child: Material(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(5),
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
