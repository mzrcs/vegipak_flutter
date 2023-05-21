// import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:vegipak/app/darta/models/user/sign_in_token.dart';
// import 'package:vegipak/app/logic/cubit/user_cubit/user_state.dart';
// // import 'package:vegipak/app/utils/dio_exception.dart';
// import '../../../darta/repositories/user_repository.dart';
// import '../../services/prefrences.dart';

// class UserCubit extends Cubit<UserState> {
//   UserCubit() : super(UserInitialState()) {
//     _initialize();
//   }

//   final UserRepository _userRepository = UserRepository();

//   void _initialize() async {
//     final userDetails = await Preferences.fetchUserDetails();
//     print('token: ${userDetails.token}');
//     if (userDetails.token != null) {
//       signIn(email: 'haseeb@gmail.com', password: 'Abcd1234!');
//     } else {
//       emit(UserLoggedOutState());
//     }
//   }

//   void _emitLoggedInState({required TokenModel tokenModel}) async {
//     await Preferences.saveUserDetails(tokenModel.token!);
//     emit(UserLoggedInState());
//   }

//   void signIn({
//     required String email,
//     required String password,
//   }) async {
//     emit(UserLoadingState());
//     try {
//       TokenModel tokenModel =
//           await _userRepository.signIn(email: email, password: password);
//       _emitLoggedInState(tokenModel: tokenModel);
//     } on DioError catch (ex) {
//       // print(ex.response!.data['message']);
//       final message = ex.response!.data['message'] as List<dynamic>;
//       if (message.isNotEmpty) {
//         final errorMessage = message.join(', ');
//         // print(errorMessage);
//         emit(UserErrorState(errorMessage));
//       }
//     }
//   }

//   void createAccount({required dynamic data}) async {
//     emit(UserLoadingState());
//     try {
//       TokenModel tokenModel = await _userRepository.createAccount(data: data);
//       _emitLoggedInState(tokenModel: tokenModel);
//     } on DioError catch (ex) {
//       // print(ex.response!.data['message']);
//       final message = ex.response!.data['message'] as List<dynamic>;
//       if (message.isNotEmpty) {
//         final errorMessage = message.join(', ');
//         // print(errorMessage);
//         emit(UserErrorState(errorMessage));
//       }
//     }
//   }

//   void signOut() async {
//     await Preferences.clearData();
//     emit(UserLoggedOutState());
//   }
// }
