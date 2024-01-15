import 'package:bridge_softwares_demo/models/cart_product_model.dart';
import 'package:bridge_softwares_demo/services/hive_database.dart';
import 'package:bridge_softwares_demo/view/starting_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  /// Initialization of Hive Database
  await Hive.initFlutter();
  Hive.registerAdapter(CartProductModelAdapter());

  /// Create a box for cart items
  HiveDatabase.cartProductsBox =
      await Hive.openBox<CartProductModel>('cartProductsBox');

  /// Run App
  runApp(
    /// RiverPod Widget for globally access the Providers
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return child!;
        },
        child: MaterialApp(
          title: 'Bridge Software Flutter Demo',
          debugShowCheckedModeBanner: false,
          builder: (context, child) => MediaQuery.withClampedTextScaling(
            minScaleFactor: 1.0,
            maxScaleFactor: 1.0,
            child: child!,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
