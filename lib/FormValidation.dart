

class FormValidation {

  bool isPasswordValid(String password){
    if(password.length>=6){
      return true;
    }else{
      return false;
    }
  }

  bool isEmailValid(String email){
    RegExp regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }

}