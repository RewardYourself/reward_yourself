import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MoneyWidget extends StatelessWidget {
  const MoneyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("wallets")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/money.png'),
              Text(
                snapshot.data!.get("amount").toInt().toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MavenPro',
                  fontSize: 14,
                  color: Color(0xFFFDA951),
                ),
              ),
            ],
          );
        });
  }
}
