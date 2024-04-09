import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Widget kContextMenuBuilder(
//     BuildContext context, EditableTextState editableTextState) {
//   return AdaptiveTextSelectionToolbar.editable(
//     clipboardStatus: ClipboardStatus.pasteable,
//     onPaste: () async {
//       if (await Clipboard.hasStrings()) {
//         final val = await Clipboard.getData('text/plain');
//         if (val != null && val.text != null) {
//           String text = val.text!;
//           if (text.startsWith('+993')) {
//             text = text.replaceFirst('+993', '');
//           }
//
//           text = text.replaceAll(' ', '');
//           if (val.text != text) {
//             await Clipboard.setData(ClipboardData(text: text));
//           }
//         }
//       }
//       editableTextState.pasteText(SelectionChangedCause.toolbar);
//     },
//     onCopy: () =>
//         editableTextState.copySelection(SelectionChangedCause.toolbar),
//     onCut: () => editableTextState.cutSelection(SelectionChangedCause.toolbar),
//     onLiveTextInput: null,
//     onSelectAll: () =>
//         editableTextState.selectAll(SelectionChangedCause.toolbar),
//     anchors: editableTextState.contextMenuAnchors,
//     //onLookUp: () {  }, onSearchWeb: () {  }, onShare: () {  },
//   );
// }
