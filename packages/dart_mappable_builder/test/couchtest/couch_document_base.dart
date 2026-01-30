import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'couch_document_base.mapper.dart';

/// Hook is needed, so toJson gives correct result wheather rawData or not used
/// Design-docs need to get an induced doc_type
class CouchDocumentBaseRawHook extends MappingHook {
  const CouchDocumentBaseRawHook();

  @override
  Object? beforeDecode(Object? value) {
    if (value is Map) {
      if (value.keys.contains("_id") &&
          value['_id'].toString().startsWith('_design/')) {
        // Only treat as DesignDocument if it has JavaScript views (language != 'query')
        // Mango indexes have language='query' and should be CouchDocumentBase with unmappedProps
        // this is important for index documents, as they shall not be treated as DesignDocument but IndexDocument
        // therefor no doc_type -> CouchDocumentBase parses it with unmappedProps which keeps the index-specific fields
        if (value['language'] != 'query') {
          value['!doc_type'] = '_design_doc';
        }
      } else if (value['_deleted'] == true) {
        value['!doc_type'] = '!deleted_document';
      }
    }
    return value;
  }

  @override
  Object? afterEncode(Object? value) {
    if (value is Map) {
      if (value.keys.contains("_id") &&
              value['_id'].toString().startsWith('_design/') ||
          value['_deleted'] == true) {
        value.remove('!doc_type');
      }
      // _revisions and _revs_info is not for saving...
      value.remove('_revisions');
      value.remove('_revs_info');
      // attachments also not!
      // value.remove('_attachments');

      // delete if false, as CouchDB only stores if true
      if (value['_deleted'] == false) {
        value.remove('_deleted');
      }
    }
    return value;
  }
}

@MappableClass(
  discriminatorKey: '!doc_type',
  ignoreNull: true,
  hook: ChainedHook([
    CouchDocumentBaseRawHook(),
    UnmappedPropertiesHook('unmappedProps'),
  ]),
)
class CouchDocumentBase with CouchDocumentBaseMappable {
  /// The document ID.
  @MappableField(key: '_id')
  final String? id;

  /// The document revision.
  @MappableField(key: '_rev')
  final String? rev;

  /// is either null or true
  @MappableField(key: '_deleted')
  final bool deleted;

  @MappableField(key: '_attachments')
  final Map<String, AttachmentInfo>? attachments;

  @MappableField(key: '_revisions')
  final Revisions? revisions;

  @MappableField(key: '_revs_info')
  final List<RevsInfo>? revsInfo;

  Map<String, dynamic> unmappedProps;

  CouchDocumentBase({
    this.id,
    this.rev,
    this.deleted = false,
    this.attachments,
    this.revisions,
    this.revsInfo,
    this.unmappedProps = const {},
  });

  static final fromMap = CouchDocumentBaseMapper.fromMap;
  static final fromJson = CouchDocumentBaseMapper.fromJson;

  int getVersionFromRev() {
    return getVersionFromRevS(rev);
  }

  static int getVersionFromRevS(String? rev) {
    return rev != null ? int.parse(rev.split('-').first) : -1;
  }
}

@MappableClass()
class AttachmentInfo with AttachmentInfoMappable {
  @MappableField(key: 'content_type')
  final String contentType;

  /// docs rev prefix when the attachment was added or updated
  final int revpos;

  /// The [digest] field is a hash identifier for the attachment's binary content.
  ///
  /// CouchDB uses this value to detect duplicate or unchanged attachments.
  /// It is automatically computed by CouchDB (typically an MD5 hash) and
  /// formatted as `<algorithm>-<base64digest>`, e.g. `"md5-9tI8aWcZ+VbO0Fh4KqkM3A=="`.
  ///
  /// This digest ensures attachment integrity and allows CouchDB to avoid
  /// re-storing identical binary data across documents or revisions.
  final String digest;

  /// data is set if the attachment IS requested
  final String? data;

  /// length is set if the attachment IS NOT requested
  final int? length;

  /// The `stub` field indicates whether the attachment data is included inline
  /// in the document or omitted as a placeholder.
  ///
  /// When `stub` is `true`, the attachment exists on the server, but its binary
  /// data is not included in the current document response. This helps reduce
  /// payload size when fetching documents without `attachments=true`.
  ///
  /// Use this flag to detect that the attachment is stored remotely and must be
  /// retrieved separately (e.g., via `GET /db/docid/attachmentName`).
  final bool? stub;

  AttachmentInfo({
    required this.contentType,
    required this.revpos,
    required this.digest,
    this.data,
    this.length,
    this.stub,
  });

  Uint8List? get dataDecoded => data != null ? base64Decode(data!) : null;

  String get digestDecoded {
    final List<String> parts = digest.split(('-'));
    assert(parts.length == 2);
    assert(parts[0] == 'md5');

    // Remove the "md5-" prefix
    final base64Part = parts[1];

    // Decode base64 to raw bytes
    final md5Bytes = base64.decode(base64Part);

    // Convert bytes to hex string
    final md5Hex = md5Bytes
        .map((b) => b.toRadixString(16).padLeft(2, '0'))
        .join();

    return md5Hex;
  }

  static String calculateCouchDbAttachmentDigest(Uint8List data) {
    // Prefix with 'md5-' as CouchDB requires and convert to hex String
    return 'md5-${base64Encode(md5.convert(data).bytes)}';
  }

  static Uint8List calculateCouchDbAttachmentDigestFromString(String data) {
    List<String> parts = data.split('-');
    assert(parts.length == 2);
    assert(parts[0] == 'md5');
    return base64Decode(parts[1]);
  }

  static final fromMap = AttachmentInfoMapper.fromMap;
  static final fromJson = AttachmentInfoMapper.fromJson;
}

@MappableClass()
class Revisions with RevisionsMappable {
  final int start;
  final List<String> ids;

  Revisions({required this.start, required this.ids});

  /// The List ids only contains the Hash-Values.
  /// To get a rev-number from this, the revision has to be prepended
  /// to that hash.
  String getRev(int i) {
    return "${start - i}-${ids[i]}";
  }

  int getVersion(int i) {
    return start - i;
  }
}

@MappableEnum(mode: ValuesMode.named)
enum RevsInfoStatus { available, missing, deleted }

@MappableClass()
class RevsInfo with RevsInfoMappable {
  final String rev;
  final RevsInfoStatus status;

  RevsInfo({required this.rev, required this.status});
}
