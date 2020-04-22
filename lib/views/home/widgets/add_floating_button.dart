import 'package:flutter/material.dart' hide Banner;
import 'package:mcss/views/home/widgets/add_bottom_sheet.dart';
import 'package:mcss/widgets/banner.dart';

class AddFloatingButton extends StatefulWidget {
  @override
  _AddFloatingButtonState createState() => _AddFloatingButtonState();
}

class _AddFloatingButtonState extends State<AddFloatingButton> {
  bool _visible = true;

  _show() {
    setState(() {
      _visible = true;
    });
  }

  _hide() {
    setState(() {
      _visible = false;
    });
  }

  _onPress() {
    _hide();
    final controller = AddBottomSheet.show(context);
    controller.closed.then((_) => _show());
  }

  @override
  Widget build(BuildContext context) {
    return _visible
        ? Padding(
            padding: EdgeInsets.only(bottom: Banner.size.height.toDouble()),
            child: FloatingActionButton(
              onPressed: _onPress,
              child: Icon(Icons.add, color: Colors.black,),
            ),
          )
        : Container();
  }
}
