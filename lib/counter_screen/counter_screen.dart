import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_practice/counter_screen/cubit/counter_cubit.dart';
import 'package:flutter_bloc_cubit_practice/counter_screen/cubit/text_cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<CounterCubit, int>(
            builder: (context, count) {
              return Center(child: Text('$count'));
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('hello'),
              BlocBuilder<TextCubit, String>(
                builder: (context, state) {
                  return AnimatedSwitcher(duration: Duration(milliseconds: 2500),
                      transitionBuilder: (child, animation) {
                        return SlideTransition(
                          position: animation.drive(
                            Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                                .chain(CurveTween(curve: Curves.easeInOut)),
                          ),
                          child: child,
                        );
                      },

                      child: Text(state));
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: (){
            context.read<TextCubit>().toggleText();
          }, child: Text('swap text'))
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(onPressed: () => context.read<CounterCubit>().increment(),child: Icon(Icons.add),),
          FloatingActionButton(onPressed: () => context.read<CounterCubit>().decremnt(),child: Icon(Icons.remove),),
        ],
      ),
    );
  }
}
