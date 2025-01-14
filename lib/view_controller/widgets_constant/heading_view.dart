import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class heading_text extends StatelessWidget {
   heading_text({
    super.key,
    this.text
  });
  String? text;

  @override
  Widget build(BuildContext context) {
    return Text(textAlign: TextAlign.start,text??"",style: Theme.of(context).textTheme.headlineSmall,);
  }
}