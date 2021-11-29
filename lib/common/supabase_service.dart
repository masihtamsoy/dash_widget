import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase/supabase.dart' as supa;

class SupaConstants {
  SupaConstants._();

  static const supabaseUrl = 'https://nquwrxpqaiohypvambqs.supabase.co';

  static const supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzNDI5NDc0OSwiZXhwIjoxOTQ5ODcwNzQ5fQ.78qQYcAGImoc5oAxZC9WMs5DGDYMVjsCWb8qYMhNFUA';
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
