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

class SignOut extends AuthenticationEvent {}
