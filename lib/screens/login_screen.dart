import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/models/user_model.dart';
import 'package:loja_virtual_flutter/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignupScreen()),
              );
            },
            child: Text(
              'CRIAR CONTA',
              style: TextStyle(fontSize: 16.0),
            ),
            textColor: Colors.white,
          )
        ],
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator());

          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  // ignore: missing_return
                  validator: (text) {
                    if (text.isEmpty || !text.contains('@'))
                      return 'E-mail inválido';
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Senha',
                  ),
                  obscureText: true,
                  validator: (text) {
                    if (text.isEmpty || text.length < 6) return 'Senha inválida';
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Esqueci minha senha',
                      textAlign: TextAlign.right,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {}

                      model.singIn();
                    },
                    child: Text(
                      'Entrar',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
