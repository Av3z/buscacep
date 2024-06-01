import 'package:buscacep/src/controllers/home_controller.dart';
import 'package:buscacep/src/models/cep_model.dart';
import 'package:buscacep/src/widgets/custom_text_field.dart';
import 'package:buscacep/src/widgets/logo.dart';
import 'package:buscacep/src/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Logo(),

          const SizedBox(
            height: 60,
          ),

          CustomTextField(controller: _homeController.cepController),

          const SizedBox(
            height: 40,
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: ValueListenableBuilder<bool>(
            valueListenable: _homeController.loadingNotifier, 
            builder: (context, loading, _) {
              return PrimaryButton(
                isLoading: loading, 
                onPressed: _homeController.onPressed, 
                text: 'Buscar',);
            },),
          ),
          const SizedBox(
            height: 40,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder<CEPModel>(
                valueListenable: _homeController.cepModelNotifier, 
                builder: (context, cep, _) {
                  return Text(cep.localidade ?? '',
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18));
              },),
              const SizedBox(
                width: 5,
              ),

              ValueListenableBuilder<CEPModel>(
                valueListenable: _homeController.cepModelNotifier, 
                builder: (context, cep, _) {
                  return Text(cep.uf ?? '',
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18));
                },),
            ],
          ),

          ValueListenableBuilder<CEPModel>(valueListenable: _homeController.cepModelNotifier, builder: (context, cep, _) {
            return Text(
              cep.logradouro ?? '',
              style: TextStyle(color: Colors.grey[900]),
          );
          },),

          ValueListenableBuilder<CEPModel>(valueListenable: _homeController.cepModelNotifier, builder: (context, cep, _) {
            return Text(cep.bairro ?? '', style: TextStyle(color: Colors.grey[900]));
          },),

          ValueListenableBuilder<bool>(valueListenable: _homeController.loadingNotifier, builder: (context, loading, _) {
            return loading ? const CircularProgressIndicator() : Container();
          },)
          
        ]),
      ),
    );
  }
}
