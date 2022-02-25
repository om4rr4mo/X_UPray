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
    switch (e.code) {
      case "invalid-email":
        errorMessage = "Indirizzo mail non valido";
        break;
      case "account-exists-with-different-credential":
        errorMessage = "Account esistente con credenziali diverse";
        break;
      case "weak-password":
        errorMessage = "La password deve avere almeno 6 caratteri";
        break;
      case "email-already-in-use":
        errorMessage = "Indirizzo e-mail già in uso";
        break;
      case "user-not-found":
        errorMessage = "Non esiste un utente con questa e-mail";
        break;
      case "wrong-password":
        errorMessage = "Password errata";
        break;
      case "user-disabled":
        errorMessage = "L'account con questa e-mail disabilitata";
        break;
      case "invalid-credential":
        errorMessage = "Credenziali non valide";
        break;
      default:
        errorMessage = "Errore sconosciuto";
    }
    return errorMessage;
  }
}
