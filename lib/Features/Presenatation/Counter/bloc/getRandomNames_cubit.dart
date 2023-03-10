import 'dart:math' as math show Random;

import 'package:flutter_bloc/flutter_bloc.dart';

var names = ["Ganga", "Bharat", "Ram Chandra", "Laxmi", "Dev", "rajan"];

class GetRandomNamesCubit extends Cubit<String?> {
  GetRandomNamesCubit() : super(null);
  void pickname() => emit(names.getRandomElement());
}

extension GetRandomNames<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}
