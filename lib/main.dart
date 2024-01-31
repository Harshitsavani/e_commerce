import 'package:e_commerce/Dashboard.dart';
import 'package:e_commerce/controller.dart';
import 'package:e_commerce/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MaterialApp(
      routes: {
        "Dashboard": (context) => Dashboard(),
        "product": (context) => product_detail(),
      },
      home: ChangeNotifierProvider(
        create: (context) => controller(),
        child: Dashboard(),
      ),
    ),
  );
}