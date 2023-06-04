class Validator{
  static String error({
    String? customErrorMessage,
    required String defaultErrorMessage,
  }){
    if(customErrorMessage != null){
      return customErrorMessage;
    }
    return defaultErrorMessage;
  }
}