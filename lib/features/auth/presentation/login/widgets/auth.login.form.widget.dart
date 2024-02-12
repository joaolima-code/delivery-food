import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/core.navigator.util.dart';
import '../../../../../core/util/validators/core.util.validatorString.dart';
import '../../../../../shared/widgets/buttons/primary.button.widget.dart';
import '../../../../../shared/widgets/buttons/transparent.button.widget.dart';
import '../../../../../shared/widgets/forms/form.input.widget.dart';
import '../../register/auth.register.module.dart';
import '../cubit/auth.login.cubit.dart';

class AuthLoginFormWidget extends StatefulWidget {
  const AuthLoginFormWidget({super.key});

  @override
  State<AuthLoginFormWidget> createState() => _AuthLoginFormWidgetState();
}

class _AuthLoginFormWidgetState extends State<AuthLoginFormWidget> {
  late AuthLoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    cubit = context.watch<AuthLoginCubit>();

    return BlocBuilder<AuthLoginCubit, AuthLoginState>(
        builder: (BuildContext context, AuthLoginState state) {
      return Form(
          key: cubit.formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
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
                    text: 'Entrar',
                    isLoading: state is Loading,
                    onPressed: () {
                      final bool? isValidFields =
                          cubit.formKey.currentState?.validate();
                      if (isValidFields!) {
                        cubit.onSubmitted();
                      }
                    }),
                const SizedBox(height: 8),
                TransparentButtonWidget(
                    text: 'Cadastrar',
                    onPressed: () => CoreNavigatorUtil.instance.startPage(
                        context: context, route: AuthRegisterModule.route))
              ]));
    });
  }
}
