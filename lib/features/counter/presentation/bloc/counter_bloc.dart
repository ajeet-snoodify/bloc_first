import 'package:bloc/bloc.dart';
import 'package:bloc_first/features/counter/presentation/bloc/counter_event.dart';
import 'package:nb_utils/nb_utils.dart';

class CounterBlocNew extends Bloc<CounterEvent, int>{

  CounterBlocNew(): super(0){
    on<IncrementEvent>((event, emit) async{
      emit(state+1);
      await Future.delayed(Duration(seconds: 1));
      print(state);
    });
    on<DecrementEvent>((event, emit) {
      if(state>0){
        emit(state-1);
      }else{
        addError(Exception('counter cant be negative'),StackTrace.current);
      }
    });
  }
}

class CounterBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
