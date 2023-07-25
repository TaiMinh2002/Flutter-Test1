// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test1/common/const.dart';

class Items extends StatefulWidget {
  const Items({
    Key? key,
    required this.score,
    required this.win_score,
    required this.loss_score,
    required this.choice,
  }) : super(key: key);

  final int score;
  final int win_score;
  final int loss_score;
  final String choice;

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
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
    return Container(
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
                'Score: ${widget.score}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'Win: ${widget.win_score}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'Loss: ${widget.loss_score}',
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
                    getChoiceImage(widget.choice),
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
    );
  }
}
