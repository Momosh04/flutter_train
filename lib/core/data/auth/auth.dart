import 'package:herry_up/core/config/dependency_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServiceMock{
bool success = false;


signUp(String name,String password,String phone,String gender,String birthDate){
  if (password.length > 8 && phone.length > 10 && name.length >4){
    success = true;
    
  }else {
    success = false ;
  
  }
  storage.get<SharedPreferences>().setBool('auth_state',success);

  return success;

  
}
// exit




}