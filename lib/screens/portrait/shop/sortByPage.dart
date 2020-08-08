import 'package:Collectables/utilities/index.dart';

List<String> sort = [
  'Popular',
  'Newest',
  'Customer Review',
  'Price: Low to High',
  'Price: High to Low'
];

int currentSortIndex = 3;

void setCurrentIndex(Function setState, int index) {
  setState();
  currentSortIndex = index;
}

int getCurrentIndex() => currentSortIndex;

void settingModalBottomSheet(context, Function setState) {
  showModalBottomSheet(
    context: context,
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
                    'Sort By',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              for (int i = 0; i < 5; i++)
                Container(
                  color: (getCurrentIndex() == i)
                      ? Theme.of(context).accentColor
                      : null,
                  child: ListTile(
                    title: Text(
                      sort[i],
                      style: TextStyle(
                        color: (getCurrentIndex() == i)
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                    onTap: () {
                      setCurrentIndex(setState, i);
                      Navigator.pop(context);
                    },
                  ),
                ),
            ],
          ),
        ),
      );
    },
  );
}
