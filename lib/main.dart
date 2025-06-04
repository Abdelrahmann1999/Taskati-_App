import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/cubit/themeCubit.dart';
import 'package:taskati/core/cubit/themeState.dart';
import 'package:taskati/core/model/task_model.dart';

import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/themes.dart';
import 'package:taskati/features/intro/splach_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("user");
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());
  await Hive.openBox<TaskModel>("Tasks");
  await LocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          bool isDarkTheme = context.read<ThemeCubit>().isDarkTheme;

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,

            home: splach_screen(),
          );
        },
      ),
    );
  }
}
