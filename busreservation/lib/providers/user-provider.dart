import "package:flutter_riverpod/flutter_riverpod.dart";

class UserNotifier extends StateNotifier<String>{
  UserNotifier():super("");

  void setUser(String user){
    state=user;
  }
  String getUser(){
    return state;
  }
}

final userProvider=StateNotifierProvider<UserNotifier,String>((ref) => UserNotifier());