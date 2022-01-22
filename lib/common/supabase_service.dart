import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase/supabase.dart' as supa;

class SupaConstants {
  SupaConstants._();

  /// Jobs and applicants tables are with stage environment
  static const supabaseUrlStage = 'https://nquwrxpqaiohypvambqs.supabase.co';
  static const supabaseKeyStage =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzNDI5NDc0OSwiZXhwIjoxOTQ5ODcwNzQ5fQ.78qQYcAGImoc5oAxZC9WMs5DGDYMVjsCWb8qYMhNFUA';

  /// dev environment
  static const supabaseUrl = 'https://llmgbaqnpnyotdvatiyc.supabase.co';
  static const supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzNDI5NDU2OCwiZXhwIjoxOTQ5ODcwNTY4fQ.26pposp1lLkzEowJ3qVVoSAfZAFKRJO9hzPLYKbp9yY';
}

// class OnboardingOperation {
//   OnboardingOperation._();

//   static void updateOnboarding(
//       dynamic uploadString, String field, bool changeRoute, context) async {
//     String mobile =
//         Provider.of<ExamEvaluateModal>(context, listen: false).mobile;

//     final client = supa.SupabaseClient(
//         SupaConstants.supabaseUrl, SupaConstants.supabaseKey);

//     final updateResponse = await client
//         .from("onboarding")
//         .update({field: uploadString})
//         .eq('mobile', mobile)
//         .execute();

//     if (updateResponse.error == null) {
//       if (changeRoute) {
//         Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(builder: (context) => HomeScreen()),
//             (route) => false);

//         // Navigator.of(context).pop();
//       } else {}
//       print("Able to successfully update");
//     } else {
//       print("Unable to update");
//     }
//   }
// }
