// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'couch_document_base.dart';

class RevsInfoStatusMapper extends EnumMapper<RevsInfoStatus> {
  RevsInfoStatusMapper._();

  static RevsInfoStatusMapper? _instance;
  static RevsInfoStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RevsInfoStatusMapper._());
    }
    return _instance!;
  }

  static RevsInfoStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  RevsInfoStatus decode(dynamic value) {
    switch (value) {
      case r'available':
        return RevsInfoStatus.available;
      case r'missing':
        return RevsInfoStatus.missing;
      case r'deleted':
        return RevsInfoStatus.deleted;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(RevsInfoStatus self) {
    switch (self) {
      case RevsInfoStatus.available:
        return r'available';
      case RevsInfoStatus.missing:
        return r'missing';
      case RevsInfoStatus.deleted:
        return r'deleted';
    }
  }
}

extension RevsInfoStatusMapperExtension on RevsInfoStatus {
  String toValue() {
    RevsInfoStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<RevsInfoStatus>(this) as String;
  }
}

class CouchDocumentBaseMapper extends ClassMapperBase<CouchDocumentBase> {
  CouchDocumentBaseMapper._();

  static CouchDocumentBaseMapper? _instance;
  static CouchDocumentBaseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CouchDocumentBaseMapper._());
      AttachmentInfoMapper.ensureInitialized();
      RevisionsMapper.ensureInitialized();
      RevsInfoMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CouchDocumentBase';

  static String? _$id(CouchDocumentBase v) => v.id;
  static const Field<CouchDocumentBase, String> _f$id = Field(
    'id',
    _$id,
    key: r'_id',
    opt: true,
  );
  static String? _$rev(CouchDocumentBase v) => v.rev;
  static const Field<CouchDocumentBase, String> _f$rev = Field(
    'rev',
    _$rev,
    key: r'_rev',
    opt: true,
  );
  static bool _$deleted(CouchDocumentBase v) => v.deleted;
  static const Field<CouchDocumentBase, bool> _f$deleted = Field(
    'deleted',
    _$deleted,
    key: r'_deleted',
    opt: true,
    def: false,
  );
  static Map<String, AttachmentInfo>? _$attachments(CouchDocumentBase v) =>
      v.attachments;
  static const Field<CouchDocumentBase, Map<String, AttachmentInfo>>
  _f$attachments = Field(
    'attachments',
    _$attachments,
    key: r'_attachments',
    opt: true,
  );
  static Revisions? _$revisions(CouchDocumentBase v) => v.revisions;
  static const Field<CouchDocumentBase, Revisions> _f$revisions = Field(
    'revisions',
    _$revisions,
    key: r'_revisions',
    opt: true,
  );
  static List<RevsInfo>? _$revsInfo(CouchDocumentBase v) => v.revsInfo;
  static const Field<CouchDocumentBase, List<RevsInfo>> _f$revsInfo = Field(
    'revsInfo',
    _$revsInfo,
    key: r'_revs_info',
    opt: true,
  );
  static Map<String, dynamic> _$unmappedProps(CouchDocumentBase v) =>
      v.unmappedProps;
  static const Field<CouchDocumentBase, Map<String, dynamic>> _f$unmappedProps =
      Field('unmappedProps', _$unmappedProps, opt: true, def: const {});

  @override
  final MappableFields<CouchDocumentBase> fields = const {
    #id: _f$id,
    #rev: _f$rev,
    #deleted: _f$deleted,
    #attachments: _f$attachments,
    #revisions: _f$revisions,
    #revsInfo: _f$revsInfo,
    #unmappedProps: _f$unmappedProps,
  };
  @override
  final bool ignoreNull = true;

  @override
  final MappingHook hook = const ChainedHook([
    CouchDocumentBaseRawHook(),
    UnmappedPropertiesHook('unmappedProps'),
  ]);
  static CouchDocumentBase _instantiate(DecodingData data) {
    return CouchDocumentBase(
      id: data.dec(_f$id),
      rev: data.dec(_f$rev),
      deleted: data.dec(_f$deleted),
      attachments: data.dec(_f$attachments),
      revisions: data.dec(_f$revisions),
      revsInfo: data.dec(_f$revsInfo),
      unmappedProps: data.dec(_f$unmappedProps),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CouchDocumentBase fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CouchDocumentBase>(map);
  }

  static CouchDocumentBase fromJson(String json) {
    return ensureInitialized().decodeJson<CouchDocumentBase>(json);
  }
}

mixin CouchDocumentBaseMappable {
  String toJson() {
    return CouchDocumentBaseMapper.ensureInitialized()
        .encodeJson<CouchDocumentBase>(this as CouchDocumentBase);
  }

  Map<String, dynamic> toMap() {
    return CouchDocumentBaseMapper.ensureInitialized()
        .encodeMap<CouchDocumentBase>(this as CouchDocumentBase);
  }

  CouchDocumentBaseCopyWith<
    CouchDocumentBase,
    CouchDocumentBase,
    CouchDocumentBase
  >
  get copyWith =>
      _CouchDocumentBaseCopyWithImpl<CouchDocumentBase, CouchDocumentBase>(
        this as CouchDocumentBase,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CouchDocumentBaseMapper.ensureInitialized().stringifyValue(
      this as CouchDocumentBase,
    );
  }

  @override
  bool operator ==(Object other) {
    return CouchDocumentBaseMapper.ensureInitialized().equalsValue(
      this as CouchDocumentBase,
      other,
    );
  }

  @override
  int get hashCode {
    return CouchDocumentBaseMapper.ensureInitialized().hashValue(
      this as CouchDocumentBase,
    );
  }
}

extension CouchDocumentBaseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CouchDocumentBase, $Out> {
  CouchDocumentBaseCopyWith<$R, CouchDocumentBase, $Out>
  get $asCouchDocumentBase => $base.as(
    (v, t, t2) => _CouchDocumentBaseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class CouchDocumentBaseCopyWith<
  $R,
  $In extends CouchDocumentBase,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<
    $R,
    String,
    AttachmentInfo,
    AttachmentInfoCopyWith<$R, AttachmentInfo, AttachmentInfo>
  >?
  get attachments;
  RevisionsCopyWith<$R, Revisions, Revisions>? get revisions;
  ListCopyWith<$R, RevsInfo, RevsInfoCopyWith<$R, RevsInfo, RevsInfo>>?
  get revsInfo;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
  get unmappedProps;
  $R call({
    String? id,
    String? rev,
    bool? deleted,
    Map<String, AttachmentInfo>? attachments,
    Revisions? revisions,
    List<RevsInfo>? revsInfo,
    Map<String, dynamic>? unmappedProps,
  });
  CouchDocumentBaseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CouchDocumentBaseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CouchDocumentBase, $Out>
    implements CouchDocumentBaseCopyWith<$R, CouchDocumentBase, $Out> {
  _CouchDocumentBaseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CouchDocumentBase> $mapper =
      CouchDocumentBaseMapper.ensureInitialized();
  @override
  MapCopyWith<
    $R,
    String,
    AttachmentInfo,
    AttachmentInfoCopyWith<$R, AttachmentInfo, AttachmentInfo>
  >?
  get attachments => $value.attachments != null
      ? MapCopyWith(
          $value.attachments!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(attachments: v),
        )
      : null;
  @override
  RevisionsCopyWith<$R, Revisions, Revisions>? get revisions =>
      $value.revisions?.copyWith.$chain((v) => call(revisions: v));
  @override
  ListCopyWith<$R, RevsInfo, RevsInfoCopyWith<$R, RevsInfo, RevsInfo>>?
  get revsInfo => $value.revsInfo != null
      ? ListCopyWith(
          $value.revsInfo!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(revsInfo: v),
        )
      : null;
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
  get unmappedProps => MapCopyWith(
    $value.unmappedProps,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(unmappedProps: v),
  );
  @override
  $R call({
    Object? id = $none,
    Object? rev = $none,
    bool? deleted,
    Object? attachments = $none,
    Object? revisions = $none,
    Object? revsInfo = $none,
    Map<String, dynamic>? unmappedProps,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (rev != $none) #rev: rev,
      if (deleted != null) #deleted: deleted,
      if (attachments != $none) #attachments: attachments,
      if (revisions != $none) #revisions: revisions,
      if (revsInfo != $none) #revsInfo: revsInfo,
      if (unmappedProps != null) #unmappedProps: unmappedProps,
    }),
  );
  @override
  CouchDocumentBase $make(CopyWithData data) => CouchDocumentBase(
    id: data.get(#id, or: $value.id),
    rev: data.get(#rev, or: $value.rev),
    deleted: data.get(#deleted, or: $value.deleted),
    attachments: data.get(#attachments, or: $value.attachments),
    revisions: data.get(#revisions, or: $value.revisions),
    revsInfo: data.get(#revsInfo, or: $value.revsInfo),
    unmappedProps: data.get(#unmappedProps, or: $value.unmappedProps),
  );

  @override
  CouchDocumentBaseCopyWith<$R2, CouchDocumentBase, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CouchDocumentBaseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AttachmentInfoMapper extends ClassMapperBase<AttachmentInfo> {
  AttachmentInfoMapper._();

  static AttachmentInfoMapper? _instance;
  static AttachmentInfoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AttachmentInfoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AttachmentInfo';

  static String _$contentType(AttachmentInfo v) => v.contentType;
  static const Field<AttachmentInfo, String> _f$contentType = Field(
    'contentType',
    _$contentType,
    key: r'content_type',
  );
  static int _$revpos(AttachmentInfo v) => v.revpos;
  static const Field<AttachmentInfo, int> _f$revpos = Field('revpos', _$revpos);
  static String _$digest(AttachmentInfo v) => v.digest;
  static const Field<AttachmentInfo, String> _f$digest = Field(
    'digest',
    _$digest,
  );
  static String? _$data(AttachmentInfo v) => v.data;
  static const Field<AttachmentInfo, String> _f$data = Field(
    'data',
    _$data,
    opt: true,
  );
  static int? _$length(AttachmentInfo v) => v.length;
  static const Field<AttachmentInfo, int> _f$length = Field(
    'length',
    _$length,
    opt: true,
  );
  static bool? _$stub(AttachmentInfo v) => v.stub;
  static const Field<AttachmentInfo, bool> _f$stub = Field(
    'stub',
    _$stub,
    opt: true,
  );

  @override
  final MappableFields<AttachmentInfo> fields = const {
    #contentType: _f$contentType,
    #revpos: _f$revpos,
    #digest: _f$digest,
    #data: _f$data,
    #length: _f$length,
    #stub: _f$stub,
  };

  static AttachmentInfo _instantiate(DecodingData data) {
    return AttachmentInfo(
      contentType: data.dec(_f$contentType),
      revpos: data.dec(_f$revpos),
      digest: data.dec(_f$digest),
      data: data.dec(_f$data),
      length: data.dec(_f$length),
      stub: data.dec(_f$stub),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AttachmentInfo fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AttachmentInfo>(map);
  }

  static AttachmentInfo fromJson(String json) {
    return ensureInitialized().decodeJson<AttachmentInfo>(json);
  }
}

mixin AttachmentInfoMappable {
  String toJson() {
    return AttachmentInfoMapper.ensureInitialized().encodeJson<AttachmentInfo>(
      this as AttachmentInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return AttachmentInfoMapper.ensureInitialized().encodeMap<AttachmentInfo>(
      this as AttachmentInfo,
    );
  }

  AttachmentInfoCopyWith<AttachmentInfo, AttachmentInfo, AttachmentInfo>
  get copyWith => _AttachmentInfoCopyWithImpl<AttachmentInfo, AttachmentInfo>(
    this as AttachmentInfo,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return AttachmentInfoMapper.ensureInitialized().stringifyValue(
      this as AttachmentInfo,
    );
  }

  @override
  bool operator ==(Object other) {
    return AttachmentInfoMapper.ensureInitialized().equalsValue(
      this as AttachmentInfo,
      other,
    );
  }

  @override
  int get hashCode {
    return AttachmentInfoMapper.ensureInitialized().hashValue(
      this as AttachmentInfo,
    );
  }
}

extension AttachmentInfoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AttachmentInfo, $Out> {
  AttachmentInfoCopyWith<$R, AttachmentInfo, $Out> get $asAttachmentInfo =>
      $base.as((v, t, t2) => _AttachmentInfoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AttachmentInfoCopyWith<$R, $In extends AttachmentInfo, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? contentType,
    int? revpos,
    String? digest,
    String? data,
    int? length,
    bool? stub,
  });
  AttachmentInfoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AttachmentInfoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AttachmentInfo, $Out>
    implements AttachmentInfoCopyWith<$R, AttachmentInfo, $Out> {
  _AttachmentInfoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AttachmentInfo> $mapper =
      AttachmentInfoMapper.ensureInitialized();
  @override
  $R call({
    String? contentType,
    int? revpos,
    String? digest,
    Object? data = $none,
    Object? length = $none,
    Object? stub = $none,
  }) => $apply(
    FieldCopyWithData({
      if (contentType != null) #contentType: contentType,
      if (revpos != null) #revpos: revpos,
      if (digest != null) #digest: digest,
      if (data != $none) #data: data,
      if (length != $none) #length: length,
      if (stub != $none) #stub: stub,
    }),
  );
  @override
  AttachmentInfo $make(CopyWithData data) => AttachmentInfo(
    contentType: data.get(#contentType, or: $value.contentType),
    revpos: data.get(#revpos, or: $value.revpos),
    digest: data.get(#digest, or: $value.digest),
    data: data.get(#data, or: $value.data),
    length: data.get(#length, or: $value.length),
    stub: data.get(#stub, or: $value.stub),
  );

  @override
  AttachmentInfoCopyWith<$R2, AttachmentInfo, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AttachmentInfoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RevisionsMapper extends ClassMapperBase<Revisions> {
  RevisionsMapper._();

  static RevisionsMapper? _instance;
  static RevisionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RevisionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Revisions';

  static int _$start(Revisions v) => v.start;
  static const Field<Revisions, int> _f$start = Field('start', _$start);
  static List<String> _$ids(Revisions v) => v.ids;
  static const Field<Revisions, List<String>> _f$ids = Field('ids', _$ids);

  @override
  final MappableFields<Revisions> fields = const {
    #start: _f$start,
    #ids: _f$ids,
  };

  static Revisions _instantiate(DecodingData data) {
    return Revisions(start: data.dec(_f$start), ids: data.dec(_f$ids));
  }

  @override
  final Function instantiate = _instantiate;

  static Revisions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Revisions>(map);
  }

  static Revisions fromJson(String json) {
    return ensureInitialized().decodeJson<Revisions>(json);
  }
}

mixin RevisionsMappable {
  String toJson() {
    return RevisionsMapper.ensureInitialized().encodeJson<Revisions>(
      this as Revisions,
    );
  }

  Map<String, dynamic> toMap() {
    return RevisionsMapper.ensureInitialized().encodeMap<Revisions>(
      this as Revisions,
    );
  }

  RevisionsCopyWith<Revisions, Revisions, Revisions> get copyWith =>
      _RevisionsCopyWithImpl<Revisions, Revisions>(
        this as Revisions,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RevisionsMapper.ensureInitialized().stringifyValue(
      this as Revisions,
    );
  }

  @override
  bool operator ==(Object other) {
    return RevisionsMapper.ensureInitialized().equalsValue(
      this as Revisions,
      other,
    );
  }

  @override
  int get hashCode {
    return RevisionsMapper.ensureInitialized().hashValue(this as Revisions);
  }
}

extension RevisionsValueCopy<$R, $Out> on ObjectCopyWith<$R, Revisions, $Out> {
  RevisionsCopyWith<$R, Revisions, $Out> get $asRevisions =>
      $base.as((v, t, t2) => _RevisionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RevisionsCopyWith<$R, $In extends Revisions, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get ids;
  $R call({int? start, List<String>? ids});
  RevisionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RevisionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Revisions, $Out>
    implements RevisionsCopyWith<$R, Revisions, $Out> {
  _RevisionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Revisions> $mapper =
      RevisionsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get ids =>
      ListCopyWith(
        $value.ids,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(ids: v),
      );
  @override
  $R call({int? start, List<String>? ids}) => $apply(
    FieldCopyWithData({
      if (start != null) #start: start,
      if (ids != null) #ids: ids,
    }),
  );
  @override
  Revisions $make(CopyWithData data) => Revisions(
    start: data.get(#start, or: $value.start),
    ids: data.get(#ids, or: $value.ids),
  );

  @override
  RevisionsCopyWith<$R2, Revisions, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RevisionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RevsInfoMapper extends ClassMapperBase<RevsInfo> {
  RevsInfoMapper._();

  static RevsInfoMapper? _instance;
  static RevsInfoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RevsInfoMapper._());
      RevsInfoStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RevsInfo';

  static String _$rev(RevsInfo v) => v.rev;
  static const Field<RevsInfo, String> _f$rev = Field('rev', _$rev);
  static RevsInfoStatus _$status(RevsInfo v) => v.status;
  static const Field<RevsInfo, RevsInfoStatus> _f$status = Field(
    'status',
    _$status,
  );

  @override
  final MappableFields<RevsInfo> fields = const {
    #rev: _f$rev,
    #status: _f$status,
  };

  static RevsInfo _instantiate(DecodingData data) {
    return RevsInfo(rev: data.dec(_f$rev), status: data.dec(_f$status));
  }

  @override
  final Function instantiate = _instantiate;

  static RevsInfo fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RevsInfo>(map);
  }

  static RevsInfo fromJson(String json) {
    return ensureInitialized().decodeJson<RevsInfo>(json);
  }
}

mixin RevsInfoMappable {
  String toJson() {
    return RevsInfoMapper.ensureInitialized().encodeJson<RevsInfo>(
      this as RevsInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return RevsInfoMapper.ensureInitialized().encodeMap<RevsInfo>(
      this as RevsInfo,
    );
  }

  RevsInfoCopyWith<RevsInfo, RevsInfo, RevsInfo> get copyWith =>
      _RevsInfoCopyWithImpl<RevsInfo, RevsInfo>(
        this as RevsInfo,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RevsInfoMapper.ensureInitialized().stringifyValue(this as RevsInfo);
  }

  @override
  bool operator ==(Object other) {
    return RevsInfoMapper.ensureInitialized().equalsValue(
      this as RevsInfo,
      other,
    );
  }

  @override
  int get hashCode {
    return RevsInfoMapper.ensureInitialized().hashValue(this as RevsInfo);
  }
}

extension RevsInfoValueCopy<$R, $Out> on ObjectCopyWith<$R, RevsInfo, $Out> {
  RevsInfoCopyWith<$R, RevsInfo, $Out> get $asRevsInfo =>
      $base.as((v, t, t2) => _RevsInfoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RevsInfoCopyWith<$R, $In extends RevsInfo, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? rev, RevsInfoStatus? status});
  RevsInfoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RevsInfoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RevsInfo, $Out>
    implements RevsInfoCopyWith<$R, RevsInfo, $Out> {
  _RevsInfoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RevsInfo> $mapper =
      RevsInfoMapper.ensureInitialized();
  @override
  $R call({String? rev, RevsInfoStatus? status}) => $apply(
    FieldCopyWithData({
      if (rev != null) #rev: rev,
      if (status != null) #status: status,
    }),
  );
  @override
  RevsInfo $make(CopyWithData data) => RevsInfo(
    rev: data.get(#rev, or: $value.rev),
    status: data.get(#status, or: $value.status),
  );

  @override
  RevsInfoCopyWith<$R2, RevsInfo, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RevsInfoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

