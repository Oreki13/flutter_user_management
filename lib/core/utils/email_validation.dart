bool checkIsEmail(String email){
  RegExp validEmail = RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$');
   return validEmail.hasMatch(email.trim());
}