import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_practice/counter_screen/cubit/dynamic_counter_cubit.dart';

class DynamicCounterScreen extends StatelessWidget {
  const DynamicCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(create: (_) => DynamicCounterCubit(),
      child: CounterList(),
      ),
    );
  }
}
class CounterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DynamicCounterCubit, Map<String, int>>(
      builder: (context, counters) {
        final counterIds = counters.keys.toList();

        return ListView.builder(
          itemCount: counterIds.length,
          itemBuilder: (context, index) {
            final counterId = counterIds[index];
            return CounterRow(counterId: counterId);
          },
        );
      },
    );
  }
}

class CounterRow extends StatelessWidget {
  final String counterId;

  CounterRow({required this.counterId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DynamicCounterCubit, Map<String, int>>(
      builder: (context, counters) {
        final count = counters[counterId] ?? 0;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(counterId, style: TextStyle(fontSize: 18)),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      context.read<DynamicCounterCubit>().decrement(counterId);
                    },
                  ),
                  Text('$count', style: TextStyle(fontSize: 18)),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      context.read<DynamicCounterCubit>().increment(counterId);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      context.read<DynamicCounterCubit>().reset(counterId);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
