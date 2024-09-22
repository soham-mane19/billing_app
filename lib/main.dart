import 'package:flutter/material.dart';
import 'package:vyapar_app/CustomerModel.dart';
import 'package:vyapar_app/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vyapar_app/firebase_options.dart';



void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    ChangeNotifierProvider(
      create: (context) => CustomerModel(),
      child: const Myapp(),
    ),
  );
}
class Myapp extends StatelessWidget{
const Myapp({super.key});

@override
  Widget build(BuildContext context) {
   return const  MaterialApp(
    debugShowCheckedModeBanner: false,
   home:  HomeScreen(),
   );
  }



}