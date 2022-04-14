import 'package:psique_eleve/src/modules/auth/data/mappers/role_mapper.dart';
import 'package:psique_eleve/src/modules/auth/domain/entities/role_entity.dart';
import 'package:psique_eleve/src/modules/auth/domain/entities/user_entity.dart';

import 'address_mapper.dart';

extension UserMapper on UserEntity {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'cpf': cpf,
      'cellphone': cellphone,
      'address': [address?.toMap()],
      'role_user': roles.map((e) => e.toMap()),
    };
  }

  static UserEntity? fromMap(Map map) {
    if (map.isEmpty) return null;
    return UserEntity(
      id: map['id'] ?? '',
      fullName: map['full_name'] ?? '',
      email: map['email'] ?? '',
      cpf: map['cpf'] ?? '',
      cellphone: map['cellphone'] ?? '',
      address:
          AddressMapper.fromMap(map['address'] is List ? Map.from(map['address'][0] ?? {}) : {}),
      roles: map['role_user'] is List
          ? (map['role_user'] as List)
              .map<RoleEntity>((e) => RoleMapper.fromMap(Map.from(e ?? {})))
              .toList()
          : [],
    );
  }
}