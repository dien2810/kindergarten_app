import 'package:get/get.dart';

class TeacherTinTucController extends GetxController {
  // Dữ liệu tin tức
  final Map<String, dynamic> news = {
    "news_id_1": {
      "title": "Tuyển sinh năm học 2024-2025",
      "createDate": "2024-09-23T14:30",
      "subtitles": [
        {
          "subtitleName": "Quy chế",
          "imageUrl": "none",
          "content": "Nhận trẻ từ 3-7 tuổi"
        },
        {
          "subtitleName": "Học phí",
          "imageUrl": "https://www.chudu24.com/wp-content/uploads/2016/11/rehahn-4-1479217491.jpg",
          "content": "Học phí của nhà trường chia thành nhiều khoảng, tùy thuộc vào cấp học và chương trình học."
        }
      ],
      "fileUrl": "link_lien_ket_file_txt_baiviet_none",
      "tags": ["học phí"],
      "type": "tuyển sinh",
      "authorID": "teacher_id_1"
    },
    "news_id_2": {
      "title": "Vingroup Tổ Chức Chuỗi Hoạt Động Thiện Nguyện, Kêu Gọi Cộng Đồng Chung Tay Tái Thiết Cuộc Sống Sau Bão Lũ",
      "createDate": "2024-09-23T11:32",
      "subtitles": [
        {
          "subtitleName": "none",
          "imageUrl": "link_anh_baiviet_https",
          "content": "Hà Nội - ngày 19/09/2024, Tập đoàn Vingroup, các công ty thành viên và đối tác đồng hành công bố tổ chức chuỗi hoạt động thiện nguyện “Gieo mầm Thiện tâm”."
        },
        {
          "subtitleName": "none",
          "imageUrl": "none",
          "content": "Cơn bão Yagi và trận lũ quét lịch sử đã đi qua, nhưng những mất mát và khó khăn vẫn đang đè nặng lên đồng bào."
        },
        {
          "subtitleName": "none",
          "imageUrl": "none",
          "content": "Thông tin ủng hộ sẽ được công khai minh bạch tại website https://gieomamthientam.com/"
        }
      ],
      "fileUrl": "link_lien_ket_file_txt_baiviet_none",
      "tags": ["từ thiện", "sự kiện"],
      "type": "tin tức - sự kiện",
      "authorID": "teacher_id_1"
    },
    // Thêm các tin tức khác tương tự...
    "news_id_3": {
      "title": "Học bổng Kiến tạo đã mang lại những thay đổi tích cực như thế nào?",
      "createDate": "2024-09-23T11:32",
      "subtitles": [],
      "fileUrl": "link_lien_ket_file_txt_baiviet",
      "tags": ["từ thiện", "sự kiện"],
      "type": "tin tức - sự kiện",
      "authorID": "teacher_id_1"
    },
    "news_id_4": {
      "title": "Trung Thu Tại Mầm Non Vinschool: Ngày Hội Gắn Kết Văn Hóa Truyền Thống Dân Tộc",
      "createDate": "2024-09-17T11:32",
      "subtitles": [
        {
          "subtitleName": "none",
          "imageUrl": "link_anh_baiviet_https",
          "content": "Tại Vinschool, Tết Trung thu không chỉ là dịp để các bé vui chơi, mà còn là cơ hội để khám phá và hiểu sâu hơn về văn hóa truyền thống của dân tộc và các nước châu Á. "
        },
        {
          "subtitleName": "hello",
          "imageUrl": "none",
          "content": "Chuỗi hoạt động phong phú trong lễ hội đã mang đến niềm vui cho các Vinsers nhí, giúp các bé tiếp thu những giá trị văn hóa quý báu và phát triển kỹ năng cá nhân."
        },
        {
          "subtitleName": "Khơi dậy tình yêu văn hóa truyền thống qua các hoạt động thủ công",
          "imageUrl": "none",
          "content": "Các hoạt động thủ công trong dịp Trung thu tại Mầm non Vinschool giúp trẻ tiếp xúc một cách gần gũi hơn với văn hóa truyền thống."
        },
        {
          "subtitleName": "none",
          "imageUrl": "none",
          "content": "Khi tham gia làm đèn lồng, đèn ông sao, diều giấy, đầu lân…các em được học các kĩ thuật thủ công như cắt, dán và lắp ráp, hiểu sâu hơn về ý nghĩa văn hóa của các đồ chơi dân gian này."
        },
        {
          "subtitleName": "none",
          "imageUrl": "none",
          "content": " Qua đó có cơ hội phát triển khả năng sáng tạo, nghệ thuật sắp đặt và tư duy logic,"
        },
        {
          "subtitleName": "none",
          "imageUrl": "none",
          "content": "đồng thời học cách kết hợp màu sắc, hình dạng để tạo ra sản phẩm hoàn chỉnh, được rèn luyện sự kiên nhẫn và kĩ năng giải quyết vấn đề "
        }
      ],
      "fileUrl": "link_lien_ket_file_txt_baiviet_none",
      "tags": ["trung thu", "sự kiện"],
      "type": "tin tức - sự kiện",
      "authorID": "teacher_id_1"
    },
    "news_id_5": {
      "title": "Giới thiệu Vinschool",
      "createDate": "2024-09-17T11:32",
      "subtitles": [
        {
          "subtitleName": "none",
          "imageUrl": "none",
          "content": "Hệ thống trường Việt Nam đầu tiên và duy nhất đạt giám định toàn diện của Hội đồng các Trường Quốc tế CIS  "
        },
        {
          "subtitleName": "http://hello/helo.png",
          "imageUrl": "none",
          "content": "Là trường Việt Nam đầu tiên thực hiện dạy học theo chuẩn đầu ra"
        },
        {
          "subtitleName": "none",
          "imageUrl": "none",
          "content": "52,000 Học sinh - 55 Cơ sở"
        },
        {
          "subtitleName": "none",
          "imageUrl": "none",
          "content": "Dẫn đầu Edtech Việt Nam với 2 giải thưởng danh giá tại Asian Technology Excellence Awards "
        }
      ],
      "fileUrl": "link_lien_ket_file_txt_baiviet_none",
      "tags": ["Vinschool", "giáo dục"],
      "type": "giới thiệu trường",
      "authorID": "teacher_id_2"
    },
    "news_id_6": {
      "title": "Q&A - Góc giải đáp thắc mắc về Câu lạc bộ Ngoại khóa Vinschool",
      "createDate": "2024-09-17T11:50",
      "subtitles": [
        {
          "subtitleName": "none",
          "imageUrl": "none",
          "content": "Bên cạnh giờ học chính khóa, việc khuyến khích học sinh tích cực tham gia hoạt động ngoại khoá mở ra những cơ hội tuyệt vời để các con khai phá năng lực tiềm ẩn, mở rộng kiến thức thực tế và phát triển kỹ năng đa dạng trong nhiều lĩnh vực."
        },
        {
          "subtitleName": "1. Vì sao tôi nên cho con tham gia các CLB ngoại khoá Vinschool?",
          "imageUrl": "none",
          "content": "Khi tham gia vào các hoạt động ngoại khoá được tổ chức bài bản và chuyên nghiệp, học sinh có cơ hội:"
        },
        {
          "subtitleName": "Khơi dậy tài năng tiềm ẩn: ",
          "imageUrl": "none",
          "content": "Con được khám phá và phát triển sở thích và tiềm năng cá nhân mà có thể chưa được khai thác trong chương trình học chính khóa."
        },
        {
          "subtitleName": "Phát triển kỹ năng xã hội:",
          "imageUrl": "none",
          "content": "Con được học cách làm việc nhóm và giao tiếp hiệu quả thông qua trải nghiệm đa dạng tại các câu lạc bộ ngoại khoá."
        },
        {
          "subtitleName": "Tăng cường tư duy: ",
          "imageUrl": "none",
          "content": " Hoạt động ngoại khóa trong các lĩnh vực toán, khoa học công nghệ, nghệ thuật hay ngôn ngữ đòi hỏi học sinh giải quyết vấn đề linh hoạt hoặc tạo ra những sản phẩm của riêng mình. "
        },
        {
          "subtitleName": "Tăng cường sự tự tin và tự chủ:",
          "imageUrl": "none",
          "content": "Việc vượt ra khỏi vùng an toàn và thử thách bản thân qua các trải nghiệm ngoại khóa giúp con xây dựng sự tự tin và tính tự chủ"
        }
      ],
      "fileUrl": "link_lien_ket_file_txt_baiviet_none",
      "tags": ["câu lạc bộ", "sự kiện"],
      "type": "chương trình giáo dục",
      "authorID": "teacher_id_2"
    },
    "news_id_7": {
      "title": "Hành trình 4 năm Học bổng Kiến tạo - Lan tỏa tri thức và lòng nhân ái",
      "createDate": "2024-09-29T11:32",
      "subtitles": [
        {
          "subtitleName": "none",
          "imageUrl": "https://vinschool.edu.vn/news_event/hanh-trinh-4-nam-hoc-bong-kien-tao-lan-toa-tri-thuc-va-long-nhan-ai/",
          "content": "none"
        }
      ],
      "fileUrl": "link_lien_ket_file_txt_baiviet_none",
      "tags": ["kiến tạo", "học bổng", "sự kiện"],
      "type": "tin tức - sự kiện",
      "authorID": "teacher_id_2"
    },
    "news_id_8": {
      "title": "Khám Phá Một Giờ Học Tiếng Anh Của Trẻ 18 - 24 Tháng Mầm Non Vinschool",
      "createDate": "2024-10-29T11:39",
      "subtitles": [
        {
          "subtitleName": "none",
          "imageUrl": "none",
          "content": "Dạy học theo ngữ cảnh (context-based learning) là phương pháp dạy học đặc biệt phù hợp và hiệu quả trong môn tiếng Anh ESL đối với học sinh ở lứa tuổi nhà trẻ, phương pháp này giúp các con dễ học, dễ nhớ và hấp thụ ngôn ngữ thứ 2 một cách tự nhiên, thích thú. "
        },
        {
          "subtitleName": "none",
          "imageUrl": "none",
          "content": " Ngoài ra, việc kết hợp với dạy học tích hợp cũng giúp các Vinsers nhí làm quen, rèn luyện được nhiều kĩ năng, cảm xúc xã hội trong các giờ học tiếng Anh."
        },
        {
          "subtitleName": "none",
          "imageUrl": "none",
          "content": " Cùng khám phá các bé nhà trẻ học cách sử dụng các từ ngữ lịch sự trong tiếng Anh và bước đầu làm quen với các phép tắc cơ bản trên bàn ăn qua giờ học “Healthy Snack Time” như thế nào nhé."
        },
        {
          "subtitleName": "Phát triển ngôn ngữ qua ngữ cảnh cụ thể",
          "imageUrl": "none",
          "content": "Phương pháp dạy dựa trên ngữ cảnh giúp trẻ hiểu rõ hơn về cách sử dụng ngôn ngữ trong các tình huống thực tiễn. Thay vì chỉ đơn thuần lặp lại các từ vựng, giáo viên tại Vinschool khéo léo lồng ghép các từ mới vào những hoạt động cụ thể"
        },
        {
          "subtitleName": "none",
          "imageUrl": "none",
          "content": "như việc chuẩn bị đồ ăn nhẹ hoặc tương tác với bạn bè. Điều này giúp trẻ nhanh chóng liên kết giữa từ và hành động, từ đó ghi nhớ một cách tự nhiên và lâu dài."
        }
      ],
      "fileUrl": "link_lien_ket_file_txt_baiviet_none",
      "tags": ["tiếng anh", "sự kiện"],
      "type": "chương trình giáo dục",
      "authorID": "teacher_id_2"
    },
    "news_id_9": {
      "title": "Trung tâm Tư vấn và Phát triển tài năng - GATE Center",
      "createDate": "2024-10-29T11:39",
      "subtitles": [],
      "fileUrl": "link_lien_ket_file_txt_baiviet_none",
      "tags": ["gate", "sự kiện", "phát triển tài năng"],
      "type": "giới thiệu trường",
      "authorID": "teacher_id_4"
    },
  };

  // Danh sách riêng biệt cho các loại tin tức
  List<Map<String, dynamic>> newsList = [];
  List<Map<String, dynamic>> tuyenSinhList = [];
  List<Map<String, dynamic>> giaoDucList = [];
  List<Map<String, dynamic>> gioiThieuList = [];

  @override
  void onInit() {
    super.onInit();
    buildNewsLists();
  }

  // Hàm xây dựng danh sách tin tức
  void buildNewsLists() {
    news.forEach((key, value) {
      String type = value['type'] ?? '';
      if (type.contains("tin tức")) {
        newsList.add(value);
      }
      if (type.contains("tuyển sinh")) {
        tuyenSinhList.add(value);
      }
      if (type.contains("giáo dục")) {
        giaoDucList.add(value);
      }
      if (type.contains("giới thiệu") || type.contains("về trường")) {
        gioiThieuList.add(value);
      }
    });
  }

  // Hàm lấy danh sách tin tức
  List<Map<String, dynamic>> getNewsList() {
    return newsList;
  }

  List<Map<String, dynamic>> getTuyenSinhList() {
    return tuyenSinhList;
  }

  List<Map<String, dynamic>> getGiaoDucList() {
    return giaoDucList;
  }

  List<Map<String, dynamic>> getGioiThieuList() {
    return gioiThieuList;
  }
  // Hàm lấy tin tức theo ID
  Map<String, dynamic>? getNewsById(String id) {
    return news[id];
  }

  // Controller: Kiểm tra trong controller xem bạn có lấy đúng dữ liệu hay không.
  String getValidImageUrl(String newsId) {
    if (news.containsKey(newsId)) {
      var newsData = news[newsId]; // Lấy tin tức từ news với newsId
      print('Found news data: $newsData');  // Debug xem dữ liệu có đúng không
      var subtitles = newsData['subtitles'];
      print('Found subtitles: $subtitles');

      for (var subtitle in subtitles) {
        String imageUrl = subtitle['imageUrl'];
        print('Checking imageUrl: $imageUrl');
        // Kiểm tra imageUrl không phải "none" và không rỗng
        if (imageUrl != null && imageUrl != 'none' && imageUrl.isNotEmpty) {
          return imageUrl;
        }
      }
    }
    return ''; // Trả về chuỗi rỗng nếu không có imageUrl hợp lệ
  }
}


