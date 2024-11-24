import 'package:aic_lll/core/themes/design_system.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String title;
  final String hint;

  const CustomTextfield({
    super.key,
    required this.title,
    required this.hint,
  });

  @override
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool _isObscured = true; // Controla se o texto está oculto ou visível

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
          child: TextField(
            obscureText: _isObscured, // Aplica a ocultação do texto
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
                ), // Borda quando habilitado
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: widget.title.contains("Senha")
                  ? IconButton(
                      icon: Icon(
                        _isObscured
                            ? Icons.remove_red_eye // Ícone de olho contornado
                            : Icons
                                .visibility_off, // Ícone de olho com preenchimento
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
