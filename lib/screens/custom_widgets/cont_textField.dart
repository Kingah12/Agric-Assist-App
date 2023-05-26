import 'package:flutter/material.dart';

class contTextField extends StatefulWidget {
  final String text1, text2;
  final Function()? onTapObscure;
  final TextEditingController contr;
  final IconData? icon;
  final bool obscure;
  final VoidCallback? onChanged;

  const contTextField({
    required this.obscure,
    required this.contr,
    required this.text1,
    required this.text2,
    this.icon,
    this.onChanged,
    required this.onTapObscure,
    Key? key,
  }) : super(key: key);

  @override
  State<contTextField> createState() => _contTextFieldState();
}

class _contTextFieldState extends State<contTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.text1}',
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        TextField(
          // autofocus: true,
          onChanged: (String? text) {
            setState(() {
              widget.contr.text = text!;
              widget.contr.selection =
                  TextSelection.collapsed(offset: widget.contr.text.length);
            });
          },
          controller: widget.contr,
          obscureText: widget.obscure,
          style: TextStyle(color: Colors.black, fontSize: 14),
          decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: widget.onTapObscure,
                child: Icon(
                  widget.icon,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
              hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w400),
              hintText: '  ${widget.text2}',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              filled: true,
              fillColor: Colors.grey.shade200),
        ),
        const SizedBox(height: 2),
        const Divider(
          indent: 20,
          color: Colors.black54,
        ),
      ],
    );
  }
}
