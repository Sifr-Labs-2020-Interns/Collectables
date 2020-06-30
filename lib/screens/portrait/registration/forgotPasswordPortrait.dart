import 'package:Collectables/utilities/index.dart';

class ForgotPasswordPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight(context),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getRegistrationHeader(3, 'Forgot Password', () {
                Navigator.pop(context);
              }),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    AutoSizeText(
                      'Please enter your email address. You will receive a link to reset your password via email.',
                      maxLines: 2,
                    ),
                    sizedBox(30, 0),
                    getTextField(
                      context,
                      'Email',
                      emailController,
                      TextInputType.emailAddress,
                    ),
                    sizedBox(15, 0),
                    getButton(
                      context,
                      'RESET PASSWORD',
                      () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
