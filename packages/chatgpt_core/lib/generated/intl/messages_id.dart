// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a id locale. All the
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
  String get localeName => 'id';

  static String m0(limit) =>
      "Hanya ada ${limit}x penelusuran gambar dalam versi gratis.";

  static String m1(limit) =>
      "Hingga ${limit} pesan hanya dapat ditampilkan dalam versi gratis.";

  static String m2(date) => "Tanggal kedaluwarsa langganan ${date}";

  static String m3(number) =>
      "Hasilkan (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Tentang"),
        "apply": MessageLookupByLibrary.simpleMessage("Menerapkan"),
        "artist": MessageLookupByLibrary.simpleMessage("Artis"),
        "cancel": MessageLookupByLibrary.simpleMessage("Membatalkan"),
        "chat": MessageLookupByLibrary.simpleMessage("Obrolan"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("Detail Obrolan"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Obrolan GPT"),
        "chatWithBot":
            MessageLookupByLibrary.simpleMessage("Mengobrol dengan Bot"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Pilih artis untuk gambar Anda"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Pilih detail untuk gambar Anda"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Pilih media untuk gambar Anda"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Pilih mood untuk gambar Anda"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("Pilih kasus penggunaan"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Pilih gaya untuk gambar Anda"),
        "clear": MessageLookupByLibrary.simpleMessage("Bersih"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Apakah Anda yakin ingin menghapus konten?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("Hapus konten"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Percakapan yang jelas"),
        "confirm": MessageLookupByLibrary.simpleMessage("Konfirmasi"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Harap konfirmasi jika Anda ingin melanjutkan penghapusan item ini. Anda tidak dapat membatalkan tindakan ini."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Apakah Anda yakin ingin menghapus item ini?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Apakah Anda yakin untuk menghapus kunci?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Menyalin konten ke clipboard"),
        "copy": MessageLookupByLibrary.simpleMessage("Salinan"),
        "createChatFailed":
            MessageLookupByLibrary.simpleMessage("Buat Obrolan Gagal"),
        "delete": MessageLookupByLibrary.simpleMessage("Menghapus"),
        "deleteFailed": MessageLookupByLibrary.simpleMessage("Hapus Gagal"),
        "detail": MessageLookupByLibrary.simpleMessage("Detail"),
        "download": MessageLookupByLibrary.simpleMessage("Unduh"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Gagal menghasilkan"),
        "generate": MessageLookupByLibrary.simpleMessage("Menghasilkan"),
        "grid": MessageLookupByLibrary.simpleMessage("Kisi"),
        "imageGenerate":
            MessageLookupByLibrary.simpleMessage("Hasilkan gambar"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Ukuran gambar"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Kunci Masukan"),
        "interest": MessageLookupByLibrary.simpleMessage("Minat"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Kunci API Anda disimpan secara lokal di ponsel Anda dan tidak pernah dikirim ke tempat lain. Anda dapat menyimpan kunci untuk digunakan nanti. Anda juga dapat menghapus kunci jika tidak ingin menggunakannya lagi."),
        "invalidKey":
            MessageLookupByLibrary.simpleMessage("Kunci tidak sesuai"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Peran Pekerjaan"),
        "jobSkills":
            MessageLookupByLibrary.simpleMessage("Keterampilan Pekerjaan"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("gaya latar"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Mendengarkan..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("Memuat Kunci Gagal"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Muat Kunci Sukses"),
        "manage": MessageLookupByLibrary.simpleMessage("Mengelola"),
        "medium": MessageLookupByLibrary.simpleMessage("Medium"),
        "mood": MessageLookupByLibrary.simpleMessage("Suasana hati"),
        "moreOptions":
            MessageLookupByLibrary.simpleMessage("Lebih banyak pilihan"),
        "newChat": MessageLookupByLibrary.simpleMessage("Obrolan Baru"),
        "noImageGenerate": MessageLookupByLibrary.simpleMessage(
            "Tidak ada gambar yang dihasilkan"),
        "numberOfImages": MessageLookupByLibrary.simpleMessage("Jumlah gambar"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Jumlah gambar yang akan dihasilkan. Harus antara 1 dan 10."),
        "options": MessageLookupByLibrary.simpleMessage("Pilihan"),
        "page": MessageLookupByLibrary.simpleMessage("Halaman"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Periksa koneksi Anda dan coba lagi!"),
        "pleaseInputFillAllFields":
            MessageLookupByLibrary.simpleMessage("Harap isi semua bidang"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("Harap masukkan kunci"),
        "prompt": MessageLookupByLibrary.simpleMessage("Cepat"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Letakkan kunci Anda di sini"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Regenerasi respons"),
        "remaining": MessageLookupByLibrary.simpleMessage("tersisa"),
        "remove": MessageLookupByLibrary.simpleMessage("Menghapus"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("Hapus Kunci Gagal"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("Kunci Dihapus Berhasil"),
        "reset": MessageLookupByLibrary.simpleMessage("Setel ulang"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Atur Ulang Pengaturan"),
        "save": MessageLookupByLibrary.simpleMessage("Menyimpan"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Simpan Kunci"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("Simpan Kunci Gagal"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("Kunci Tersimpan Berhasil"),
        "searchByPrompt": MessageLookupByLibrary.simpleMessage(
            "Telusuri berdasarkan Prompt..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Kata Kunci Bagian"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Topik Bagian"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("Pilih Obrolan Gagal"),
        "selectPrompt": MessageLookupByLibrary.simpleMessage("Pilih Prompt"),
        "settings": MessageLookupByLibrary.simpleMessage("Pengaturan"),
        "share": MessageLookupByLibrary.simpleMessage("Bagikan"),
        "skills": MessageLookupByLibrary.simpleMessage("Keterampilan"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Ada yang salah!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Ada yang salah! Coba lagi nanti. Terima kasih banyak!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Ucapan tidak tersedia"),
        "style": MessageLookupByLibrary.simpleMessage("Gaya"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Ketuk mikrofon untuk berbicara"),
        "textGenerate":
            MessageLookupByLibrary.simpleMessage("Menghasilkan teks"),
        "textGenerator": MessageLookupByLibrary.simpleMessage("Pembuat Teks"),
        "timeGenerate": m3,
        "typeAMessage": MessageLookupByLibrary.simpleMessage("Ketik pesan..."),
        "view": MessageLookupByLibrary.simpleMessage("Melihat"),
        "viewType": MessageLookupByLibrary.simpleMessage("Jenis tampilan"),
        "write": MessageLookupByLibrary.simpleMessage("menulis")
      };
}
