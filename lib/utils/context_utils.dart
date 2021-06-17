import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent/provider/auth_provider.dart';
import 'package:rent/provider/main_provider.dart';

extension ContextUtils on BuildContext {
  MainProvider _getMainProvider() =>
      Provider.of<MainProvider>(this, listen: false);
  AuthProvider _getAuthProvider() =>
      Provider.of<AuthProvider>(this, listen: false);
  showSnacbar(String msg) => ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Row(
            children: [Text(msg ?? "")],
          ),
        ),
      );
  pushTo(Widget to) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (ctx) => to));

  replaceTo(Widget to) => Navigator.of(this)
      .pushReplacement(MaterialPageRoute(builder: (ctx) => to));

  MainProvider get mainProvider => _getMainProvider();
  AuthProvider get autProvider => _getAuthProvider();
}
