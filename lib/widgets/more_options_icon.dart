import 'package:flutter/material.dart';

class MoreOptionIconButton extends StatefulWidget{
  const MoreOptionIconButton({super.key});


  @override
  State<MoreOptionIconButton> createState() => _MoreOptionIconButtonState();
}

class _MoreOptionIconButtonState extends State<MoreOptionIconButton> {
  @override
  Widget build(BuildContext context) {
   return IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert));
  }
}