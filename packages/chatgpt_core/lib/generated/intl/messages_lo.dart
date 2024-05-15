// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a lo locale. All the
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
  String get localeName => 'lo';

  static String m0(limit) => "ມີພຽງແຕ່ການຊອກຫາຮູບພາບ ${limit}x ໃນເວີຊັນຟຣີ.";

  static String m1(limit) =>
      "ສູງສຸດ ${limit} ຂໍ້ຄວາມສາມາດສະແດງຢູ່ໃນສະບັບຟຣີເທົ່ານັ້ນ.";

  static String m2(date) => "ການສະໝັກໃຊ້ໝົດອາຍຸວັນທີ ${date}";

  static String m3(number) =>
      "ສ້າງ (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("ກ່ຽວກັບ"),
        "apply": MessageLookupByLibrary.simpleMessage("ສະ ໝັກ"),
        "artist": MessageLookupByLibrary.simpleMessage("ສິລະປິນ"),
        "cancel": MessageLookupByLibrary.simpleMessage("ຍົກເລີກ"),
        "chat": MessageLookupByLibrary.simpleMessage("ສົນທະນາ"),
        "chatDetail":
            MessageLookupByLibrary.simpleMessage("ລາຍລະອຽດການສົນທະນາ"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("ສົນທະນາ GPT"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("ສົນທະນາກັບບັອດ"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "ເລືອກສິນລະປິນສໍາລັບຮູບພາບຂອງທ່ານ"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "ເລືອກ​ລາຍ​ລະ​ອຽດ​ສໍາ​ລັບ​ຮູບ​ພາບ​ຂອງ​ທ່ານ​"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "ເລືອກຂະຫນາດກາງສໍາລັບຮູບພາບຂອງທ່ານ"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "ເລືອກອາລົມສໍາລັບຮູບພາບຂອງທ່ານ"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("ເລືອກກໍລະນີທີ່ໃຊ້"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "ເລືອກຮູບແບບສໍາລັບຮູບພາບຂອງທ່ານ"),
        "clear": MessageLookupByLibrary.simpleMessage("ແຈ້ງ"),
        "clearConfirm":
            MessageLookupByLibrary.simpleMessage("ທ່ານແນ່ໃຈບໍ່ວ່າລຶບເນື້ອຫາ?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("ລ້າງເນື້ອຫາ"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("ການສົນທະນາທີ່ຈະແຈ້ງ"),
        "confirm": MessageLookupByLibrary.simpleMessage("ຢືນຢັນ"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "ກະລຸນາຢືນຢັນຖ້າທ່ານຕ້ອງການສືບຕໍ່ການລຶບລາຍການນີ້. ທ່ານບໍ່ສາມາດຍົກເລີກຄຳສັ່ງນີ້ໄດ້."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "ທ່ານແນ່ໃຈບໍ່ວ່າຕ້ອງການລຶບລາຍການນີ້?"),
        "confirmRemoveKey":
            MessageLookupByLibrary.simpleMessage("ທ່ານແນ່ໃຈບໍ່ວ່າເອົາກະແຈອອກ?"),
        "copiedToClipboard":
            MessageLookupByLibrary.simpleMessage("ຄັດລອກເນື້ອຫາໃສ່ clipboard"),
        "copy": MessageLookupByLibrary.simpleMessage("ສຳ ເນົາ"),
        "createChatFailed":
            MessageLookupByLibrary.simpleMessage("ສ້າງການສົນທະນາລົ້ມເຫລວ"),
        "delete": MessageLookupByLibrary.simpleMessage("ລົບ"),
        "deleteFailed": MessageLookupByLibrary.simpleMessage("ລຶບບໍ່ສຳເລັດ"),
        "detail": MessageLookupByLibrary.simpleMessage("ລາຍລະອຽດ"),
        "download": MessageLookupByLibrary.simpleMessage("ດາວໂຫລດ"),
        "edit": MessageLookupByLibrary.simpleMessage("ແກ້ໄຂ"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("ລົ້ມເຫລວໃນການສ້າງ"),
        "generate": MessageLookupByLibrary.simpleMessage("ຜະລິດ"),
        "grid": MessageLookupByLibrary.simpleMessage("ຕາຂ່າຍໄຟຟ້າ"),
        "imageGenerate": MessageLookupByLibrary.simpleMessage("ສ້າງຮູບພາບ"),
        "imageSize": MessageLookupByLibrary.simpleMessage("ຂະ ໜາດ ຮູບພາບ"),
        "inputKey": MessageLookupByLibrary.simpleMessage("ລະຫັດປ້ອນຂໍ້ມູນ"),
        "interest": MessageLookupByLibrary.simpleMessage("ດອກເບ້ຍ"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "API Key ຂອງເຈົ້າຖືກເກັບໄວ້ໃນມືຖືຂອງເຈົ້າ ແລະບໍ່ເຄີຍສົ່ງໄປບ່ອນອື່ນ. ທ່ານສາມາດບັນທຶກກະແຈຂອງທ່ານເພື່ອໃຊ້ໃນພາຍຫຼັງ. ທ່ານຍັງສາມາດເອົາກະແຈຂອງທ່ານອອກໄດ້ຖ້າທ່ານບໍ່ຕ້ອງການໃຊ້ມັນອີກຕໍ່ໄປ."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("ກະແຈບໍ່ຖືກຕ້ອງ"),
        "jobRole": MessageLookupByLibrary.simpleMessage("ບົດບາດໜ້າວຽກ"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("ທັກສະວຽກ"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("ຮູບແບບໂຄງຮ່າງ"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("ກຳລັງຟັງ..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("ໂຫຼດລະຫັດລົ້ມເຫລວ"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("ໂຫຼດລະຫັດສຳເລັດ"),
        "manage": MessageLookupByLibrary.simpleMessage("ຈັດການ"),
        "medium": MessageLookupByLibrary.simpleMessage("ປານກາງ"),
        "mood": MessageLookupByLibrary.simpleMessage("ອາລົມ"),
        "moreOptions":
            MessageLookupByLibrary.simpleMessage("ທາງເລືອກເພີ່ມເຕີມ"),
        "newChat": MessageLookupByLibrary.simpleMessage("ສົນທະນາໃໝ່"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("ບໍ່ມີການສ້າງຮູບພາບ"),
        "numberOfImages": MessageLookupByLibrary.simpleMessage("ຈໍານວນຮູບພາບ"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "ຈໍານວນຮູບພາບທີ່ຈະສ້າງ. ຕ້ອງຢູ່ລະຫວ່າງ 1 ຫາ 10."),
        "options": MessageLookupByLibrary.simpleMessage("ທາງເລືອກ"),
        "page": MessageLookupByLibrary.simpleMessage("ໜ້າ"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "ກະລຸນາກວດສອບການເຊື່ອມຕໍ່ຂອງເຈົ້າແລ້ວລອງໃໝ່ອີກຄັ້ງ!"),
        "pleaseInputFillAllFields": MessageLookupByLibrary.simpleMessage(
            "ກະລຸນາຕື່ມຂໍ້ມູນໃສ່ໃນທຸກຊ່ອງ"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("ກະລຸນາໃສ່ລະຫັດ"),
        "prompt": MessageLookupByLibrary.simpleMessage("ການກະຕຸ້ນເຕືອນ"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("ເອົາກະແຈຂອງເຈົ້າໃສ່ບ່ອນນີ້"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("ຟື້ນຟູການຕອບໂຕ້"),
        "remaining": MessageLookupByLibrary.simpleMessage("ຍັງເຫຼືອ"),
        "remove": MessageLookupByLibrary.simpleMessage("ເອົາອອກ"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("ລຶບກະແຈລົ້ມເຫລວ"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("ລຶບກະແຈສຳເລັດແລ້ວ"),
        "reset": MessageLookupByLibrary.simpleMessage("ປັບ ໃໝ່"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("ຣີເຊັດການຕັ້ງຄ່າ"),
        "save": MessageLookupByLibrary.simpleMessage("ບັນທຶກ"),
        "saveKey": MessageLookupByLibrary.simpleMessage("ບັນທຶກກະແຈ"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("ບັນທຶກລະຫັດລົ້ມເຫລວ"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("ບັນທຶກລະຫັດສຳເລັດແລ້ວ"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("ຊອກຫາໂດຍການເຕືອນ..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("ພາກສ່ວນຄໍາສໍາຄັນ"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("ຫົວຂໍ້ພາກ"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("ເລືອກການສົນທະນາລົ້ມເຫລວ"),
        "selectPrompt": MessageLookupByLibrary.simpleMessage("ເລືອກ Prompt"),
        "settings": MessageLookupByLibrary.simpleMessage("ການຕັ້ງຄ່າ"),
        "share": MessageLookupByLibrary.simpleMessage("ແບ່ງປັນ"),
        "skills": MessageLookupByLibrary.simpleMessage("ທັກສະ"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("ເກີດບາງຢ່າງຜິດພາດຂຶ້ນ!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "ມີບາງຢ່າງຜິດພາດເກີດຂຶ້ນ! ກະລຸນາລອງໃໝ່ໃນພາຍຫຼັງ. ຂອບ​ໃຈ​ຫຼາຍໆ!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("ບໍ່ມີສຽງເວົ້າ"),
        "style": MessageLookupByLibrary.simpleMessage("ແບບ"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk":
            MessageLookupByLibrary.simpleMessage("ແຕະໄມເພື່ອລົມ"),
        "textGenerate": MessageLookupByLibrary.simpleMessage("ສ້າງຂໍ້ຄວາມ"),
        "textGenerator": MessageLookupByLibrary.simpleMessage("ຕົວສ້າງຂໍ້ຄວາມ"),
        "timeGenerate": m3,
        "typeAMessage": MessageLookupByLibrary.simpleMessage("ພິມຂໍ້ຄວາມ..."),
        "view": MessageLookupByLibrary.simpleMessage("ເບິ່ງ"),
        "viewType": MessageLookupByLibrary.simpleMessage("ປະເພດເບິ່ງ"),
        "write": MessageLookupByLibrary.simpleMessage("ຂຽນ")
      };
}
