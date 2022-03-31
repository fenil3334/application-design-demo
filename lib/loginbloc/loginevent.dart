abstract class LoginEvent{}

class LoginTextChange extends LoginEvent{
  String emailvalue;
  String passwordValue;

  LoginTextChange(this.emailvalue,this.passwordValue);
}

class LoginSubmit extends LoginEvent{
  String emailvalue;
  String passwordValue;

  LoginSubmit(this.emailvalue,this.passwordValue);
}
