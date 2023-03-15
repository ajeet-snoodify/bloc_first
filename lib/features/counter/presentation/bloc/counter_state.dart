

import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable{
  final List<Object?> _props;
  CounterState([List<Object?> props = const <dynamic>[]]): _props = props;
  @override
  List<Object?> get props => _props;
}

class Empty extends CounterState{}

class Loading extends CounterState{
  final String message;
  Loading(this.message): super([message]);
}

class Error extends CounterState{
  final String message;
  Error(this.message): super([message]);
}
class Data extends CounterState{
  final int count;
  Data(this.count): super([count]);
}
