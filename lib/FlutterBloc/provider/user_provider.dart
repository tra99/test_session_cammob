import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<String> {
  UserCubit() : super("Koy Angkearoth");

  void updateName({required String newUserName}) {
    emit(newUserName);
  }
}
