import 'package:psique_eleve/src/presentation/base/controller/base.store.dart';
import 'package:psique_eleve/src/presentation/base/controller/value_state.store.dart';
import 'package:mobx/mobx.dart';

part 'therapists_controller.g.dart';

class TherapistsController = _TherapistsControllerBase with _$TherapistsController;

abstract class _TherapistsControllerBase extends BaseStore with Store {
  final counter = ValueState(0);

  @override
  Iterable<ValueState> get getStates => [counter];
}
