String authErrorsString(String? code) {
  switch (code) {
    case 'INALID_CREDENTIALS':
      return 'Email e/ou senha invalidos';
    case 'Invalid session token':
      return 'Token inválido';
    default:
      return 'Um erro indefinido ocorreu ';
  }
}
