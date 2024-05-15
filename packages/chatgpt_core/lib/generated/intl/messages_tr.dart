// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a tr locale. All the
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
  String get localeName => 'tr';

  static String m0(limit) =>
      "Ücretsiz sürümde yalnızca ${limit}x görsel arama yapabilirsiniz.";

  static String m1(limit) =>
      "Ücretsiz sürümde en fazla ${limit} mesaj görüntülenebilir.";

  static String m2(date) => "Aboneliğiniz ${date} tarihinde sona erecek";

  static String m3(number) =>
      "Oluştur (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Hakkında"),
        "apply": MessageLookupByLibrary.simpleMessage("Uygula"),
        "artist": MessageLookupByLibrary.simpleMessage("Sanatçı"),
        "cancel": MessageLookupByLibrary.simpleMessage("İptal"),
        "chat": MessageLookupByLibrary.simpleMessage("Sohbet"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("Sohbet Detayı"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Chat GPT"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("Botla sohbet et"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Resminiz için bir sanatçı seçin"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Resminiz için bir detay seçin"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Resminiz için bir ortam seçin"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Resminiz için bir ruh hali seçin"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("Kullanım senaryosunu seçin"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Resminiz için bir stil seçin"),
        "clear": MessageLookupByLibrary.simpleMessage("Temizle"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "İçeriği temizlemek istediğinizden emin misiniz?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("İçeriği temizle"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Konuşmayı temizle"),
        "confirm": MessageLookupByLibrary.simpleMessage("Onayla"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Bu öğenin silinmesini onaylamak istediğinizi lütfen onaylayın. Bu işlem geri alınamaz."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Bu öğeyi silmek istediğinizden emin misiniz?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Anahtarı kaldırmak istediğinizden emin misiniz?"),
        "copiedToClipboard":
            MessageLookupByLibrary.simpleMessage("İçerik panoya kopyalandı"),
        "copy": MessageLookupByLibrary.simpleMessage("Kopyala"),
        "createChatFailed":
            MessageLookupByLibrary.simpleMessage("Sohbet Oluşturma Başarısız"),
        "delete": MessageLookupByLibrary.simpleMessage("Sil"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Silme başarısız oldu"),
        "detail": MessageLookupByLibrary.simpleMessage("Detay"),
        "download": MessageLookupByLibrary.simpleMessage("İndir"),
        "edit": MessageLookupByLibrary.simpleMessage("Düzenle"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Oluşturulamadı"),
        "generate": MessageLookupByLibrary.simpleMessage("Oluştur"),
        "grid": MessageLookupByLibrary.simpleMessage("Kılavuz"),
        "imageGenerate":
            MessageLookupByLibrary.simpleMessage("Görüntü oluştur"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Görüntü boyutu"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Giriş Anahtarı"),
        "interest": MessageLookupByLibrary.simpleMessage("İlgi"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "API Anahtarınız yerel olarak cep telefonunuzda saklanır ve asla başka bir yere gönderilmez. Anahtarınızı daha sonra kullanmak üzere kaydedebilirsiniz. Artık kullanmak istemiyorsanız, anahtarınızı da kaldırabilirsiniz."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Geçersiz Anahtar"),
        "jobRole": MessageLookupByLibrary.simpleMessage("İş rolü"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("İş becerileri"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("Düzen Stili"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Dinleniyor..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("Anahtar Yüklenemedi"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Anahtar Başarıyla Yüklendi"),
        "manage": MessageLookupByLibrary.simpleMessage("Yönet"),
        "medium": MessageLookupByLibrary.simpleMessage("Orta"),
        "mood": MessageLookupByLibrary.simpleMessage("Mod"),
        "moreOptions":
            MessageLookupByLibrary.simpleMessage("Daha fazla seçenek"),
        "newChat": MessageLookupByLibrary.simpleMessage("Yeni Sohbet"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Görüntü oluşturma yok"),
        "numberOfImages": MessageLookupByLibrary.simpleMessage("Resim sayısı"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Oluşturulacak görüntü sayısı. 1 ile 10 arasında olmalıdır."),
        "options": MessageLookupByLibrary.simpleMessage("Seçenekler"),
        "page": MessageLookupByLibrary.simpleMessage("Sayfa"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Lütfen bağlantınızı kontrol edin ve tekrar deneyin!"),
        "pleaseInputFillAllFields": MessageLookupByLibrary.simpleMessage(
            "Lütfen tüm alanları doldurun"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("Lütfen anahtarı girin"),
        "prompt": MessageLookupByLibrary.simpleMessage("Komut İsteği"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Anahtarını buraya yerleştir"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Yanıtı yeniden oluştur"),
        "remaining": MessageLookupByLibrary.simpleMessage("Kalan"),
        "remove": MessageLookupByLibrary.simpleMessage("Kaldır"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("Anahtar Kaldırılamadı"),
        "removeKeySuccess": MessageLookupByLibrary.simpleMessage(
            "Anahtar Başarıyla Kaldırıldı"),
        "reset": MessageLookupByLibrary.simpleMessage("Sıfırla"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Ayarları sıfırla"),
        "save": MessageLookupByLibrary.simpleMessage("Kaydet"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Anahtarı Kaydet"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("Anahtar Kaydedilemedi"),
        "saveKeySuccess": MessageLookupByLibrary.simpleMessage(
            "Anahtar Başarıyla Kaydedildi"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Bilgi İstemine Göre Ara..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Bölüm Anahtar Kelimeleri"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Bölüm Konusu"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("Sohbet Seçimi Başarısız"),
        "selectPrompt": MessageLookupByLibrary.simpleMessage("İstemi Seç"),
        "settings": MessageLookupByLibrary.simpleMessage("Ayarlar"),
        "share": MessageLookupByLibrary.simpleMessage("Paylaş"),
        "skills": MessageLookupByLibrary.simpleMessage("Yetenekler"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Bir şeyler yanlış gitti!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Bir şeyler yanlış gitti! Lütfen daha sonra tekrar deneyin. Çok teşekkürler!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Konuşma mevcut değil"),
        "style": MessageLookupByLibrary.simpleMessage("Stil"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Konuşmak için mikrofona dokunun"),
        "textGenerate": MessageLookupByLibrary.simpleMessage("Metin oluştur"),
        "textGenerator":
            MessageLookupByLibrary.simpleMessage("Metin Oluşturucu"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Bir mesaj yazın..."),
        "view": MessageLookupByLibrary.simpleMessage("Görünüm"),
        "viewType": MessageLookupByLibrary.simpleMessage("Görünüm Türü"),
        "write": MessageLookupByLibrary.simpleMessage("Yaz")
      };
}
