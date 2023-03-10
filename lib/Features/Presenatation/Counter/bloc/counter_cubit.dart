import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math show Random;

int counter = 0;

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(counter);

  void increment() => emit(++counter);

  // void increment() => emit(state + 1);

  // int counter = state;
  // final data = ++counter;
  // emit(data);

  void decreament() => emit(--counter);

  // void increment() => emit(state -1);

  // int counter = state;
  // final data = counter - 1;
  // emit(data);

}

extension GetRandomNames<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}
