
class User {
  final String id;
  final String email;
  final String password ;
  final String Nom ;
  final String Prenom ;
  final String token ;


  const User({
    this.id = '' ,
    this.email = '',
    this.password = '',
    this.Nom = '',
    this.Prenom = '',
    this.token = '',
  });

  User copy({
   required int id,
   required String email,
   required String password,
   required String Nom,
   required String Prenom,
   required String token ,
  }) =>
      User(
        email: email,
        password: password ,
        Nom: Nom ,
        Prenom: Prenom ,
        token: token ,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        password: json['password'],
        Nom: json['Nom'],
        Prenom: json['Prenom'],
        token: json['token']


      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
        'Nom': Nom,
        'Prenom': Prenom,
        'token' :token,
      };

  @override
  String toString() => 'User{id: $id, email: $email}';
}