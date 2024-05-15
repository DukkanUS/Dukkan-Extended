// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
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
  String get localeName => 'vi';

  static String m0(limit) =>
      "Chỉ có tìm kiếm hình ảnh ${limit}x trong phiên bản miễn phí.";

  static String m1(limit) =>
      "Chỉ có thể hiển thị tối đa ${limit} tin nhắn trong phiên bản miễn phí.";

  static String m2(date) => "Ngày hết hạn đăng ký ${date}";

  static String m3(number) =>
      "Tạo (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Về"),
        "apply": MessageLookupByLibrary.simpleMessage("Áp dụng"),
        "artist": MessageLookupByLibrary.simpleMessage("Nghệ sĩ"),
        "cancel": MessageLookupByLibrary.simpleMessage("Huỷ"),
        "chat": MessageLookupByLibrary.simpleMessage("Trò chuyện"),
        "chatDetail":
            MessageLookupByLibrary.simpleMessage("Chi tiết trò chuyện"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Chat GPT"),
        "chatWithBot":
            MessageLookupByLibrary.simpleMessage("Trò chuyện với Bot"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Chọn nghệ sĩ cho hình của bạn"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Chọn chi tiết cho hình của bạn"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Chọn chất liệu cho hình của bạn"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Chọn cảm xúc cho hình của bạn"),
        "chooseUseCase": MessageLookupByLibrary.simpleMessage("Chọn use case"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Chọn phong cách cho hình của bạn"),
        "clear": MessageLookupByLibrary.simpleMessage("Xoá"),
        "clearConfirm":
            MessageLookupByLibrary.simpleMessage("Bạn muốn xoá nội dung?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("Xoá nội dung"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Xoá cuộc trò chuyện"),
        "confirm": MessageLookupByLibrary.simpleMessage("Xác nhận"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Vui lòng xác nhận trước khi xoá. Bạn sẽ không thể hoàn tác."),
        "confirmDeleteItem":
            MessageLookupByLibrary.simpleMessage("Bạn muốn xoá mục này?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Bạn có chắc chắn để loại bỏ chìa khóa?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Đã sao chép vào khay nhớ tạm"),
        "copy": MessageLookupByLibrary.simpleMessage("Sao chép"),
        "createChatFailed": MessageLookupByLibrary.simpleMessage(
            "Tạo trò chuyện không thành công"),
        "delete": MessageLookupByLibrary.simpleMessage("Xoá"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Xóa không thành công"),
        "detail": MessageLookupByLibrary.simpleMessage("Chi tiết"),
        "download": MessageLookupByLibrary.simpleMessage("Tải xuống"),
        "edit": MessageLookupByLibrary.simpleMessage("Sửa"),
        "failedToGenerate": MessageLookupByLibrary.simpleMessage("Lỗi khi tạo"),
        "generate": MessageLookupByLibrary.simpleMessage("Tạo"),
        "grid": MessageLookupByLibrary.simpleMessage("Lưới"),
        "imageGenerate": MessageLookupByLibrary.simpleMessage("Tạo hình ảnh"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Kích thước"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Phím nhập"),
        "interest": MessageLookupByLibrary.simpleMessage("Quan tâm"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Khóa API của bạn được lưu trữ cục bộ trên điện thoại di động của bạn và không bao giờ được gửi đi bất kỳ nơi nào khác. Bạn có thể lưu khóa của mình để sử dụng sau này. Bạn cũng có thể xóa khóa của mình nếu không muốn sử dụng nữa."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Khóa không hợp lệ"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Vai trò công việc"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("Kỹ năng làm việc"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("Kiểu bố cục"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Đang nghe..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("Tải khóa không thành công"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Tải khóa thành công"),
        "manage": MessageLookupByLibrary.simpleMessage("Quản lý"),
        "medium": MessageLookupByLibrary.simpleMessage("Chất liệu"),
        "mood": MessageLookupByLibrary.simpleMessage("Cảm xúc"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("Thêm tuỳ chọn"),
        "newChat": MessageLookupByLibrary.simpleMessage("Cuộc trò truyện mới"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Không hình ảnh nào được tạo"),
        "numberOfImages":
            MessageLookupByLibrary.simpleMessage("Số lượng hình ảnh"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Số hình ảnh cần tạo, Phải từ 1 đến 10."),
        "options": MessageLookupByLibrary.simpleMessage("Tuỳ chọn"),
        "page": MessageLookupByLibrary.simpleMessage("Trang"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Vui lòng kiểm tra kết nối của bạn và thử lại!"),
        "pleaseInputFillAllFields": MessageLookupByLibrary.simpleMessage(
            "Vui lòng điền vào các trường"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập khóa"),
        "prompt": MessageLookupByLibrary.simpleMessage("Lời nhắc"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Đặt chìa khóa của bạn ở đây"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Tạo lại phản hồi"),
        "remaining": MessageLookupByLibrary.simpleMessage("Còn lại"),
        "remove": MessageLookupByLibrary.simpleMessage("Tẩy"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("Xóa khóa không thành công"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("Đã xóa khóa thành công"),
        "reset": MessageLookupByLibrary.simpleMessage("Cài lại"),
        "resetSettings": MessageLookupByLibrary.simpleMessage("Đặt lại"),
        "save": MessageLookupByLibrary.simpleMessage("Tiết kiệm"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Lưu khóa"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("Lưu khóa không thành công"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("Đã lưu khóa thành công"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Tìm kiếm theo lời nhắc..."),
        "sectionKeywords": MessageLookupByLibrary.simpleMessage("Phần từ khóa"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Phần chủ đề"),
        "selectChatFailed": MessageLookupByLibrary.simpleMessage(
            "Chọn trò chuyện không thành công"),
        "selectPrompt": MessageLookupByLibrary.simpleMessage("Chọn lời nhắc"),
        "settings": MessageLookupByLibrary.simpleMessage("Cài đặt"),
        "share": MessageLookupByLibrary.simpleMessage("Chia sẻ"),
        "skills": MessageLookupByLibrary.simpleMessage("Kỹ năng"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Đã xảy ra sự cố!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Có vấn đề xảy ra! Vui lòng thử lại sau. Xin cảm ơn!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Không khả dụng"),
        "style": MessageLookupByLibrary.simpleMessage("Phong cách"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk":
            MessageLookupByLibrary.simpleMessage("Nhấn vào mic để nói"),
        "textGenerate": MessageLookupByLibrary.simpleMessage("Tạo văn bản"),
        "textGenerator":
            MessageLookupByLibrary.simpleMessage("Trình tạo văn bản"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Nhập tin nhắn..."),
        "view": MessageLookupByLibrary.simpleMessage("Xem"),
        "viewType": MessageLookupByLibrary.simpleMessage("Dạng xem"),
        "write": MessageLookupByLibrary.simpleMessage("Viết")
      };
}
