class DataModel {
  bool? status;
  String? message;
  List<Banners>? banners;
  List<Prescriptions>? prescriptions;
  List<Medicines>? medicines;
  InvestigationReports? investigationReports;

  DataModel(
      {this.status,
      this.message,
      this.banners,
      this.prescriptions,
      this.medicines,
      this.investigationReports});

  DataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(Banners.fromJson(v));
      });
    }
    if (json['prescriptions'] != null) {
      prescriptions = <Prescriptions>[];
      json['prescriptions'].forEach((v) {
        prescriptions!.add(Prescriptions.fromJson(v));
      });
    }
    if (json['medicines'] != null) {
      medicines = <Medicines>[];
      json['medicines'].forEach((v) {
        medicines!.add(Medicines.fromJson(v));
      });
    }
    investigationReports = json['investigation_reports'] != null
        ? InvestigationReports.fromJson(json['investigation_reports'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataModelDataModel = <String, dynamic>{};
    dataModelDataModel['status'] = status;
    dataModelDataModel['message'] = message;
    if (banners != null) {
      dataModelDataModel['banners'] =
          banners!.map((v) => v.toJson()).toList();
    }
    if (prescriptions != null) {
      dataModelDataModel['prescriptions'] =
          prescriptions!.map((v) => v.toJson()).toList();
    }
    if (medicines != null) {
      dataModelDataModel['medicines'] =
          medicines!.map((v) => v.toJson()).toList();
    }
    if (investigationReports != null) {
      dataModelDataModel['investigation_reports'] =
          investigationReports!.toJson();
    }
    return dataModelDataModel;
  }
}

class Banners {
  String? pkNo;
  String? title;
  String? image;
  String? description;

  Banners({this.pkNo, this.title, this.image, this.description});

  Banners.fromJson(Map<String, dynamic> json) {
    pkNo = json['pk_no'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataModelDataModel = <String, dynamic>{};
    dataModelDataModel['pk_no'] = pkNo;
    dataModelDataModel['title'] = title;
    dataModelDataModel['image'] = image;
    dataModelDataModel['description'] = description;
    return dataModelDataModel;
  }
}

class Prescriptions {
  String? prescriptionNoPk;
  String? patientNoFk;
  String? patientName;
  String? serviceNumber;
  String? patientCode;
  String? prescriptionDate;
  String? patRelation;
  String? prescriptionUrl;
  String? prescriptionDownloadUrl;

  Prescriptions(
      {this.prescriptionNoPk,
      this.patientNoFk,
      this.patientName,
      this.serviceNumber,
      this.patientCode,
      this.prescriptionDate,
      this.patRelation,
      this.prescriptionUrl,
      this.prescriptionDownloadUrl});

  Prescriptions.fromJson(Map<String, dynamic> json) {
    prescriptionNoPk = json['prescription_no_pk'];
    patientNoFk = json['patient_no_fk'];
    patientName = json['patient_name'];
    serviceNumber = json['service_number'];
    patientCode = json['patient_code'];
    prescriptionDate = json['prescription_date'];
    patRelation = json['pat_relation'];
    prescriptionUrl = json['prescription_url'];
    prescriptionDownloadUrl = json['prescription_download_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataModelDataModel = <String, dynamic>{};
    dataModelDataModel['prescription_no_pk'] = prescriptionNoPk;
    dataModelDataModel['patient_no_fk'] = patientNoFk;
    dataModelDataModel['patient_name'] = patientName;
    dataModelDataModel['service_number'] = serviceNumber;
    dataModelDataModel['patient_code'] = patientCode;
    dataModelDataModel['prescription_date'] = prescriptionDate;
    dataModelDataModel['pat_relation'] = patRelation;
    dataModelDataModel['prescription_url'] = prescriptionUrl;
    dataModelDataModel['prescription_download_url'] =
        prescriptionDownloadUrl;
    return dataModelDataModel;
  }
}

class Medicines {
  String? prescriptionMedNoPk;
  String? prescriptionNoFk;
  String? itemNoFk;
  String? itemName;
  String? dosage;
  String? duration;
  String? instructionTake;

  Medicines(
      {this.prescriptionMedNoPk,
      this.prescriptionNoFk,
      this.itemNoFk,
      this.itemName,
      this.dosage,
      this.duration,
      this.instructionTake});

  Medicines.fromJson(Map<String, dynamic> json) {
    prescriptionMedNoPk = json['prescription_med_no_pk'];
    prescriptionNoFk = json['prescription_no_fk'];
    itemNoFk = json['item_no_fk'];
    itemName = json['item_name'];
    dosage = json['dosage'];
    duration = json['duration'];
    instructionTake = json['instruction_take'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataModelDataModel = <String, dynamic>{};
    dataModelDataModel['prescription_med_no_pk'] = prescriptionMedNoPk;
    dataModelDataModel['prescription_no_fk'] = prescriptionNoFk;
    dataModelDataModel['item_no_fk'] = itemNoFk;
    dataModelDataModel['item_name'] = itemName;
    dataModelDataModel['dosage'] = dosage;
    dataModelDataModel['duration'] = duration;
    dataModelDataModel['instruction_take'] = instructionTake;
    return dataModelDataModel;
  }
}

class InvestigationReports {
  List<Pathelogies>? pathelogies;
  List<Null>? radiologies;

  InvestigationReports({this.pathelogies, this.radiologies});

  InvestigationReports.fromJson(Map<String, dynamic> json) {
    if (json['pathelogies'] != null) {
      pathelogies = <Pathelogies>[];
      json['pathelogies'].forEach((v) {
        pathelogies!.add(Pathelogies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataModelDataModel = <String, dynamic>{};
    if (pathelogies != null) {
      dataModelDataModel['pathelogies'] =
          pathelogies!.map((v) => v.toJson()).toList();
    }
    return dataModelDataModel;
  }
}

class Pathelogies {
  String? labNoPk;
  String? labCode;
  String? itemName;
  String? patientNoFk;
  String? serviceNumber;
  String? url;
  String? reportNoFk;
  String? auEntryHospitalPkNo;
  String? patientName;
  String? patientCode;
  String? dept;
  String? reportUrl;
  String? reportUrlDownload;

  Pathelogies(
      {this.labNoPk,
      this.labCode,
      this.itemName,
      this.patientNoFk,
      this.serviceNumber,
      this.url,
      this.reportNoFk,
      this.auEntryHospitalPkNo,
      this.patientName,
      this.patientCode,
      this.dept,
      this.reportUrl,
      this.reportUrlDownload});

  Pathelogies.fromJson(Map<String, dynamic> json) {
    labNoPk = json['lab_no_pk'];
    labCode = json['lab_code'];
    itemName = json['item_name'];
    patientNoFk = json['patient_no_fk'];
    serviceNumber = json['service_number'];
    url = json['url'];
    reportNoFk = json['report_no_fk'];
    auEntryHospitalPkNo = json['au_entry_hospital_pk_no'];
    patientName = json['patient_name'];
    patientCode = json['patient_code'];
    dept = json['dept'];
    reportUrl = json['report_url'];
    reportUrlDownload = json['report_url_download'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataModelDataModel = <String, dynamic>{};
    dataModelDataModel['lab_no_pk'] = labNoPk;
    dataModelDataModel['lab_code'] = labCode;
    dataModelDataModel['item_name'] = itemName;
    dataModelDataModel['patient_no_fk'] = patientNoFk;
    dataModelDataModel['service_number'] = serviceNumber;
    dataModelDataModel['url'] = url;
    dataModelDataModel['report_no_fk'] = reportNoFk;
    dataModelDataModel['au_entry_hospital_pk_no'] = auEntryHospitalPkNo;
    dataModelDataModel['patient_name'] = patientName;
    dataModelDataModel['patient_code'] = patientCode;
    dataModelDataModel['dept'] = dept;
    dataModelDataModel['report_url'] = reportUrl;
    dataModelDataModel['report_url_download'] = reportUrlDownload;
    return dataModelDataModel;
  }
}
