import 'package:Collectables/screens/portrait/registration/loginPagePortrait.dart';
import 'package:Collectables/utilities/index.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) => model.initialise(),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => LoginPagePortrait(),
          landscape: (context) => LoginPageLandscape(),
        ),
        tablet: OrientationLayout(
          portrait: (context) => LoginPagePortrait(),
          landscape: (context) => LoginPageLandscape(),
        ),
        desktop: OrientationLayout(
          portrait: (context) => LoginPagePortrait(),
          landscape: (context) => LoginPageLandscape(),
        ),
      ),
    );
  }
}
