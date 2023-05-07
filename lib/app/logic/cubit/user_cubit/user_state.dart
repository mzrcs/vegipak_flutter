import 'package:vegipak/app/darta/models/user/sign_in_token.dart';

import '../../../darta/models/user/user_model.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoggedInState extends UserState {
  // final SigninTokenModel tokenModel;
  UserLoggedInState();
}

class UserLoggedOutState extends UserState {}

class UserErrorState extends UserState {
  final String message;
  UserErrorState(this.message);
}
