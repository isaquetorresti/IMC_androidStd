import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var keyForm = GlobalKey<FormState>();
  var weightController = TextEditingController();
  var heightController = TextEditingController();
  String result;

  void resultFields() {
    weightController.clear();
    heightController.clear();
    setState(() {
      result = "";
    });
  }

  void resetFields() {
    weightController.clear();
    heightController.clear();
    setState(() {
      result = "";
    });
  }

  @override
  void initState() {
    super.initState();
    resultFields();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Calculadora IMC"), actions: <Widget>[
          IconButton(
            onPressed: resetFields,
            icon: Icon(Icons.refresh),
          )
        ]),
        body: SingleChildScrollView(
        child: Form(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        buildTextFormField(
        controller: weightController,
        label: "Peso (kg)",
        error: "Peso obrigatório!"),
    buildTextFormField(
    controller: heightController,
    label: "Altura(cm)",
    error: "Altura obrigatória!"),
    Text(result),
    RaisedButton(
    child: Text("CALCULAR"),
    onPressed: (){
    keyForm.currentState.validate()){
    calculateIMC();
    }
    },
    /* )
          ]
              )
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Peso (kg)"),
              validator: (text) {
                return text.isEmpty ? "Peso obrigatório!" : null;
              },
            )
          ],
        ))));
  }
}
*/
    void calculateIMC()
    {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) /100.0;
    double imc = weight / (height * height);
    setState(() {
    result = imc.toStringsAsFixed(2);
    if (imc < 30.0){
      result += "\nSobrepeso";
    }
    });
    }
    Widget buildTextFormField(
    {TextEditingController controller, String label, String error}) {
    return TextFormField(
    controller: controller,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(labelText: label),
    validator: (text) {
    return text.isEmpty ? error : null;
    },
    );
    }
