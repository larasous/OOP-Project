import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp {
  String email;
  String password;
  String nome;
  String sobrenome;
  String cpf;
  String celular;
  String cep;
  String logradouro;
  String numero;
  String bairro;
  String complemento;
  String cidade;
  String estado;

  static Map<String, dynamic> userData;

  SignUp({
    this.email = '',
    this.password = '',
    this.nome = '',
    this.sobrenome = '',
    this.cpf = '',
    this.cep = '',
    this.logradouro = '',
    this.numero = '',
    this.bairro = '',
    this.complemento = '',
    this.cidade = '',
    this.estado = '',
  });
  SignUp signUp;

  static Future<User> registerUsingEmailPassword({
    String email,
    String password,
  }) async {
    Map<String, dynamic> userData = {
      "email": email,
    };
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      await user.reload();
      user = auth.currentUser;
      await firestore.collection("users").doc(user.uid).set(userData);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('Email em uso');
      }
    } catch (e) {
      print(e);
    }
    print(user);
    return user;
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;
  User user;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> addUser({
    String nome,
    String sobrenome,
    String cpf,
    String celular,
  }) async {
    Map<String, dynamic> userData = {
      "name": nome,
      "sobrenome": sobrenome,
      "cpf": cpf,
      "celular": celular,
    };

    user = auth.currentUser;
    await firestore.collection("users").doc(user.uid).update(userData);
    // print(userData);
    // return users
    //     .add(userData)
    //     .then((value) => print("Usuario adicionado"))
    //     .catchError((error) => print(error));
  }

  Future<void> addInfos(
      {String cep,
      String logradouro,
      String numero,
      String bairro,
      String complemento,
      String cidade,
      String estado}) async {
    userData = {
      "cep": cep,
      "logradouro": logradouro,
      "numero": numero,
      "bairro": bairro,
      "complemento": complemento,
      "cidade": cidade,
      "estado": estado,
    };
    user = auth.currentUser;
    await firestore.collection("users").doc(user.uid).update(userData);
    // return users
    //     .add(userData)
    //     .then((value) => print("Usuario adicionado"))
    //     .catchError((error) => print(error));
  }

  Future<void> addPetsitter({
    bool petsitter,
  }) async {
    userData = {"petsitter": petsitter};
    print(petsitter);
    user = auth.currentUser;
    await firestore.collection("users").doc(user.uid).update(userData);
    // return users
    //     .add(userData)
    //     .then((value) => print("Usuario adicionado"))
    //     .catchError((error) => print(error));
  }
}
