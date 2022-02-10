enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  undefined,
  weakPassword,
  differentCredentials,
  invalidCredential,
}

class AuthExceptionHandler {
  static generateExceptionMessage(e) {
    String errorMessage;
    print(e.code);
    var status;
    switch (e.code) {
      case "invalid-email":
        status = AuthResultStatus.invalidEmail;
        errorMessage = "Indirizzo mail non valido";
        break;
      case "account-exists-with-different-credential":
        status = AuthResultStatus.differentCredentials;
        errorMessage = "Account esistente con credenziali diverse";
        break;
      case "weak-password":
        status = AuthResultStatus.weakPassword;
        errorMessage = "La password deve avere almeno 6 caratteri";
        break;
      case "email-already-in-use":
        status = AuthResultStatus.emailAlreadyExists;
        errorMessage = "Indirizzo e-mail già in uso";
        break;
      case "user-not-found":
        status = AuthResultStatus.userNotFound;
        errorMessage = "Non esiste un utente con questa e-mail";
        break;
      case "wrong-password":
        status = AuthResultStatus.wrongPassword;
        errorMessage = "Password errata";
        break;
      case "user-disabled":
        status = AuthResultStatus.userDisabled;
        errorMessage = "L'account con questa e-mail disabilitata";
        break;
      case "invalid-credential":
        status = AuthResultStatus.invalidCredential;
        errorMessage = "Credenziali non valide";
        break;
      default:
        status = AuthResultStatus.undefined;
        errorMessage = "Errore sconosciuto";
    }
    return errorMessage;
  }
}
