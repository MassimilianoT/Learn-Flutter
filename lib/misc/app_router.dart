import 'package:flutter/material.dart';
import 'package:login_learn/dto/second_page_arguments_dto.dart';
import 'package:login_learn/pages/hello_page.dart';
import 'package:login_learn/pages/second_page.dart';

class AppRouter{
  static const MAIN = '/';
  static const SECOND_PAGE = '/second';
  
  static Route<dynamic>? generateRoute(RouteSettings settings){
      switch(settings.name){
        case AppRouter.MAIN:
          return MaterialPageRoute(builder: (_)=> HelloPage());
        case AppRouter.SECOND_PAGE:
          return MaterialPageRoute(builder: (_) {
            final dto = settings.arguments as SecondPageArgumentsDTO;
            return SecondPage(name: dto.name);
          } );

      }
  }
}