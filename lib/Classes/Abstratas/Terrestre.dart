import 'package:vaquinha/Enums/Cenarios.dart';
import 'package:vaquinha/Classes/Abstratas/Animal.dart';
import 'package:vaquinha/Interfaces/ICenario.dart';

abstract class Terrestre extends Animal implements ICenario {

  Cenarios cenarioFavoravel = Cenarios.terra;
  
  Terrestre({
    required super.nome, 
    required super.pontosDeVida, 
    required super.cor,
    });

  @override
  bool verificaSeCenarioEhFavoravel(Cenarios cenarioDaBatalha) {
    if (cenarioDaBatalha == cenarioFavoravel) {
      return true;
    }

    return false;
  }
  
}