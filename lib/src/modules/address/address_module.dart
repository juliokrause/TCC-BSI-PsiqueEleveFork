import 'package:flutter_modular/flutter_modular.dart';
import 'package:psique_eleve/src/modules/address/presentation/address_controller.dart';
import 'package:psique_eleve/src/modules/address/presentation/address_page.dart';

class AddressModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AddressController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const AddressPage(),
    ),
  ];
}
