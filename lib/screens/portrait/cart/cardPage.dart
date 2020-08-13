import 'package:Collectables/utilities/index.dart';

class CardPage extends StatelessWidget {
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
        title: Text('Payment Methods'),
        centerTitle: true,
      ),
    );
  }
}
