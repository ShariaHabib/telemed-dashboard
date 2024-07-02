class DateConvert {
  static String convertDate(String date) {
    List<String> dateSplit = date.split(" ");
    List<String> dateSplit2 = dateSplit[0].split("-");
    String month = "";
    switch (dateSplit2[1]) {
      case "01":
        month = "জানুয়ারি";
        break;
      case "02":
        month = "ফেব্রুয়ারি";
        break;
      case "03":
        month = "মার্চ";
        break;
      case "04":
        month = "এপ্রিল";
        break;
      case "05":
        month = "মে";
        break;
      case "06":
        month = "জুন";
        break;
      case "07":
        month = "জুলাই";
        break;
      case "08":
        month = "আগস্ট";
        break;
      case "09":
        month = "সেপ্টেম্বর";
        break;
      case "10":
        month = "অক্টোবর";
        break;
      case "11":
        month = "নভেম্বর";
        break;
      case "12":
        month = "ডিসেম্বর";
        break;
      default:
        month = "মাস";
    }
    return "${dateSplit2[2]} $month, ${dateSplit2[0]}";
  }
}
