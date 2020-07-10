import 'package:Collectables/utilities/index.dart';

class ExpandableListTile extends StatelessWidget {
  const ExpandableListTile(
      {Key key, this.title, this.expanded, this.onExpandPressed, this.child})
      : super(key: key);

  final Widget title;
  final bool expanded;
  final Widget child;
  final Function onExpandPressed;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListTile(
        title: title,
        onTap: onExpandPressed,
        trailing: IconButton(
          onPressed: onExpandPressed,
          // icon: Icon(Icons.expand_more),
          icon: RotatableSection(
              rotated: expanded,
              child: SizedBox(
                height: 30,
                width: 30,
                child: Icon(Icons.expand_more),
              )),
        ),
      ),
      ExpandableSection(
        child: child,
        expand: expanded,
      )
    ]);
  }
}
