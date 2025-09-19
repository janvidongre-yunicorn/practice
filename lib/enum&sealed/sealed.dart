import 'dart:async';



//=============state============
sealed class AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final String userId;
  AuthSuccess(this.userId);
}
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}


//=============== events================
class AuthEvent {
  final String username;
  final String password;
  AuthEvent(this.username, this.password);
}



//==============bloc=============
class AuthBloc {
  final _stateController = StreamController<AuthState>();
  Stream<AuthState> get stream => _stateController.stream;

  void add(AuthEvent event) async {
    _stateController.add(AuthLoading());
    await Future.delayed(Duration(seconds: 2));
    if (event.username == "admin" && event.password == "1234") {
      _stateController.add(AuthSuccess("user_001"));
    } else {
      _stateController.add(AuthError("Invalid credentials"));
    }
  }

  void dispose() {
    _stateController.close();
  }
}
