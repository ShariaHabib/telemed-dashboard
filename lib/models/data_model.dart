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
        banners!.add(new Banners.fromJson(v));
      });
    }
    if (json['prescriptions'] != null) {
      prescriptions = <Prescriptions>[];
      json['prescriptions'].forEach((v) {
        prescriptions!.add(new Prescriptions.fromJson(v));
      });
    }
    if (json['medicines'] != null) {
      medicines = <Medicines>[];
      json['medicines'].forEach((v) {
        medicines!.add(new Medicines.fromJson(v));
      });
    }
    investigationReports = json['investigation_reports'] != null
        ? new InvestigationReports.fromJson(json['investigation_reports'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataModelDataModel = new Map<String, dynamic>();
    dataModelDataModel['status'] = this.status;
    dataModelDataModel['message'] = this.message;
    if (this.banners != null) {
      dataModelDataModel['banners'] =
          this.banners!.map((v) => v.toJson()).toList();
    }
    if (this.prescriptions != null) {
      dataModelDataModel['prescriptions'] =
          this.prescriptions!.map((v) => v.toJson()).toList();
    }
    if (this.medicines != null) {
      dataModelDataModel['medicines'] =
          this.medicines!.map((v) => v.toJson()).toList();
    }
    if (this.investigationReports != null) {
      dataModelDataModel['investigation_reports'] =
          this.investigationReports!.toJson();
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
    final Map<String, dynamic> dataModelDataModel = new Map<String, dynamic>();
    dataModelDataModel['pk_no'] = this.pkNo;
    dataModelDataModel['title'] = this.title;
    dataModelDataModel['image'] = this.image;
    dataModelDataModel['description'] = this.description;
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
    final Map<String, dynamic> dataModelDataModel = new Map<String, dynamic>();
    dataModelDataModel['prescription_no_pk'] = this.prescriptionNoPk;
    dataModelDataModel['patient_no_fk'] = this.patientNoFk;
    dataModelDataModel['patient_name'] = this.patientName;
    dataModelDataModel['service_number'] = this.serviceNumber;
    dataModelDataModel['patient_code'] = this.patientCode;
    dataModelDataModel['prescription_date'] = this.prescriptionDate;
    dataModelDataModel['pat_relation'] = this.patRelation;
    dataModelDataModel['prescription_url'] = this.prescriptionUrl;
    dataModelDataModel['prescription_download_url'] =
        this.prescriptionDownloadUrl;
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
    final Map<String, dynamic> dataModelDataModel = new Map<String, dynamic>();
    dataModelDataModel['prescription_med_no_pk'] = this.prescriptionMedNoPk;
    dataModelDataModel['prescription_no_fk'] = this.prescriptionNoFk;
    dataModelDataModel['item_no_fk'] = this.itemNoFk;
    dataModelDataModel['item_name'] = this.itemName;
    dataModelDataModel['dosage'] = this.dosage;
    dataModelDataModel['duration'] = this.duration;
    dataModelDataModel['instruction_take'] = this.instructionTake;
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
        pathelogies!.add(new Pathelogies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataModelDataModel = new Map<String, dynamic>();
    if (this.pathelogies != null) {
      dataModelDataModel['pathelogies'] =
          this.pathelogies!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> dataModelDataModel = new Map<String, dynamic>();
    dataModelDataModel['lab_no_pk'] = this.labNoPk;
    dataModelDataModel['lab_code'] = this.labCode;
    dataModelDataModel['item_name'] = this.itemName;
    dataModelDataModel['patient_no_fk'] = this.patientNoFk;
    dataModelDataModel['service_number'] = this.serviceNumber;
    dataModelDataModel['url'] = this.url;
    dataModelDataModel['report_no_fk'] = this.reportNoFk;
    dataModelDataModel['au_entry_hospital_pk_no'] = this.auEntryHospitalPkNo;
    dataModelDataModel['patient_name'] = this.patientName;
    dataModelDataModel['patient_code'] = this.patientCode;
    dataModelDataModel['dept'] = this.dept;
    dataModelDataModel['report_url'] = this.reportUrl;
    dataModelDataModel['report_url_download'] = this.reportUrlDownload;
    return dataModelDataModel;
  }
}
