import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/validators/core.util.validatorString.dart';
import '../../../../shared/widgets/buttons/primary.button.widget.dart';
import '../../../../shared/widgets/forms/form.input.widget.dart';
import '../cubit/auth.register.cubit.dart';

class AuthRegisterFormWidget extends StatefulWidget {
  const AuthRegisterFormWidget({super.key});

  @override
  State<AuthRegisterFormWidget> createState() => _AuthRegisterFormWidgetState();
}

class _AuthRegisterFormWidgetState extends State<AuthRegisterFormWidget> {
  late AuthRegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    cubit = context.watch<AuthRegisterCubit>();

    return BlocBuilder<AuthRegisterCubit, AuthRegisterState>(
        builder: (BuildContext context, AuthRegisterState state) {
      return Form(
          key: cubit.formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FormInputWidget(
                    label: 'Nome',
                    hintText: 'Joao Klebin',
                    textEditingController: cubit.nameController,
                    textInputType: TextInputType.emailAddress,
                    validator: (String? text) {
                      final bool? isEmpty = text?.trim().isEmpty;
                      if (isEmpty!) {
                        return 'Preencha o nome';
                      }
                      return null;
                    }),
                const SizedBox(height: 16),
                FormInputWidget(
                    label: 'Email',
                    hintText: 'email@email.com.br',
                    textEditingController: cubit.emailController,
                    textInputType: TextInputType.emailAddress,
                    validator: (String? text) {
                      final bool? isInvalidEmail = text?.trim().isInvalidEmail;
                      final bool? isEmpty = text?.trim().isEmpty;
                      if (isEmpty!) {
                        return 'Preencha o email! Por favor';
                      } else if (isInvalidEmail!) {
                        return 'O email está incorreto';
                      }
                      return null;
                    }),
                const SizedBox(height: 16),
                FormInputWidget(
                    label: 'Senha',
                    hintText: '********',
                    textEditingController: cubit.passwordController,
                    textInputType: TextInputType.text,
                    suffixVisibleText: true,
                    validator: (String? text) {
                      final bool? isInvalidPassword =
                          text?.trim().isValidPassword;
                      final bool? isEmpty = text?.trim().isEmpty;

                      if (isEmpty!) {
                        return 'A senha precisa ser preenchida';
                      } else if (isInvalidPassword!) {
                        return 'A senha está incorreta ou tem menos que 8 caracteres';
                      }
                      return null;
                    }),
                const SizedBox(height: 16),
                PrimaryButtonWidget(
                    text: 'Cadastrar',
                    isLoading: state is Loading,
                    onPressed: () {})
              ]));
    });
  }
}
