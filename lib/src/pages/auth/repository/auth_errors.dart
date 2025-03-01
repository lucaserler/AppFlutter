String authErrorsString(String? code) {
  switch (code) {
    case 'INALID_CREDENTIALS':
      return 'Email e/ou senha invalidos';
    case 'Invalid session token':
      return 'Token inválido';
    case 'INVALID_FULLNAME':
      return 'Ocorreu um erro ao cadastrar o nome de usuário!';
    case 'INVALID_PHONE':
      return 'Ocorreu um erro ao cadastrar celular!';
    case 'INVALID_CPF':
      return 'Ocorreu um erro ao salvar o CPF do usuário';

    default:
      return 'Um erro indefinido ocorreu ';
  }
}
