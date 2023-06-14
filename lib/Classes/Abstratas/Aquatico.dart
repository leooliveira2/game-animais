import 'package:vaquinha/Enums/Cenarios.dart';
import 'package:vaquinha/Classes/Abstratas/Animal.dart';
import 'package:vaquinha/Interfaces/ICenario.dart';

abstract class Aquatico extends Animal implements ICenario {

  Cenarios cenarioFavoravel = Cenarios.agua;
  
  Aquatico({
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