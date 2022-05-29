

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatapp_clone_ui/pages/uiChat/view/calls_page.dart';
import 'package:whatapp_clone_ui/pages/uiChat/view/camera_page.dart';
import 'package:whatapp_clone_ui/pages/uiCatalogue/catalogue.dart';
import 'package:whatapp_clone_ui/pages/uiChat/view/chat_page.dart';
import 'package:whatapp_clone_ui/pages/uiLive/live_page.dart';
import 'package:whatapp_clone_ui/pages/uiStreaming/settings_page.dart';
import 'package:whatapp_clone_ui/pages/uiChat/view/status_page.dart';
import 'package:whatapp_clone_ui/pages/uiStreaming/streaming_page.dart';
import 'package:whatapp_clone_ui/theme/colors.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:sip_ua/sip_ua.dart';





class RootApp extends StatefulWidget {
  final SIPUAHelper? _helper;
  RootApp(this._helper, {Key? key}) : super(key: key);
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> implements SipUaHelperListener {
  int pageIndex = 0;
  late RegistrationState _registerState;
  SIPUAHelper? get helper => widget._helper;
  String _ws_uri = "ws://192.168.1.101:8088/ws";
  String _sip_uri = "801@192.168.1.101";
  String _auth_user = "801";
  String _password = "Obelix";
  String _display_name = "801";
  Map<String, String> _wsExtraHeaders = {
    // 'Origin': ' https://tryit.jssip.net',
    // 'Host': 'tryit.jssip.net:10443'
  };


  @override
  initState() {
    super.initState();
    _registerState = helper!.registerState;
    helper!.addSipUaHelperListener(this);
    //_handleSave(context);
    //_loadSettings();
  }

  @override
  deactivate() {
    super.deactivate();
    helper!.removeSipUaHelperListener(this);
    //_saveSettings();
  }

  void _handleSave(BuildContext context) {
    // if (_wsUriController.text == '') {
    //   _alert(context, "WebSocket URL");
    // } else if (_sipUriController.text == '') {
    //   _alert(context, "SIP URI");
    // }

    UaSettings settings = UaSettings();

    settings.webSocketUrl = _ws_uri;
    settings.webSocketSettings.extraHeaders = _wsExtraHeaders;
    settings.webSocketSettings.allowBadCertificate = true;
    //settings.webSocketSettings.userAgent = 'Dart/2.8 (dart:io) for OpenSIPS.';

    settings.uri = _sip_uri;
    settings.authorizationUser = _auth_user;
    settings.password = _password;
    settings.displayName = _display_name;
    settings.userAgent = 'Dart SIP Client v1.0.0';
    settings.dtmfMode = DtmfMode.RFC2833;

    helper!.start(settings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 50,
        actions: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Center(
                child: Text(
                  'Status: ${EnumHelper.getName(helper!.registerState.state)}',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )),
          ),
          PopupMenuButton<String>(
              onSelected: (String value) {
                switch (value) {
                  case 'account':
                    Navigator.pushNamed(context, '/register');
                    break;
                  case 'about':
                    Navigator.pushNamed(context, '/about');
                    break;
                  default:
                    break;
                }
              },
              icon: Icon(Icons.menu),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Icon(
                          Icons.account_circle,
                          color: Colors.black38,
                        ),
                      ),
                      SizedBox(
                        child: Text('Account'),
                        width: 64,
                      )
                    ],
                  ),
                  value: 'account',
                ),
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.info,
                        color: Colors.black38,
                      ),
                      SizedBox(
                        child: Text('About'),
                        width: 64,
                      )
                    ],
                  ),
                  value: 'about',
                )
              ]),

          // Container(
          //   margin: EdgeInsets.all(8),
          //   child: MaterialButton(
          //     onPressed: _onPressed,
          //     child: Text('register'),
          //     textColor: Colors.white,
          //     color: Colors.blue,
          //     padding: EdgeInsets.all(2),
          //   ) ,
          // ),

        ],
      ),
      backgroundColor: bgColor,
      body: getBody(),
      bottomNavigationBar: Wrap(
        children: [getFooter()],
      ),
    );
  }

  void _onPressed(){
    _handleSave(context);
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        ChatPage(helper),
        CallsPage(helper),
        StatusPage(),
        LivePage(),
        StreamingPage(),
        CataloguePage(),
      ],
    );
  }

  Widget getFooter() {
    List iconItems = [
      LineIcons.comment,
      LineIcons.phone,
      LineIcons.circle,
      LineIcons.modx,
      LineIcons.stream,
      LineIcons.quinscape,
    ];
    List textItems = [
      "Chats",
      "Calls",
      "Status",
      "live",
      "streaming",
      "catalogue"
    ];
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(color: greyColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(textItems.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      iconItems[index],
                      color:
                          pageIndex == index ? primary : white.withOpacity(0.5),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(textItems[index],
                        style: TextStyle(
                            fontSize: 10,
                            color: pageIndex == index
                                ? primary
                                : white.withOpacity(0.5).withOpacity(0.5))),
                  ],
                ),
              );
            })),
      ),
    );
  }

  @override
  void callStateChanged(Call call, CallState callState) {
    // TODO: implement callStateChanged
    if (callState.state == CallStateEnum.CALL_INITIATION) {
      Navigator.pushNamed(context, '/callscreen', arguments: call);
    }
  }

  @override
  void onNewMessage(SIPMessageRequest msg) {
    // TODO: implement onNewMessage
  }

  @override
  void registrationStateChanged(RegistrationState state) {
    // TODO: implement registrationStateChanged
    this.setState(() {
      _registerState = state;
    });
  }

  @override
  void transportStateChanged(TransportState state) {
    // TODO: implement transportStateChanged
  }
}
