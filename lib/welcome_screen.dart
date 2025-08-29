import 'package:flutter/material.dart';
import 'package:shopping_app/lang/app_loalizations.dart';
import 'package:shopping_app/signin_screen.dart';
import 'package:shopping_app/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isNetworkHovering = false;

  bool isAssetHovering = false;

  bool isSignUpHovering = false;

  bool isSignInHovering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.shop_craft,
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.premium,
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {},
                    onHover: (value) {
                      setState(() {
                        isNetworkHovering = value;
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        child: Image(
                          image: NetworkImage('https://picsum.photos/200/300'),
                          width: isNetworkHovering ? 370 : 350,
                          height: isNetworkHovering ? 370 : 350,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {},
                    onHover: (value) {
                      setState(() {
                        isAssetHovering = value;
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: AssetImage('assets/images/8-367x267.jpg'),
                        width: isAssetHovering ? 370 : 350,
                        height: isAssetHovering ? 370 : 350,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: MouseRegion(
                    onEnter: (_) => setState(() => isSignUpHovering = true),
                    onExit: (_) => setState(() => isSignUpHovering = false),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 10),
                      width: isSignUpHovering ? 220 : 200,
                      height: isSignUpHovering ? 70 : 60.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute<void>(
                            builder: (context) => const SignUpScreen(),
                          ),);
                        },

                        child: Text(
                          AppLocalizations.of(context)!.sign_up,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: MouseRegion(
                    onEnter: (_) => setState(() => isSignInHovering = true),
                    onExit: (_) => setState(() => isSignInHovering = false),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 10),
                      width: isSignInHovering ? 220 : 200,
                      height: isSignInHovering ? 70 : 60.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextButton(
                        onPressed: () {
                           Navigator.push(context, MaterialPageRoute<void>(
                            builder: (context) => const SignInScreen(),
                          ),);
                        },

                        child: isSignInHovering
                            ? Text(
                                AppLocalizations.of(context)!.sign_in,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25,
                                ),
                              )
                            : Text(''),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
