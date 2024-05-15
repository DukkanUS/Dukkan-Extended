// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(limit) =>
      "There is only ${limit}x image search in the free version.";

  static String m1(limit) =>
      "Up to ${limit} messages can only be displayed in the free version.";

  static String m2(date) => "Subscription expired date ${date}";

  static String m3(number) =>
      "Generate (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "apply": MessageLookupByLibrary.simpleMessage("Apply"),
        "artist": MessageLookupByLibrary.simpleMessage("Artist"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "chat": MessageLookupByLibrary.simpleMessage("Chat"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("Chat Detail"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("ChatGPT"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("Chat with Bot"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Choose artist for your image"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Choose detail for your image"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Choose medium for your image"),
        "chooseMood":
            MessageLookupByLibrary.simpleMessage("Choose mood for your image"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("Choose use case"),
        "choseStyle":
            MessageLookupByLibrary.simpleMessage("Choose style for your image"),
        "clear": MessageLookupByLibrary.simpleMessage("Clear"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Are you sure to clear content?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("Clear content"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Clear conversation"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Please confirm if you wish to proceed with the deletion of this item. You can\'t undo this action."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Are you sure you wish to delete this item?"),
        "confirmRemoveKey":
            MessageLookupByLibrary.simpleMessage("Are you sure to remove key?"),
        "copiedToClipboard":
            MessageLookupByLibrary.simpleMessage("Copied content to clipboard"),
        "copy": MessageLookupByLibrary.simpleMessage("Copy"),
        "createChatFailed":
            MessageLookupByLibrary.simpleMessage("Create Chat Failed"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteFailed": MessageLookupByLibrary.simpleMessage("Delete Failed"),
        "detail": MessageLookupByLibrary.simpleMessage("Detail"),
        "download": MessageLookupByLibrary.simpleMessage("Download"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Failed to generate"),
        "failedToSendMessage":
            MessageLookupByLibrary.simpleMessage("Failed to send message"),
        "generate": MessageLookupByLibrary.simpleMessage("Generate"),
        "grid": MessageLookupByLibrary.simpleMessage("Grid"),
        "imageGenerate": MessageLookupByLibrary.simpleMessage("Image generate"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Image size"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Input Key"),
        "interest": MessageLookupByLibrary.simpleMessage("Interest"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Your API Key is stored locally on your mobile and never sent anywhere else. You can save your key to use it later. You can also remove your key if you don\'t want to use it anymore."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Invalid Key"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Job Role"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("Job Skills"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("Layout Style"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Listening..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("Load Key Failed"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Load Key Success"),
        "manage": MessageLookupByLibrary.simpleMessage("Manage"),
        "medium": MessageLookupByLibrary.simpleMessage("Medium"),
        "mood": MessageLookupByLibrary.simpleMessage("Mood"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("More options"),
        "newChat": MessageLookupByLibrary.simpleMessage("New Chat"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("No image generate"),
        "none": MessageLookupByLibrary.simpleMessage("None"),
        "numberOfImages":
            MessageLookupByLibrary.simpleMessage("Number of images"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "The number of images to generate. Must be between 1 and 10."),
        "options": MessageLookupByLibrary.simpleMessage("Options"),
        "page": MessageLookupByLibrary.simpleMessage("Page"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Please check your connection and try again!"),
        "pleaseInputFillAllFields":
            MessageLookupByLibrary.simpleMessage("Please fill in all fields"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("Please input key"),
        "pleaseInputValue":
            MessageLookupByLibrary.simpleMessage("Please input value"),
        "prompt": MessageLookupByLibrary.simpleMessage("Prompt"),
        "putKeyHere": MessageLookupByLibrary.simpleMessage("Put your key here"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Regenerate response"),
        "remaining": MessageLookupByLibrary.simpleMessage("remaining"),
        "remove": MessageLookupByLibrary.simpleMessage("Remove"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("Remove Key Failed"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("Removed Key Successfully"),
        "reset": MessageLookupByLibrary.simpleMessage("Reset"),
        "resetSettings": MessageLookupByLibrary.simpleMessage("Reset Settings"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Save Key"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("Save Key Failed"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("Saved Key Successfully"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Search by Prompt..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Section Keywords"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Section Topic"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("Select Chat Failed"),
        "selectPrompt": MessageLookupByLibrary.simpleMessage("Select Prompt"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "share": MessageLookupByLibrary.simpleMessage("Share"),
        "skills": MessageLookupByLibrary.simpleMessage("Skills"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Something went wrong!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Something went wrong! Please try again later. Thank you so much!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Speech not available"),
        "style": MessageLookupByLibrary.simpleMessage("Style"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk":
            MessageLookupByLibrary.simpleMessage("Tap the mic to talk"),
        "textGenerate": MessageLookupByLibrary.simpleMessage("Text generate"),
        "textGenerator": MessageLookupByLibrary.simpleMessage("Text Generator"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Type a message..."),
        "view": MessageLookupByLibrary.simpleMessage("View"),
        "viewType": MessageLookupByLibrary.simpleMessage("View type"),
        "write": MessageLookupByLibrary.simpleMessage("Write")
      };
}
