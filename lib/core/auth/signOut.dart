import 'package:myfriendfaith/widgets/snackbars/state_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:myfriendfaith/core/routes/app_route.gr.dart';

Future<void> signOut(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    showStateSnackBar(context, 'I hope you will come back soon.', 'info');
    context.router.push(DashboardScreen(displayName: null));
  } catch (e) {
    showStateSnackBar(context, 'Unexpected error has occured', 'error');
  }
}
