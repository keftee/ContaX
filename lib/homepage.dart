import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_manager/get_user_name.dart';
// import 'package:contact_manager/my_button.dart';
import 'package:contact_manager/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'edit_contact.dart';
// import 'contact.dart';
import 'contact_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  List<String> docIDs= [];

  Future getDocID() async {
    await FirebaseFirestore.instance.collection(user.email!).get().then(
      (snapshot) => snapshot.docs.forEach((element) {
        print(element.reference);
        docIDs.add(element.reference.id);
      })
    );
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('ContaX',
                  style: TextStyle(fontWeight: fontWeight, color: textColor1, fontSize: 40),
                ),
              ),

              IconButton(
                onPressed: signUserOut, 
                icon: const Icon(Icons.logout_rounded),
                color: textColor1,
                tooltip: 'Logout',
                iconSize: 20,
              )
            ],
          ),
        ),
        // actions: [
          
        // ],
      ),
      body: Column(
        children: [
          // Divider(thickness: 1.0,color: Colors.grey.shade600,),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 60,),
              Text(user.email!, style: TextStyle(fontWeight: fontWeight, color: textColor1, fontSize: 12),),
            ],
          ),
          Divider(thickness: 1.0,color: Colors.grey.shade600,),

          Expanded(
            child: FutureBuilder(
              future: getDocID(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: docIDs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: ElevatedButton(
                        onPressed: () {Navigator.of(context).push(_createRoute2(docIDs, index));},
                        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1)),
                        // hoverElevation: 10,
                        // elevation: 5,
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.grey[100]),
                          elevation: MaterialStatePropertyAll(0),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                        ),
                        child: Container(
                          height: 80,
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: Colors.grey.shade600), 
                            // color: Colors.black
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListTile(
                                leading: Icon(Icons.person),
                                title: GetUserName(documentID: docIDs[index], ts: TextStyle(fontWeight: fontWeight, color: textColor1, fontSize: 18),)
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
             }
            )
          ),
          

          
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton.extended(
                label: Text('Add Contact', style: TextStyle(fontWeight: fontWeight, color: bgColor,),),
                onPressed: () {
                  Navigator.of(context).push(_createRoute());//Navigator.push( context, MaterialPageRoute(builder: (context) => EditContactPage()))
                },
                icon: Icon(Icons.person_add_alt_rounded, color: bgColor,),
                backgroundColor: textColor1,
                tooltip: 'Add Contact',
                
              ),
      ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
    
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => EditContactPage(),
    transitionDuration: const Duration(milliseconds: 400),
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

Route _createRoute2(List id, int index) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ContactPage(docID: id[index]),
    transitionDuration: const Duration(milliseconds: 400),
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