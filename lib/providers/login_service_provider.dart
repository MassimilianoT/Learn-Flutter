import 'package:flutter/cupertino.dart';
import 'package:login_learn/services/login_service.dart';

//Aggiunto prima della MaterialApp permette di avere il loginService accessibile da ogni albero della gerarchia
class LoginServiceProvider extends InheritedWidget{
  final LoginService loginService;
  LoginServiceProvider(this.loginService, {required Widget child}) : super(child: child);

  static LoginServiceProvider of(BuildContext context)=> context.dependOnInheritedWidgetOfExactType<LoginServiceProvider>()!;
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
  }
