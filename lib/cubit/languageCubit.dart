import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en')); // Default language
  String languageCode = 'en';
  void changeLanguage(String code) async {
    languageCode = code;
    emit(Locale(languageCode));
  }
}
