import 'package:aic_lll/core/themes/design_system.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String title;
  final String hint;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller; // Adiciona o controlador

  const CustomTextfield({
    super.key,
    required this.title,
    required this.hint,
    this.validator,
    this.controller, // Permite passar o controlador como parâmetro
  });

  @override
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: DesignSystemColors.titleTextfield,
          ),
        ),
        SizedBox(
          width: 323,
          height: 55,
          child: TextFormField(
            controller: widget.controller, // Utiliza o controlador passado
            obscureText: widget.title.contains("Senha") ? _isObscured : false,
            validator: widget.validator,
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                fontSize: 18,
                color: DesignSystemColors.textfieldInactiveColor,
              ),
              hintText: "Digite ${widget.hint}",
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: DesignSystemColors.textfieldInactiveColor,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: DesignSystemColors.secundaryBlue,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: widget.title.contains("Senha")
                  ? IconButton(
                      icon: Icon(
                        _isObscured
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                        color: DesignSystemColors.primaryBlue,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
