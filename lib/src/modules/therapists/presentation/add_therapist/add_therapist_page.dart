import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:psique_eleve/src/presentation/base/pages/base.page.dart';
import 'package:psique_eleve/src/presentation/helpers/ui_helper.dart';
import 'package:psique_eleve/src/presentation/routes.dart';
import 'package:psique_eleve/src/presentation/styles/app_border_radius.dart';
import 'package:psique_eleve/src/presentation/styles/app_border_side.dart';
import 'package:psique_eleve/src/presentation/styles/app_color_scheme.dart';
import 'package:psique_eleve/src/presentation/styles/app_spacing.dart';
import 'package:psique_eleve/src/presentation/widgets/app_button/app_button.dart';
import 'package:psique_eleve/src/presentation/widgets/app_text_field/app_text_field_widget.dart';
import 'package:psique_eleve/src/presentation/widgets/user_image/user_image_widget.dart';

import 'add_therapist_controller.dart';

class AddTherapistPage extends StatefulWidget {
  static Future<void> navigateTo() => Modular.to.pushNamed(kTherapistAddScreenRoute);

  const AddTherapistPage({Key? key}) : super(key: key);

  @override
  _AddTherapistPageState createState() => _AddTherapistPageState();
}

class _AddTherapistPageState extends BaseState<AddTherapistPage, AddTherapistController> {
  @override
  PreferredSizeWidget? appBar(BuildContext ctx) => AppBar(
        title: const Text('Adicionar terapeuta'),
      );

  @override
  Widget child(context, constrains) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Observer(builder: (_) {
          return UserImageWidget(
            imageUrl: controller.imageUrl.value,
            fullName: controller.fullName.value.value,
            onEdit: () {},
          );
        }),
        UIHelper.verticalSpaceS24,
        Observer(builder: (_) {
          return AppTextFieldWidget(
            title: 'Nome completo',
            onChanged: controller.onNameChanged,
            errorText: controller.fullName.value.error,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
          );
        }),
        UIHelper.verticalSpaceS12,
        Observer(builder: (_) {
          return AppTextFieldWidget(
            title: 'Email',
            onChanged: controller.onEmailChanged,
            errorText: controller.email.value.error,
            obscureText: true,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
          );
        }),
        UIHelper.verticalSpaceS12,
        Observer(builder: (_) {
          return AppTextFieldWidget(
            title: 'CPF',
            onChanged: controller.onCpfChanged,
            errorText: controller.cpf.value.error,
            obscureText: true,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
          );
        }),
        UIHelper.verticalSpaceS12,
        Observer(builder: (_) {
          return AppTextFieldWidget(
            title: 'Telefone',
            onChanged: controller.onCellphoneChanged,
            errorText: controller.cellphone.value.error,
            obscureText: true,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => controller.onTapCreateEdit(),
          );
        }),
        UIHelper.verticalSpaceS12,
        Observer(builder: (_) {
          final address = controller.address.value;
          if (address == null) return const SizedBox.shrink();
          return Container(
              decoration: BoxDecoration(
                borderRadius: AppBorderRadius.medium,
                border: Border.all(
                  color: AppColorScheme.border,
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.all(AppSpacing.s20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(address.street),
                      Text(address.number),
                      Text(address.zipCode),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(address.complement),
                      Text(address.district),
                      Text(address.city + ' - ' + address.state),
                    ],
                  ),
                ],
              ));
        }),
        UIHelper.verticalSpaceS32,
        AppButton(
          onPressed: controller.onTapCreateEdit,
          title: 'Criar',
          style: AppButtonStyle.filled,
        ),
        UIHelper.verticalSpaceS32,
      ],
    );
  }
}