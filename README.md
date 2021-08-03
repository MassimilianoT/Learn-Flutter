# Learn Flutter

Questo branch della repo '**Learn Flutter**' creata appositamente come strumento didattico per l'IEEE Student Branch dell'Università degli studi di Brescia reinterpreta la app di default di flutter usando l'approccio Cubit.
<p align="center" width="100%">
    <img width="33%" src="https://user-images.githubusercontent.com/49036204/127985029-6b59f370-2726-4504-9ba1-c6b057d8b5e0.png" />
</p>

- - -


Come nota ai fruitori attualmente il package <i>flutter_cubit</i> non supporta la null-safety e quindi non è adatto ad un uso su Flutter 2 -> il package <i>flutter_bloc</i> invece dalla versione 7.1.0, si suggerisce quindi di usare quest'ultimo.


## Esempio di utilizzo

Per prima cosa si definisce la classe Cubit che vogliamo distribuire nella nostra app
```dart
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
}
```
Dopo aver definito la classe si utilizza un *BlocProvider* per fornire a tutti i widget al di sotto di esso un accesso al Cubit (Cubit è un sottotipo di Bloc). 
```dart
return BlocProvider(
      create: (_) => CounterCubit(),
      lazy: false,
      child: MaterialApp(...
      );
```
Infine per catturare il Bloc e utilizzarlo si fa uso di un *BlocBuilder*
```dart
return BlocBuilder<CounterCubit, int>(
      builder: (context, counter) => Scaffold(...
      );
```

Questi 3 Widget combinati permettono quindi di distribuire lo stato all'interno della nostra app e di liberarci quindi dell'approccio Statefull. 
