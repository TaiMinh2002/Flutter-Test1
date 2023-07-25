// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:test1/common/const.dart';
import 'package:test1/component/items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> choices = [
    'Kéo',
    'Búa',
    'Bao'
  ]; //tao list choices keo = 0, bua = 1, bao = 2
  String userChoice = '';
  String botChoice = '';
  int userScore = 0;
  int botScore = 0;
  bool showImage = true;

  void playGame(int userChoiceIndex) {
    setState(() {
      userChoice = choices[userChoiceIndex]; // luu urserchoice
      int botChoiceIndex = Random().nextInt(3); //bot random
      botChoice = choices[botChoiceIndex]; //luu botchoice

      if ((userChoiceIndex == 0 && botChoiceIndex == 2) ||
          (userChoiceIndex == 1 && botChoiceIndex == 0) ||
          (userChoiceIndex == 2 && botChoiceIndex == 1)) {
        userScore++; // user win
      } else if (userChoiceIndex == botChoiceIndex) {
        // hoa
      } else {
        botScore++; // bot win
      }
      showImage = false; // mac dinh ban dau chua chon anh
    });
  }

  String getChoiceImage(String choice) {
    switch (choice) {
      case 'Kéo':
        return AssetsImage.keo;
      case 'Búa':
        return AssetsImage.bua;
      case 'Bao':
        return AssetsImage.bao;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //danh cho bot
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              height: MediaQuery.of(context).size.height * 0.45,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // add score vao diem win = score, loss = diem doi thu
                      Text(
                        'Score: $botScore',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Win: $botScore',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Loss: $userScore',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  //chua chon thi container rong chon thi hien anh chon
                  Expanded(
                    child: showImage
                        ? Container()
                        : Image.asset(
                            getChoiceImage(botChoice),
                            width: 80,
                            height: 80,
                          ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => playGame(0), // chon keo
                        child: Image.asset(
                          AssetsImage.keo,
                          width: 80,
                          height: 80,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => playGame(1), // chọn bua
                        child: Image.asset(
                          AssetsImage.bua,
                          width: 80,
                          height: 80,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => playGame(2), // chon bao
                        child: Image.asset(
                          AssetsImage.bao,
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Items(
            //   score: botScore,
            //   win_score: botScore,
            //   loss_score: userScore,
            //   choice: botChoice,
            // ),
            const SizedBox(height: 10),

            // Items(
            //   score: userScore,
            //   win_score: userScore,
            //   loss_score: botScore,
            //   choice: userChoice,
            // )

            //danh cho user
            Container(
              margin: const EdgeInsets.only(top: 15),
              height: MediaQuery.of(context).size.height * 0.45,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Score: $userScore',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Win: $userScore',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Loss: $botScore',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: showImage
                        ? Container()
                        : Image.asset(
                            getChoiceImage(userChoice),
                            width: 80,
                            height: 80,
                          ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => playGame(0),
                        child: Image.asset(
                          AssetsImage.keo,
                          width: 80,
                          height: 80,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => playGame(1),
                        child: Image.asset(
                          AssetsImage.bua,
                          width: 80,
                          height: 80,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => playGame(2),
                        child: Image.asset(
                          AssetsImage.bao,
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
