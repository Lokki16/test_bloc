import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_bloc/bloc/test/test_bloc.dart';

class TestPage extends StatelessWidget {
  TestPage({super.key});

  String text = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestBloc, TestState>(
      builder: (context, state) {
        if (state is TestInitial) {
          return const SafeArea(
            child: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }

        if (state is TestErrorState) {
          return const SafeArea(
            child: Scaffold(body: Center(child: Text('Error'))),
          );
        }

        if (state is TestLoadedState) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: TextField(
                          onChanged: (text) {
                            this.text = text;
                          },
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () => context
                                  .read<TestBloc>()
                                  .add(InsertEvent(text: text)),
                              child: const Icon(Icons.done),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 500.h,
                        child: ListView.builder(
                          itemCount: state.listOfText.length,
                          itemBuilder: (context, index) {
                            var reversedList =
                                state.listOfText.reversed.toList();
                            return ListTile(
                              title: Text(reversedList[index]),
                              trailing: GestureDetector(
                                onTap: () {
                                  context.read<TestBloc>().add(
                                      DeleteEvent(text: reversedList[index]));
                                },
                                child: const Icon(Icons.delete),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20.h),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.redAccent)),
                        onPressed: () {
                          context.read<TestBloc>().add(DeleteAllEvent());
                        },
                        child: const Text('Delete All'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
