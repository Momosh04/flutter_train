class AuthServiceMock{
bool success = false;


signUp(String name,String password,String phone,String gender,String birthDate){
  if (password.length > 8 && phone.length > 10 && name.length >4){
    success = true;
    return success;
  }else {
    success = false ;
    return success;
  }

}


}