import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/src/theams/theams.dart';
import 'package:get/get.dart';

class ContactUsSectionWidget extends StatefulWidget {
  const ContactUsSectionWidget({super.key});

  @override
  State<ContactUsSectionWidget> createState() => _ContactUsSectionWidgetState();
}

class _ContactUsSectionWidgetState extends State<ContactUsSectionWidget> {
  RxBool iamNotRobot = false.obs;

  @override
  Widget build(BuildContext context) => Center(
        child: Card(
          child: Container(
            width: Dimens().percentWidth(.6),
            padding: Dimens().edgeInsetsAll(Dimens().twenty),
            decoration: BoxDecoration(
              color: const Color(0xFF2E2E2E),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Write us',
                  style: Styles.boldSecodry35,
                ),
                Dimens().boxHeight(Dimens().seven),
                SizedBox(
                  width: Dimens().oneHundred,
                  height: 6,
                  child: LinearProgressIndicator(
                    value: 1,
                    color: ColorsValue.color00ffda,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                  ),
                ),
                Dimens().boxHeight(Dimens().fifteen),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Dimens().fourHundred,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Name',
                              hintText: 'Write text here...',
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: Dimens().twenty,
                              ),
                              filled: true,
                              fillColor: Colors.grey[700],
                              border: const OutlineInputBorder(),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                          Dimens().boxHeight(Dimens().sixteen),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: Dimens().twenty,
                              ),
                              filled: true,
                              fillColor: Colors.grey[700],
                              border: const OutlineInputBorder(),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                          Dimens().boxHeight(Dimens().sixteen),
                          Obx(
                            () => Row(
                              children: [
                                Checkbox(
                                  value: iamNotRobot.value,
                                  onChanged: (value) {
                                    iamNotRobot.value = !iamNotRobot.value;
                                    setState(() {});
                                  },
                                  activeColor: ColorsValue.color00ffda,
                                  checkColor: ColorsValue.primaryColor,
                                  overlayColor: WidgetStateProperty.all(
                                    Colors.transparent,
                                  ),
                                  fillColor: WidgetStateProperty.resolveWith(
                                    (states) {
                                      if (states
                                          .contains(WidgetState.selected)) {
                                        return ColorsValue.color00ffda;
                                      }
                                      return Colors.transparent;
                                    },
                                  ),
                                ),
                                const Text(
                                  'I am not a robot',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    // Right section: Message and Send button
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            maxLines: 10,
                            decoration: InputDecoration(
                              hintText: 'Write text here...',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              filled: true,
                              fillColor: Colors.grey[700],
                              border: const OutlineInputBorder(),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                          // const Spacer()
                          // const SizedBox(height: 16.0),
                          Container(
                            padding: Dimens().edgeInsetsAll(16),
                            decoration: BoxDecoration(
                              color: ColorsValue.color00ffda,
                            ),
                            child: const Text(
                              'SEND MESSAGE',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
