import 'package:coffeelito/bloc/category/category_bloc.dart';
import 'package:coffeelito/bloc/coffee/coffee_bloc.dart';
import 'package:coffeelito/bloc/order/order_bloc.dart';
import 'package:coffeelito/bloc/product/product_bloc.dart';
import 'package:coffeelito/cubit/tab_box/tab_box_cubit.dart';
import 'package:coffeelito/data/firebase_service/coffee_service.dart';
import 'package:coffeelito/data/firebase_service/order_service.dart';
import 'package:coffeelito/data/local/db/local_database.dart';
import 'package:coffeelito/data/repositories/order_repo/order_repo.dart';
import 'package:coffeelito/presentation/tab_box/app_routes.dart';
import 'package:coffeelito/presentation/tab_box/profile_screen/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'data/local/storage_repository/storage_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await StorageRepository.getInstance();
  LocalDatabase.getInstance;
  runApp(App(orderService: OrderService(), coffeeService: CoffeeService()));
}

class App extends StatelessWidget {
  const App({
    super.key,
    required this.orderService,
    required this.coffeeService,
  });

  final OrderService orderService;
  final CoffeeService coffeeService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => OrderRepository(orderService: orderService),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TabCubit()),
          BlocProvider(
            create: (context) => OrderBloc(
              orderRepository: context.read<OrderRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => ProductBloc(),
          ),
          BlocProvider(
            create: (context) => CategoryBloc(),
          ),
          BlocProvider(
              create: (context) => CoffeeBloc(coffeeService: coffeeService)),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          home: ProfileScreen(),
          // initialRoute: RouteNames.splashScreen,
          // onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
