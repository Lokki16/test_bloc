import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_bloc/bloc/test/test_bloc.dart';
import 'package:test_bloc/presentation/pages/test_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'Test',
        debugShowCheckedModeBanner: false,
        home: BlocProvider<TestBloc>(
          create: (context) => TestBloc()..add(FetchEvent()),
          child: TestPage(),
        ),
      ),
    );
  }
}
