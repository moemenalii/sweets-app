abstract class loginState {}

class InitialState extends loginState{}

class LoadingLoginState extends loginState{}

class SuccessLoginState extends loginState{
  final String? uId;

  SuccessLoginState(this.uId);
}

class ErorrLoginState extends loginState{
  // final String Erorr;
  //
  // ErorrLoginState(this.Erorr);
}

class cahngeIconState extends loginState{}