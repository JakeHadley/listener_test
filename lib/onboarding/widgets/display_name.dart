import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:listener_test/onboarding/widgets/next_back_footer.dart';

final _formKey = GlobalKey<FormBuilderState>();

enum FormFields {
  displayName,
}

PageViewModel getDisplayNamePage({
  required void Function(String displayName) nextAction,
  required void Function() backAction,
  required String initialDisplayName,
}) {
  return PageViewModel(
    title: 'Display Name',
    bodyWidget: Column(
      children: [
        const Text(
          'How do you want people to recognize you? '
          '(This can be updated later)',
          textAlign: TextAlign.center,
        ),
        FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                initialValue: initialDisplayName,
                name: FormFields.displayName.name,
                decoration: const InputDecoration(
                  labelText: 'Display Name',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.maxLength(
                    30,
                    errorText: 'Display name must be less than 30 characters',
                  ),
                ]),
                autocorrect: false,
                autovalidateMode: AutovalidateMode.always,
              ),
            ],
          ),
        ),
      ],
    ),
    decoration: const PageDecoration(
      footerFlex: 0,
      bodyAlignment: Alignment.center,
    ),
    footer: NextBackFooter(
      nextAction: () {
        _formKey.currentState?.saveAndValidate();
        if (_formKey.currentState?.value[FormFields.displayName.name] != null) {
          final displayName = _formKey
              .currentState?.value[FormFields.displayName.name]
              .toString();
          if (displayName != null) {
            nextAction(displayName);
          }
        }
      },
      backAction: backAction,
    ),
  );
}
