import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  final bool passwordInvisible = true;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String title;

  const LoginCard({
    this.emailController,
    this.passwordController,
    this.title,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(color: Colors.black12, offset: Offset(0.0, 15.0), blurRadius: 15.0),
          BoxShadow(color: Colors.black12, offset: Offset(0.0, -10.0), blurRadius: 10.0),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: const TextStyle(fontSize: 45, fontFamily: "Poppins-Bold", letterSpacing: .6)),
            const SizedBox(
              height: 30,
            ),
            const Text("البريد الالكتروني", style: TextStyle(fontFamily: "Poppins", fontSize: 26)),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Example@site.domin",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("كلمة المرور", style: TextStyle(fontFamily: "Poppins", fontSize: 26)),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordInvisible ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  hintText: "**********",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
