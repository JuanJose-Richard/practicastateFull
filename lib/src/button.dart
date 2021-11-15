import 'package:flutter/material.dart';

class MyButton extends StatefulWidget{
  double resultado =0;
  double valor1 =0;
  double valor2=0;
  String mensaje='';
  bool validacion=false;
  String texto = '';
  int index=0;
  @override
  _MyButtonState createState()=>_MyButtonState();
}
class _MyButtonState extends State<MyButton>{

  final tfvaloruno = TextEditingController();
  final tfvalordos= TextEditingController();
  final tfresultado = TextEditingController();

  List<String> collections = ["flutter", "es", "maravilloso"];
  void validar(){
    setState(() {
      widget.validacion=false;
      if(tfvaloruno.text.toString()=="" || tfvalordos.text.toString()==""){
        widget.validacion=true;
        widget.mensaje = "Falta ingresar un dato";
        return;
      }
    });
  }
  void limpiar(){
    tfvaloruno.text="";
    tfvalordos.text="";
  }
  void calcularSuma(){
    setState(() {
      validar();
      widget.texto="Suma";
      widget.valor1 = double.parse(tfvaloruno.text);
      widget.valor2 = double.parse(tfvalordos.text);
      widget.resultado = (widget.valor1 +widget.valor2);
      limpiar();
      validar();
    });
  }
  void calcularResta(){
    setState(() {
      validar();
      widget.texto="Resta";
      widget.valor1 = double.parse(tfvaloruno.text);
      widget.valor2 = double.parse(tfvalordos.text);
      widget.resultado = (widget.valor1 -widget.valor2);
      limpiar();
      validar();
    });
  }
  void calcularproducto(){
    setState(() {
      validar();
      widget.texto="Producto";
      widget.valor1 = double.parse(tfvaloruno.text);
      widget.valor2 = double.parse(tfvalordos.text);
      widget.resultado = (widget.valor1 *widget.valor2);
      limpiar();
      validar();
    });
  }
  void calculardivision(){
    setState(() {
      validar();
      widget.texto="Division";
      widget.valor1 = double.parse(tfvaloruno.text);
      widget.valor2 = double.parse(tfvalordos.text);
      widget.resultado = (widget.valor1 /widget.valor2);
      limpiar();
      validar();
    });
  }
  FocusNode nodeUno = FocusNode();
  FocusNode nodeDos = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Practica 3"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text("Para calular completa los datos y da click en el boton que desea calcular"),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              children: <Widget> [
                TextField(
                  focusNode: nodeUno,
                  controller:tfvaloruno,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(hintText: "Ingresa el primer valor",
                    labelText: "Primer Valor",
                    errorText: tfvaloruno.text.toString()==""?widget.mensaje:null,
                  ),
                ),
                TextField(
                  focusNode: nodeDos,
                  controller:tfvalordos,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(hintText: "Ingresa el segundo valor",
                      labelText: "Segundo Valor",
                    errorText: tfvalordos.text.toString()==""?widget.mensaje:null,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                        color: Colors.amberAccent,
                        child: Text("Sumar",
                          style: TextStyle(fontSize: 18, fontFamily: "rbold"),
                        ),
                        onPressed: calcularSuma ),
                    RaisedButton(
                        color: Colors.amberAccent,
                        child: Text("Restar",
                          style: TextStyle(fontSize: 18, fontFamily: "rbold"),
                        ),
                        onPressed: calcularResta ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                        color: Colors.amberAccent,
                        child: Text("Multiplicar",
                          style: TextStyle(fontSize: 18, fontFamily: "rbold"),
                        ),
                        onPressed: calcularproducto),
                    RaisedButton(
                        color: Colors.amberAccent,
                        child: Text("Dividir",
                          style: TextStyle(fontSize: 18, fontFamily: "rbold"),
                        ),
                        onPressed: calculardivision),
                  ],
                ),

                Text("El resultado de su "+widget.texto +" es "+widget.resultado.toString()),
              ],
            ),
          )
        ],
      )
    );
  }

}