import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class FormError extends StatelessWidget {
  final List<String> errors;
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
          children: List.generate(
        errors.length,
        (index) => Padding(
          padding: const EdgeInsets.only(top: 8),
          child: buildFormError(error: errors[index]),
        ),
      )),
    );
  }

  Row buildFormError({String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Error.svg',
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(18),
        ),
        SizedBox(width: getProportionateScreenWidth(10)),
        Text(
          error,
          style: TextStyle(color: Colors.red),
        )
      ],
    );
  }
}
