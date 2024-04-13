import 'dart:async';

import 'package:cat_api/data/api/controller/cat_controller.dart';
import 'package:cat_api/data/local/localdb/pet_db.dart';
import 'package:cat_api/data/local/model/pet.dart';
import 'package:cat_api/utils/shared_prefs.dart';
import 'package:cat_api/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Untuk memastikan SharedPreferenceService terinisialisasi
  WidgetsFlutterBinding.ensureInitialized();
  // Untuk memastikan Hive terinisialisasi
  await Hive.initFlutter();
  Hive.registerAdapter(PetAdapter());
  // Aktifkan Hive local database (Pet)
  await MyPetDB.init();

  // Panggil SharedPreferenceService dari utils yang dibuat
  await SharedPreferenceService.init();
  // Akses .env untuk mengambil CAT_API_KEY
  await dotenv.load(fileName: 'assets/configs/.env');

  Get.put(CatController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TheCAT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const MySplashScreen(),
    );
  }
}

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) {
            List<Pet> petList = MyPetDB.getAllPets();

            if (petList.isEmpty) {
              return const OnBoardingScreenViews();
            } else {
              return const HomeScreenViews();
            }
          },
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.center,
            image: AssetImage('assets/images/cat-splash.png'),
            fit: BoxFit.fill,
          ),
        ),
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
