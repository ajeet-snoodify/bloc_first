import 'package:bloc_first/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:bloc_first/features/counter/presentation/bloc/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final bloc = CounterBlocNew();

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App With Bloc'),
      ),
      body: Center(
        child: StreamBuilder(
          initialData: 0,
          stream: bloc.stream,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Text(
                  'value - ${snapshot.data}'
              );
            }else{
              return snapWidgetHelper(snapshot);
            }
          }
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed:()=>bloc.add(IncrementEvent()), child: Icon(Icons.add),),
          10.width,
          FloatingActionButton(onPressed: ()=>bloc.add(DecrementEvent()), child: Icon(Icons.remove),),
        ],
      ),
    );
  }

  @override
  void dispose() async{
    await bloc.close();
    super.dispose();
  }
}
