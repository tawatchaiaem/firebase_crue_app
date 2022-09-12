import 'package:firebase_crudapp/models/product.dart';
import 'package:firebase_crudapp/providers/product_provider.dart';
import 'package:firebase_crudapp/screens/product_screen.dart';
import 'package:firebase_crudapp/services/firestore_service.dart';
// import 'package:firebase_crudapp/utils/PushNotificationManager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initial firebase
  await Firebase.initializeApp();

  // initial firebaseMessenger
  // PushNotificationManager().initFirebaseMessaging();
  builder:
  (context, child) {
    runApp(MyApp());
  };
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fireStoreService = FirestoreService();

    return MultiProvider(
      providers: [
        //Provider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        StreamProvider(
          create: (context) => fireStoreService.getProducts(),
          initialData: ProductProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firestore CRUD',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: ProductScreen(),
      ),
    );
  }
}
