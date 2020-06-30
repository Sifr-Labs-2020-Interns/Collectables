import 'package:Collectables/utilities/index.dart';

class LoginPagePortrait extends StatefulWidget {
  @override
  _LoginPagePortraitState createState() => _LoginPagePortraitState();
}

class _LoginPagePortraitState extends State<LoginPagePortrait> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    FontAwesomeIcons.chevronLeft,
                  ),
                  sizedBox(15, 0),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  getTextField(context, 'Email', emailController,
                      TextInputType.emailAddress),
                  sizedBox(15, 0),
                  getTextField(context, 'Password', passwordController,
                      TextInputType.visiblePassword),
                  sizedBox(15, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot your password?'),
                      sizedBox(0, 5),
                      Icon(
                        FontAwesomeIcons.longArrowAltRight,
                        color: Theme.of(context).accentColor,
                      ),
                    ],
                  ),
                  sizedBox(15, 0),
                  getButton(context, 'LOGIN', () {}),
                  sizedBox(30, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      sizedBox(0, 5),
                      Text(
                        'Sign Up',
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Text('Or login with social account'),
            ),
            sizedBox(15, 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getLoginIcons(
                  context,
                  'assets/images/google.png',
                ),
                sizedBox(0, 30),
                getLoginIcons(
                  context,
                  'assets/images/facebook.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container getLoginIcons(BuildContext context, String image) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).secondaryHeaderColor,
            offset: Offset(
              0.0,
              1.0,
            ), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      height: 60,
      width: 60,
      child: Center(
        child: Image.asset(
          image,
          height: 30,
          width: 30,
        ),
      ),
    );
  }
}
