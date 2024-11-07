import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(255, 255, 255, 1)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'App Teste 01'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool hidePassword = true;

  var maskFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##', 
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      // appBar: AppBar(
      //   backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      //   title: Text(widget.title),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            SizedBox(height: 50.0),
            SvgPicture.asset(
            'assets/images/icone-mochila.svg', 
            width: 200.0,
            height: 200.0,
            ),
            SizedBox(height: 30.0),
            SvgPicture.asset(
            'assets/images/componente-barra.svg', 
            width: 350.0,
            height: 10.0,
            ),
            SizedBox(
              width: 350,
              child: TextFormField(
              maxLength: 14,
              inputFormatters: [maskFormatter],
              validator: (input) => input!.length < 14
              ? "Cpf formato incorreto!"
              :null,
              obscureText: false,
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                    color: const Color.fromRGBO(22, 78, 99, 1),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                    color: const Color.fromRGBO(22, 78, 99, 1),
                  ),
                ),
                labelText: "CPF do estudante",
                prefixIcon: Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
                ),
                hintText: 'Digite aqui seu CPF',
              ),
              keyboardType: TextInputType.number,
            ),),
            SizedBox(height: 5.0),
            SizedBox(
              width: 350,
              child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                    color: const Color.fromRGBO(22, 78, 99, 1),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                    color: const Color.fromRGBO(22, 78, 99, 1),
                  ),
                ),
                labelText: "SENHA",
                prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              suffixIcon: IconButton(
                onPressed:(){
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: const Color.fromRGBO(22, 78, 99, 1),
                icon: Icon (hidePassword? Icons.visibility_off: Icons.visibility)
                //icon: Icon (Icons.visibility)
              ),
              hintText: 'Digite sua Senha',
              ),
            ),),
            SizedBox(height: 20.0),
            SizedBox(
              width: 350,
              child: FilledButton.tonal(
              onPressed: () => {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(const Color.fromRGBO(22, 78, 99, 1),), 
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color:  const Color.fromRGBO(22, 78, 99, 1),),
                  ),
                ),
              ), 
              child: const Text('Acessar >', style: TextStyle(color: Colors.white),),
              ), 
            ),
           SizedBox(height: 10.0),
           SizedBox(
            width: 350,
             child: Image.asset(
                 'assets/images/logo-seduc.png', 
              ),
           )
      
          ],
          
          ),
        ),
      ),
    );
  }
}
