import 'package:flutter/material.dart';
import 'package:landing_page/utility/app_assets.dart';
import 'package:landing_page/utility/app_colors.dart';
import 'package:landing_page/utility/app_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
                AppAssets.bg,
                fit: BoxFit.cover,
            ).image,
          )
        ),
        child: Column(
          children: [
            _headerWidget(),
            _bodyWidget(),
          ],
        ),
      ),
    );
  }
}
class _headerWidget extends StatelessWidget {
  const _headerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _logoWidget(),
          _menuWidget(), // menu
          _btnWidget(),
        ],
      ),
    );
  }
}


Widget _logoWidget() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        AppAssets.logo,
        height: 40,
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        "Escola Almeida Santos",
        style: TextStyle(fontFamily: AppString.fontbold, fontSize: 25),
      ),
    ],
  );
}

Widget _menuWidget() {
  return Row(
    children: [
      _menuItemWidget(text: "Início"),
      _menuItemWidget(text: "Sobre"),
      _menuItemWidget(text: "Contato"),
      _menuItemWidget(text: "Infos"),
    ],
  );
}

Widget _menuItemWidget({required String text}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(text,
          style: TextStyle(fontSize: 24, fontFamily: AppString.fontLight)));
}

Widget _btnWidget() {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor:
      MaterialStateProperty.all(AppColors.btnColor),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 25,
        ),
      ),
    ),
  onPressed: () {  },
  child: Text("Entrar", style: TextStyle(fontSize: 22, fontFamily: AppString.fontMedium),
  ),
  );
}

Widget _bodyWidget() {
  return Container(
    padding: const EdgeInsets.only(left:40),
    child: Column(
      children: [
        _mainContainWidget(),
        _bottomListWidget(),
      ],
    ),
  );
}
Widget _mainContainWidget(){
  return Container(
    padding: const EdgeInsets.all(10),
    child: Row(
      children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Painel de \nAdministrador!",
                  style: TextStyle(
                      fontSize: 70,
                      fontFamily: AppString.fontbold,
                  ),
                ),
                SizedBox(height: 10),
                Text("Acesse o seu painel de administrador!",
                  style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppString.fontLight,
                ),
                ),
                Container(
                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.btnColor,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Acessar  ",
                        style: TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.white,
                        ),
                        child: Icon(
                        Icons.play_arrow,
                        color: AppColors.btnColor,
                      ),),
                    ],
                  ),
                )
              ],
            ),
          ),
        Expanded(child: Image.asset(AppAssets.group)),
    ],
    ),
  );
}
Widget _bottomListWidget() {
  return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      _listTile(text:"Editar turmas",image:AppAssets.editarTurmas, isLike: true),
      _listTile(text:"Editar turmas",image:AppAssets.editarTurmas),
      _listTile(text:"Editar turmas",image:AppAssets.editarTurmas),
      _listTile(text:"Editar turmas",image:AppAssets.editarTurmas),
  ],
  );
}
  Widget _listTile({required String text, required String image, bool isLike = false}){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Stack(
        children: [
          Positioned(
            child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                  shape: BoxShape.rectangle,
                  color: Colors.white.withOpacity(0.5),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Colors.white24,
                      blurRadius: 5.0,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(image, height: 150, width: 200, fit: BoxFit.contain,),
                  Text(text),
                ],
              ),
              ),
          ),
          Positioned(
          top: 10,
          right: 10,
          child: Container(
          alignment: Alignment.topRight,
          child: Image.asset(
          isLike ? AppAssets.likeIcon : AppAssets.dislikeIcon,
          height: isLike ? 40 : 20,
          width: isLike ? 40 : 20,
          ),
          ),
          ),
           ],
          )
    );
  }
