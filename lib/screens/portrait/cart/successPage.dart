import 'package:Collectables/utilities/index.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Theme.of(context).accentColor,
              size: 50,
            ),
            sizedBox(10, 0),
            Text(
              'Success!',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            sizedBox(10, 0),
            FittedBox(
              child: Text(
                'Your order will be delivered at your doorstep soon!\nThank you for shopping with Collectibles!',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
