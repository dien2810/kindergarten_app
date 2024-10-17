class SignupEmailPasswordFailure{
  final String message;
  const SignupEmailPasswordFailure([this.message = "An Unknown error occurred."]);
  factory SignupEmailPasswordFailure.code(String code){
    switch(code){
      case 'weak-password':
        return const SignupEmailPasswordFailure('Please enter a strong password');
      case 'invalid-email':
        return const SignupEmailPasswordFailure('Email is not valid or badly formatted.');
      case 'email-already-in-use':
        return const SignupEmailPasswordFailure('An account already exists for '
            'that email');
      case 'operation-not-allowed':
        return const SignupEmailPasswordFailure('Operation not allowed. Please'
            ' contact support.');
      case 'user-disabled':
        return const SignupEmailPasswordFailure('This user has been disabled. '
            'Please contact support for help.');
      default: return const SignupEmailPasswordFailure();
    }
  }

}