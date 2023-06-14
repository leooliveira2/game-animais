import 'package:vaquinha/Enums/Cenarios.dart';

abstract class ICenario {
  bool verificaSeCenarioEhFavoravel(Cenarios cenarioDaBatalha);
}