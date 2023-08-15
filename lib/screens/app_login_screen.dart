import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import '../components/custom_button_widget.dart';
import '../components/custom_textfield.dart';
import '../components/custom_textfield_password.dart';
import '../constants/colors.dart';
import 'hotel_list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          "Login",
          style: new TextStyle(
            color: textBlack,
            fontSize: width * 0.06,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: appbarcolor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15, top: 30),
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                height: width*0.15,
                width: width*0.6,
                decoration: BoxDecoration(
                  color: appbarcolor,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/elegant_media_logo.jpg'),),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              _getEmailTextField(),
              SizedBox(
                height: 15,
              ),
              _getPasswordTextField(),
              SizedBox(
                height: 30,
              ),
              CustomButtonWidget(
                onTap: () {},
                title: "Login",
              ),
              SizedBox(
                height: 20,
              ),
              _getForgetPassword(),
              SizedBox(
                height: 20,
              ),
              _getTextOnLineDivider(),
              SizedBox(
                height: 20,
              ),
              _getSocialMediaButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _getEmailTextField() {
    return CustomTextField(
      prefixIcon: Icon(
        Icons.mobile_off,
        size: 18,
      ),
      controller: _usernameController,
      labelText: "Email",
    );
  }

  Widget _getPasswordTextField() {
    return CustomTextFieldPassword(controller: _passwordController);
  }

  Widget _getForgetPassword() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Text("Forgot Password", style: TextStyle(color: textGrey)),
      ),
    );
  }

  Widget _getTextOnLineDivider() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text("Or"),
        )
      ],
    );
  }

  Widget _getSocialMediaButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Tab(
            icon: Image.asset("assets/images/applelogo.png")),
        Tab(icon: GestureDetector(
            onTap: () {
              _facebookLogin();
            },
            child: Image.asset("assets/images/facebook.png"))),
        Tab(icon: Image.asset("assets/images/googleicon.png")),
      ],
    );
  }


  _facebookLogin() async {
    // Create an instance of FacebookLogin
    final fb = FacebookLogin();

    // Log in
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
    ]);

    // Check result status
    switch (res.status) {
      case FacebookLoginStatus.success:
        // Logged in

        // Send access token to server for validation and auth
        final FacebookAccessToken? accessToken =
            res.accessToken; // get accessToken from auth login
        final profile = await fb.getUserProfile(); // get profile of user
        final imageUrl = await fb.getProfileImageUrl(
            width: 100); // Get user profile image url
        final email = await fb
            .getUserEmail(); // Get email (since we request email permission)

        Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => HotelListScreen(
          fbAccessToken: accessToken!.token,
          fbName: profile!.name!,
          fbId: profile.userId!,
          fbEmail: email ?? "lk@gmail.com",
        ))));

        // But user can decline permission
        if (email != null){
          print('And your email is $email');

          //push to success page after successfully signed in
          Navigator.push(context, MaterialPageRoute(builder: ((context) => HotelListScreen(
            fbAccessToken: accessToken!.token,
            fbName: profile!.name!,
            fbId: profile.userId!,
            fbEmail: email!,
          ))));
          break;
        }
      case FacebookLoginStatus.cancel:
        // User cancel log in
        break;
      case FacebookLoginStatus.error:
        // Log in failed
        print('Error while log in: ${res.error}');
        break;
    }
  }

  /*_facebookLogout() async{
    accessToken! = null;
  }*/
}
