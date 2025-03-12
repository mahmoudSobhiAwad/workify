import 'package:flutter/material.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';

Future<String?> showPopupMenu(BuildContext context,
    {required List<String> items}) async {
  final RenderBox renderBox = context.findRenderObject() as RenderBox;
  final Offset position = renderBox.localToGlobal(const Offset(0, -5));
  final selected = await showMenu(
    constraints: BoxConstraints(
      
      maxHeight: MediaQuery.sizeOf(context).height * 0.3,
    ),
    menuPadding: const EdgeInsets.all(0),
    context: context,
    position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + renderBox.size.height,
        position.dx + renderBox.size.width,
        position.dy + renderBox.size.height + 20),
    items: [
      ...List.generate(items.length, (index) {
        return PopupMenuItem(
            value: items[index],
            child: Row(
              children: [
                Text(
                  items[index],
                  style: AppFontStyle.medium14,
                ),
                const Flexible(
                  child: SizedBox(
                    width: 250,
                  ),
                )
              ],
            ));
      })
    ],
  );

  return selected;
}
