import 'package:billing/repository/signup_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/login_request.dart';
import '../../models/login_response.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    LoginResponse response;
    on<SignupRequestEvent>((event, emit) async {
      emit(SignupLoad());
      response = await SignupRepository().login(event.signupRequest);
      try {
        response = await SignupRepository().login(event.signupRequest);

        emit(SignupDone(response));
      } catch (e) {
        emit(SignupError(e.toString()));
      }
    });
  }
}