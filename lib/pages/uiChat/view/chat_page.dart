import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatapp_clone_ui/customizedWidget/commonWidget.dart';
import 'package:whatapp_clone_ui/json/chat_json.dart';
import 'package:whatapp_clone_ui/pages/uiChat/view/chat_detail_page.dart';
import 'package:whatapp_clone_ui/pages/uiStreaming/settings_page.dart';
import 'package:whatapp_clone_ui/theme/colors.dart';
import '../../../theme/colors.dart';
import 'package:sip_ua/sip_ua.dart';


class ChatPage extends StatefulWidget {
  final SIPUAHelper? _helper;

  ChatPage(this._helper, {Key? key}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>  {
  SIPUAHelper? get helper => widget._helper;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: getAppBar(),
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: floating_backgroundColor,
        foregroundColor: floating_foregroundColor,
        onPressed: () {
          // Respond to button press
        },
        child: Icon(Icons.sms),
      ),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      backgroundColor: bgColor,
      leading: IconButton(
        onPressed: null,
        icon: Text(
          "Edit ",
          style: TextStyle(
              fontSize: 16, color: primary, fontWeight: FontWeight.w500),
        ),
      ),
      actions: [
        // Padding(
        //   padding: EdgeInsets.only(right: 25),
        //   child: SettingsPage(),
        // )
        SettingMenuChatPage()
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15, right: 15, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chats",
                  style: TextStyle(
                      fontSize: 23, color: white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 38,
                  decoration: BoxDecoration(
                      color: textfieldColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    style: TextStyle(color: white),
                    cursorColor: primary,
                    decoration: InputDecoration(
                        prefixIcon: Icon(LineIcons.search,
                            color: white.withOpacity(0.3)),
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(
                            color: white.withOpacity(0.3), fontSize: 17)),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Broadcast Lists",
                      style: TextStyle(
                          fontSize: 16,
                          color: primary,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "New Group",
                      style: TextStyle(
                          fontSize: 16,
                          color: primary,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 5, right: 5),
            child: Divider(color: white.withOpacity(0.3)),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
              children: List.generate(chat_data.length, (index) {
            return GestureDetector(
              onTap: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ChatDetailPage(
                              name: chat_data[index]['name'],
                              img: chat_data[index]['img'],
                              num: chat_data[index]['num'],
                              helper: helper,
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(chat_data[index]['img']),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Container(
                        height: 85,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: (size.width - 40) * 0.6,
                                      child: Text(chat_data[index]['name'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: white,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    Expanded(
                                      child: Text(
                                        chat_data[index]['date'],
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: white.withOpacity(0.4)),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: (size.width - 40) * 1,
                                  child: Text(
                                    chat_data[index]['text'],
                                    style: TextStyle(
                                        fontSize: 15,
                                        height: 1.3,
                                        color: white.withOpacity(0.4)),
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              color: white.withOpacity(0.3),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          })),
        ],
      ),
    );
  }
}
