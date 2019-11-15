import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:dropzone_angular_dart/dropzone_angular_dart.dart';

@Component(
  selector: 'upload-component',
  templateUrl: 'upload.html',
  directives: [DROPZONE_DIRECTIVES, coreDirectives])
class UploadComponent {

  DropzoneConfiguration dropzoneConfiguration = DropzoneConfiguration(
    url: 'http://localhost:8081/upload', addRemoveLinks: true, maxFiles: 1);
  Dropzone dropzone;
  Blob uploadedFile = null;
  String uploadResponse = null;


  UploadComponent();

  void initDropzone(Dropzone dropzone) {
    this.dropzone = dropzone;
    this.dropzone.on("success", success);
  }

  void success(Blob file, String response, Event event) {
    print('success(' + file.toString() + ", " + response + ", " +
      event.toString() + ")");
      uploadedFile = file;
      uploadResponse = response;
  }
}
