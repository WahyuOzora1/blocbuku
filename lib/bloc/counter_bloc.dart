import 'dart:async';
import 'content_provider.dart';

class CounterBLoc {
  final counterController = StreamController(); //create a StreamCntroller
  final CounterProvider provider =
      CounterProvider(); //create an instance of ou CounterProvider

  Stream get getCount =>
      counterController.stream; //create a getter for our stream
  void updateCount() {
    provider
        .increaseCount(); //call the method to increase our count in the provider
    counterController.sink.add(provider.count);
  }

  void dispose() {
    counterController.close(); //closde our StreamController
  }
}

final bloc = CounterBLoc(); //create an instance of the counter bloc
