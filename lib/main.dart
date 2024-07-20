import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/dashboard/dashboard.dart';
import 'di_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: di.blocs,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const DashboardScreen(),
        theme: theme,
      ),
    );
  }
}

final theme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  // appBarTheme: const AppBarTheme(
  //   shadowColor: Colors.transparent,
  //   elevation: 0.0,
  //   centerTitle: true,
  //   color: Colors.grey,
  //   titleTextStyle: TextStyle(
  //     color: Colors.white,
  //     fontSize: 20.0,
  //     fontWeight: FontWeight.normal,
  //   ),
  // ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
  ),
);

class AnimatedListView extends StatelessWidget {
  const AnimatedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          ).animate().custom(
                delay: Duration(milliseconds: index * 100),
                duration: 500.ms,
                builder: (context, value, child) => Transform.translate(
                  offset: Offset(200 - (200 * value), 0),
                  child: Opacity(
                    opacity: value,
                    child: child,
                  ),
                ),
              );
        },
      ),
    );
  }
}
