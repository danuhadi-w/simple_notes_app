import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_notes_app/konstant.dart';
import 'package:simple_notes_app/views/login_view.dart';
import 'package:simple_notes_app/screen_helper.dart';
import 'package:simple_notes_app/views/register_view.dart';

class LoginRegisterContainer extends StatefulWidget {
  const LoginRegisterContainer({super.key});

  @override
  State<LoginRegisterContainer> createState() => _LoginRegisterContainerState();
}

class _LoginRegisterContainerState extends State<LoginRegisterContainer> {
  late Size screenData;

  var isLoginRoute = true;

  @override
  void initState() {
    super.initState();
  }

  double get cardHeight {
    return screenData.height * 0.5 +
        (isLandscape(context) ? screenData.height * 0.1 : 0) +
        ((!isLoginRoute && isLandscape(context))
            ? screenData.height * 0.15
            : 0);
  }

  @override
  Widget build(BuildContext context) {
    screenData = screenSize(context);
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.inversePrimary.withOpacity(0.8),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Simple Note by me",
                  style: Konstant.titleTextTheme
                      .copyWith(color: Colors.white, fontSize: 24),
                ),
                SizedBox(
                  height: cardHeight,
                  width: screenData.width * 0.7,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: PageTransitionSwitcher(
                        reverse: !isLoginRoute,
                        transitionBuilder:
                            (child, animation, secondaryAnimation) =>
                                SharedAxisTransition(
                          transitionType: SharedAxisTransitionType.horizontal,
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          child: child,
                        ),
                        child: isLoginRoute ? LoginView() : RegisterView(),
                      ),
                    ),
                  ),
                ),
                FittedBox(
                  child: Row(
                    children: [
                      Text(
                        isLoginRoute
                            ? "Don't have account? Register "
                            : "Already have account? Login ",
                        style: Konstant.bodyTextWhite,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isLoginRoute = !isLoginRoute;
                          });
                        },
                        child: Text(
                          "here",
                          style: TextStyle(
                              color: Colors.yellow,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
