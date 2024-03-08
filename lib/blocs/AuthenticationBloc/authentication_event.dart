abstract class AuthenticationEvent {
  const AuthenticationEvent();
  List<Object> get props => [];
}

class CreateUser extends AuthenticationEvent {
  final String email;
  final String password;
  final String name;
  final String sdt;
  final String address;

  const CreateUser({
    required this.email,
    required this.password,
    required this.name,
    required this.sdt,
    required this.address,
  });

  @override
  List<Object> get props => [email, password, name, sdt, address];
}

class SignIn extends AuthenticationEvent {
  final String email;
  final String password;
  const SignIn({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignOut extends AuthenticationEvent {}
