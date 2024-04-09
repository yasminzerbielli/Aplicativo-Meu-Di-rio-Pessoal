import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    home: PaginaLogin(),
    debugShowCheckedModeBanner: false,
    localizationsDelegates: [
      GlobalWidgetsLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
    ],
    supportedLocales: [
      Locale("pt", "BR")
    ],
  ));
}

class PaginaLogin extends StatelessWidget {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 13, 34, 28).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    controller: loginController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle_outlined),
                      hintText: 'Login',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    controller: senhaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'Senha',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 25.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        String login = loginController.text;
                        String senha = senhaController.text;
                        if (login == 'yasmin' && senha == 'yas2024') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PaginaInicial()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Você digitou o login ou a senha incorretamente, tente novamente.',
                              ),
                              backgroundColor: Color.fromRGBO(116, 46, 46, 1),
                              action: SnackBarAction(
                                label: 'Fechar',
                                textColor: Colors.white,
                                onPressed: () {
                                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                },
                              ),
                            ),
                          );
                        }
                      },
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(142, 193, 180, 1),
                        minimumSize: Size(50, 50),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  List<Cards> listaitens = [];

  void DeletaItemLista(int index) {
    setState(() {
      listaitens.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    int gridCount = MediaQuery.of(context).size.width > 800 ? 4 : 2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(88, 154, 140, 1),
        title: Text('Meu Diário Pessoal'),
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: listaitens.length,
          padding: const EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: ((context, index) {
            listaitens[index].ondelete = () => DeletaItemLista(index);
            return listaitens[index];
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaginaCadastro(),
            ),
          ).then((novoItem) {
            setState(() {
              if (novoItem != null) {
                listaitens.add(novoItem);
              }
            });
          });
        },
        backgroundColor: Color.fromRGBO(88, 154, 140, 1),
        child: Icon(Icons.add),
      ),
    );
  }
}

class PaginaCadastro extends StatefulWidget {
  @override
  _PaginaCadastroState createState() => _PaginaCadastroState();
}

class _PaginaCadastroState extends State<PaginaCadastro> {
  String? datapt = '';
  late Color selectedColor = Color.fromARGB(255, 151, 206, 197); // Cor selecionada inicialmente
  final TextEditingController textoController = TextEditingController();
  final TextEditingController tituloController = TextEditingController();

  List<Color> cores = [
    Color.fromARGB(255, 0, 148, 67),
    Color.fromARGB(255, 54, 244, 139),
    Color.fromRGBO(88, 154, 140, 1),
    Color.fromRGBO(37, 91, 74, 1),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(88, 154, 140, 1),
        title: Text('Página de Cadastro'),
      ),
      body: SingleChildScrollView(
        
        child: 
        Column(
          children: [
            Image.asset('assets\\images\\livro.png', width: 250,),
            Container(
              margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
              child: TextField(
                controller: tituloController,
                decoration: InputDecoration(
                  hintText: "Digite um título (obrigatório)",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
              child: TextField(
                controller: textoController,
                decoration: InputDecoration(
                  hintText: "Digite seu texto",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Wrap(
                spacing: 8.0,
                children: cores.map((color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = color;
                      });
                    },
        child: Container(
          width: 30, // Altere o tamanho conforme necessário
          height: 30, // Altere o tamanho conforme necessário
          decoration: BoxDecoration(
            color: color,
            border: selectedColor == color
                ? Border.all(width: 2, color: Colors.black)
                : null,
            borderRadius: BorderRadius.circular(15), // Metade do tamanho do width e height
          ),
        ),
      );
    }).toList(),
  ),
),

            Container(
              child: IconButton(
                icon: Icon(Icons.date_range),
                onPressed: () async {
                  final data = await showDatePicker(
                  
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2050),
                    locale: Locale("pt", "BR"),
                  );
                  if (data != null) {
                    setState(() {
                      datapt = DateFormat.yMMMMd("pt_BR").format(data);
                    });
                  }
                },
              ),
            ),
            SizedBox(width: 8),
            Text('Selecione a data desejada',
             style: TextStyle(fontSize: 16)),
           
            Container(
              margin: EdgeInsets.all(25),
              child: ElevatedButton(
              onPressed: () {
                if (tituloController.text.isNotEmpty &&
                    textoController.text.isNotEmpty &&
                    datapt != null) {
                  debugPrint("Valor titulo: ${tituloController.text}");
                  debugPrint("Valor data: $datapt");
                  debugPrint("Valor texto: ${textoController.text}");

                  Cards conteudo = Cards(
                    titulo: tituloController.text,
                    texto: textoController.text,
                    data: datapt!,
                    cor: selectedColor,
                    ondelete: () {},
                  );
                  Navigator.pop(context, conteudo);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Por favor, preencha todos os campos.'),
                      backgroundColor: Color.fromRGBO(116, 46, 46, 1),
                      action: SnackBarAction(
                        label: 'Fechar',
                        textColor: Colors.white,
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ),
                  );
                }
              },
              child: const Text('Salvar'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(142, 193, 180, 1),
                minimumSize: Size(300, 50),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  late String titulo;
  late String texto;
  late String data;
  late Color cor; // Adicionando cor como um parâmetro
  late VoidCallback ondelete;

  Cards({
    required this.titulo,
    required this.texto,
    required this.data,
    required this.cor, 
    required this.ondelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(8), 
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1, 
            blurRadius: 4, 
            offset: Offset(0, 2), 
          ),
        ],
      ),
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.all(4), 
      child: ListView(
  
        children: [
          Text(
            titulo,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16, 
              color: Colors.white
            ),
          ),
          SizedBox(height: 4), 
          Text(
            texto,
            style: TextStyle(
              fontSize: 14, 
              color: Colors.white
            ),
          ),
          SizedBox(height: 4), 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data,
                style: TextStyle(
                  fontSize: 12, // Reduzindo o tamanho da data
                  fontStyle: FontStyle.italic,
                  color: Colors.white
                ),
              ),
              IconButton(
                onPressed: ondelete,
                icon: Icon(Icons.delete),
                color: Colors.white
              ),
            ],
          ),
        ],
      ),
    );
  }
}

