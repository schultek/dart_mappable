import 'package:dart_mappable/dart_mappable.dart';

import 'couch_document_base.dart';

part 'datatypes.mapper.dart';

@MappableClass(discriminatorValue: "media_base")
abstract class MediaBase extends CouchDocumentBase with MediaBaseMappable {
  final String? parent;
  final int sortHint;

  final String name;

  MediaBase({
    this.parent,
    required this.sortHint,
    required this.name,
    super.id,
    super.attachments,
    super.deleted,
    super.rev,
    super.revisions,
    super.revsInfo,
    super.unmappedProps,
  });

  static final fromMap = MediaBaseMapper.fromMap;
  static final fromJson = MediaBaseMapper.fromJson;
}

@MappableClass(discriminatorValue: 'media_folder')
class MediaFolder extends MediaBase with MediaFolderMappable {
  MediaFolder({
    super.parent,
    required super.sortHint,
    required super.name,
    super.id,
    super.attachments,
    super.deleted,
    super.rev,
    super.revisions,
    super.revsInfo,
    super.unmappedProps,
  });

  static final fromMap = MediaFolderMapper.fromMap;
  static final fromJson = MediaFolderMapper.fromJson;

  @override
  String toString() {
    return 'MediaFolder(name: $name, parent: $parent, sortHint: $sortHint)';
  }
}

/// The attachments contain the media files
/// The contentType gives us the stored type:
/// | Format                 | File extension | `content_type`                          |
/// | ---------------------- | -------------- | --------------------------------------- |
/// | MP3                    | `.mp3`         | `audio/mpeg`                            |
/// | WAV                    | `.wav`         | `audio/wav` *(sometimes `audio/x-wav`)* |
/// | FLAC                   | `.flac`        | `audio/flac`                            |
/// | AAC                    | `.aac`         | `audio/aac`                             |
/// | AAC (in MP4 container) | `.m4a`         | `audio/mp4`                             |
///
/// The media-List gives the order in which the attachments should be used.
/// The Attachments have uuids as names.
@MappableClass(discriminatorValue: 'media_item')
class MediaItem extends MediaBase with MediaItemMappable {
  final List<String> media;

  MediaItem({
    super.parent,
    required super.sortHint,
    required super.name,
    required this.media,
    super.id,
    super.attachments,
    super.deleted,
    super.rev,
    super.revisions,
    super.revsInfo,
    super.unmappedProps,
  });

  static final fromMap = MediaItemMapper.fromMap;
  static final fromJson = MediaItemMapper.fromJson;
}

@MappableClass()
class MediaAttachment with MediaAttachmentMappable {
  final String name;

  @MappableField(key: 'attachment_id')
  final String attachmentId;

  MediaAttachment({required this.name, required this.attachmentId});
}
