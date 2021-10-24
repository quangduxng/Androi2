import'package:flutter/material.dart';


class Myapp5 extends StatelessWidget {
  const Myapp5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:FormBasic(),
    );
  }
}


class FormBasic extends StatefulWidget {
  const FormBasic({Key? key}) : super(key: key);

  @override
  _FormBasicState createState() => _FormBasicState();
}

class _FormBasicState extends State<FormBasic> {

  var fkey = GlobalKey<FormState>();
  var txtTenDangNhap = TextEditingController();
  var txtMatKhau = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: fkey,
        child :Column(
          children: [
            SizedBox(height: 50,),
            Text("Đăng Nhập Hệ Thống",style:TextStyle(fontSize: 35,color:Colors.orange )),
            TextFormField(
              controller: txtTenDangNhap,
              validator: (value){
                if(value==null||value.isEmpty)
                  return "Vui Lòng nhập tên đăng nhập";
                else
                    return null;

              },
              decoration: InputDecoration(
              icon:Icon(Icons.person),
              hintText: "Nhập Tên Đăng Nhập",
               labelText: "Tên Đăng Nhập(*)",
          ),

            ),
            TextFormField(
              controller: txtMatKhau,
              validator: (value){
                if(value==null||value.isEmpty)
                  return "Vui Lòng nhập mật khẩu";
                else if (value.length<6)
                  return "Mật khẩu phải ít nhất là 6 ký tự";
                else
                  return null;
              },
                decoration: InputDecoration(
                    icon:Icon(Icons.lock_open),
                  hintText: "Nhập Mật Khẩu",
                  labelText: "Mật Khẩu(*)",
                ),

            ),
            ElevatedButton(
                onPressed: (){
                  if(fkey.currentState!.validate()){
                    var tenDangNhap=txtTenDangNhap.text;
                    var matKhau=txtMatKhau.text;
                    showDialog(context: context, builder: (centext){
                     return AlertDialog(
                      content: Text("Tên Đăng Nhập : ${tenDangNhap},Mật khẩu : ${matKhau}"),
                     );

                    });
                    print("OKE,All pass");
                  }
                  else
                    print("Not pass");


                },
                child: Text("Đăng Nhập"),
            ),
          ],
        ),


      ),
    );
  }
}

