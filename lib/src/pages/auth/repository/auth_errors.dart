String authErrorsString(String? code) {
  switch (code) {
    case 'INALID_CREDENTIALS':
      return 'Email e/ou senha invalidos';
    default:
      return 'Um erro indefinido ocorreu ';
  }
}
