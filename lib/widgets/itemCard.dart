import 'package:Collectables/utilities/index.dart';

Container getItemCardList(
    BuildContext context, Map favorite, Function setState) {
  return Container(
    height: screenHeight(context) * 0.3,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return getItemCard(context, favorite, index, setState);
      },
    ),
  );
}

InkWell getItemCard(
    BuildContext context, Map favorite, int index, Function setState) {
  return InkWell(
    onTap: () {},
    child: Stack(
      children: [
        Container(
          margin: EdgeInsets.all(5.0),
          width: 150.0,
          child: Card(
            color: Theme.of(context).cardColor,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/7/70/Kawasaki_Candy_Lime_Green.png',
                  ),
                  fit: BoxFit.cover,
                  width: 150,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Seller',
                        style: TextStyle(
                          fontSize: 11,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        maxLines: 1,
                      ),
                      Text(
                        'Item',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        maxLines: 1,
                      ),
                      Text(
                        '5 AED',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 130,
          left: 100,
          child: GestureDetector(
            onTap: () {
              if (favorite[index] != null)
                favorite[index] = !favorite[index];
              else
                favorite[index] = true;
              setState();
            },
            child: Card(
              elevation: 2,
              shape: CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).buttonColor,
                child: Icon(
                  (favorite[index] == false)
                      ? FontAwesomeIcons.heart
                      : FontAwesomeIcons.solidHeart,
                  color: (favorite[index] == false)
                      ? Theme.of(context).secondaryHeaderColor
                      : Theme.of(context).accentColor,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
