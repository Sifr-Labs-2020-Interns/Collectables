
import 'package:Collectables/utilities/index.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) => model.initialise(),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => NavigationBarPortrait(),
          landscape: (context) => NavigationBarLandscape(),
        ),
        tablet: OrientationLayout(
          portrait: (context) => NavigationBarPortrait(),
          landscape: (context) => NavigationBarLandscape(),
        ),
        desktop: OrientationLayout(
          portrait: (context) => NavigationBarPortrait(),
          landscape: (context) => NavigationBarLandscape(),
        ),
      ),
    );
  }
}
