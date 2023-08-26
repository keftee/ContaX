import 'package:contact_manager/auth_page.dart';
import 'package:flutter/material.dart';
// import 'sign_in.dart';
import 'style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:contact_manager/firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AuthPage()
    );
  }
}

class Hello extends StatelessWidget {
  const Hello({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 174, 207, 223),
      body:
        Center(
          child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: bgColor,
                    elevation: 0.0,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),

                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(100.0),
                        child: Text(
                          "Hello", 
                          style: TextStyle(
                            color: textColor1,
                            fontSize: fontSize,
                            fontWeight: fontWeight
                          ),
                        ),
                      )
                    ]
                  ),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => _createRoute()));
                    Navigator.of(context).push(_createRoute());
                  }
                ),
        ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => AuthPage(),
    transitionDuration: const Duration(milliseconds: 650),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      var curve = Curves.easeIn;
      var curveTween = CurveTween(curve: curve);
      final tween = Tween(begin: begin, end: end).chain(curveTween);
      final offsetAnimation = animation.drive(tween);

      

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}



