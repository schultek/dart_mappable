// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'datatypes.dart';

class MediaBaseMapper extends SubClassMapperBase<MediaBase> {
  MediaBaseMapper._();

  static MediaBaseMapper? _instance;
  static MediaBaseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MediaBaseMapper._());
      CouchDocumentBaseMapper.ensureInitialized().addSubMapper(_instance!);
      MediaFolderMapper.ensureInitialized();
      MediaItemMapper.ensureInitialized();
      AttachmentInfoMapper.ensureInitialized();
      RevisionsMapper.ensureInitialized();
      RevsInfoMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MediaBase';

  static String? _$parent(MediaBase v) => v.parent;
  static const Field<MediaBase, String> _f$parent = Field(
    'parent',
    _$parent,
    opt: true,
  );
  static int _$sortHint(MediaBase v) => v.sortHint;
  static const Field<MediaBase, int> _f$sortHint = Field(
    'sortHint',
    _$sortHint,
  );
  static String _$name(MediaBase v) => v.name;
  static const Field<MediaBase, String> _f$name = Field('name', _$name);
  static String? _$id(MediaBase v) => v.id;
  static const Field<MediaBase, String> _f$id = Field(
    'id',
    _$id,
    key: r'_id',
    opt: true,
  );
  static Map<String, AttachmentInfo>? _$attachments(MediaBase v) =>
      v.attachments;
  static const Field<MediaBase, Map<String, AttachmentInfo>> _f$attachments =
      Field('attachments', _$attachments, key: r'_attachments', opt: true);
  static bool _$deleted(MediaBase v) => v.deleted;
  static const Field<MediaBase, bool> _f$deleted = Field(
    'deleted',
    _$deleted,
    key: r'_deleted',
    opt: true,
    def: false,
  );
  static String? _$rev(MediaBase v) => v.rev;
  static const Field<MediaBase, String> _f$rev = Field(
    'rev',
    _$rev,
    key: r'_rev',
    opt: true,
  );
  static Revisions? _$revisions(MediaBase v) => v.revisions;
  static const Field<MediaBase, Revisions> _f$revisions = Field(
    'revisions',
    _$revisions,
    key: r'_revisions',
    opt: true,
  );
  static List<RevsInfo>? _$revsInfo(MediaBase v) => v.revsInfo;
  static const Field<MediaBase, List<RevsInfo>> _f$revsInfo = Field(
    'revsInfo',
    _$revsInfo,
    key: r'_revs_info',
    opt: true,
  );
  static Map<String, dynamic> _$unmappedProps(MediaBase v) => v.unmappedProps;
  static const Field<MediaBase, Map<String, dynamic>> _f$unmappedProps = Field(
    'unmappedProps',
    _$unmappedProps,
    opt: true,
    def: const {},
  );

  @override
  final MappableFields<MediaBase> fields = const {
    #parent: _f$parent,
    #sortHint: _f$sortHint,
    #name: _f$name,
    #id: _f$id,
    #attachments: _f$attachments,
    #deleted: _f$deleted,
    #rev: _f$rev,
    #revisions: _f$revisions,
    #revsInfo: _f$revsInfo,
    #unmappedProps: _f$unmappedProps,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = '!doc_type';
  @override
  final dynamic discriminatorValue = "media_base";
  @override
  late final ClassMapperBase superMapper =
      CouchDocumentBaseMapper.ensureInitialized();

  @override
  final MappingHook superHook = const ChainedHook([
    CouchDocumentBaseRawHook(),
    UnmappedPropertiesHook('unmappedProps'),
  ]);

  static MediaBase _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'MediaBase',
      '!doc_type',
      '${data.value['!doc_type']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MediaBase fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MediaBase>(map);
  }

  static MediaBase fromJson(String json) {
    return ensureInitialized().decodeJson<MediaBase>(json);
  }
}

mixin MediaBaseMappable {
  String toJson();
  Map<String, dynamic> toMap();
  MediaBaseCopyWith<MediaBase, MediaBase, MediaBase> get copyWith;
}

abstract class MediaBaseCopyWith<$R, $In extends MediaBase, $Out>
    implements CouchDocumentBaseCopyWith<$R, $In, $Out> {
  @override
  MapCopyWith<
    $R,
    String,
    AttachmentInfo,
    AttachmentInfoCopyWith<$R, AttachmentInfo, AttachmentInfo>
  >?
  get attachments;
  @override
  RevisionsCopyWith<$R, Revisions, Revisions>? get revisions;
  @override
  ListCopyWith<$R, RevsInfo, RevsInfoCopyWith<$R, RevsInfo, RevsInfo>>?
  get revsInfo;
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
  get unmappedProps;
  @override
  $R call({
    String? parent,
    int? sortHint,
    String? name,
    String? id,
    Map<String, AttachmentInfo>? attachments,
    bool? deleted,
    String? rev,
    Revisions? revisions,
    List<RevsInfo>? revsInfo,
    Map<String, dynamic>? unmappedProps,
  });
  MediaBaseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class MediaFolderMapper extends SubClassMapperBase<MediaFolder> {
  MediaFolderMapper._();

  static MediaFolderMapper? _instance;
  static MediaFolderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MediaFolderMapper._());
      MediaBaseMapper.ensureInitialized().addSubMapper(_instance!);
      AttachmentInfoMapper.ensureInitialized();
      RevisionsMapper.ensureInitialized();
      RevsInfoMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MediaFolder';

  static String? _$parent(MediaFolder v) => v.parent;
  static const Field<MediaFolder, String> _f$parent = Field(
    'parent',
    _$parent,
    opt: true,
  );
  static int _$sortHint(MediaFolder v) => v.sortHint;
  static const Field<MediaFolder, int> _f$sortHint = Field(
    'sortHint',
    _$sortHint,
  );
  static String _$name(MediaFolder v) => v.name;
  static const Field<MediaFolder, String> _f$name = Field('name', _$name);
  static String? _$id(MediaFolder v) => v.id;
  static const Field<MediaFolder, String> _f$id = Field(
    'id',
    _$id,
    key: r'_id',
    opt: true,
  );
  static Map<String, AttachmentInfo>? _$attachments(MediaFolder v) =>
      v.attachments;
  static const Field<MediaFolder, Map<String, AttachmentInfo>> _f$attachments =
      Field('attachments', _$attachments, key: r'_attachments', opt: true);
  static bool _$deleted(MediaFolder v) => v.deleted;
  static const Field<MediaFolder, bool> _f$deleted = Field(
    'deleted',
    _$deleted,
    key: r'_deleted',
    opt: true,
    def: false,
  );
  static String? _$rev(MediaFolder v) => v.rev;
  static const Field<MediaFolder, String> _f$rev = Field(
    'rev',
    _$rev,
    key: r'_rev',
    opt: true,
  );
  static Revisions? _$revisions(MediaFolder v) => v.revisions;
  static const Field<MediaFolder, Revisions> _f$revisions = Field(
    'revisions',
    _$revisions,
    key: r'_revisions',
    opt: true,
  );
  static List<RevsInfo>? _$revsInfo(MediaFolder v) => v.revsInfo;
  static const Field<MediaFolder, List<RevsInfo>> _f$revsInfo = Field(
    'revsInfo',
    _$revsInfo,
    key: r'_revs_info',
    opt: true,
  );
  static Map<String, dynamic> _$unmappedProps(MediaFolder v) => v.unmappedProps;
  static const Field<MediaFolder, Map<String, dynamic>> _f$unmappedProps =
      Field('unmappedProps', _$unmappedProps, opt: true, def: const {});

  @override
  final MappableFields<MediaFolder> fields = const {
    #parent: _f$parent,
    #sortHint: _f$sortHint,
    #name: _f$name,
    #id: _f$id,
    #attachments: _f$attachments,
    #deleted: _f$deleted,
    #rev: _f$rev,
    #revisions: _f$revisions,
    #revsInfo: _f$revsInfo,
    #unmappedProps: _f$unmappedProps,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = '!doc_type';
  @override
  final dynamic discriminatorValue = "media_folder";
  @override
  late final ClassMapperBase superMapper = MediaBaseMapper.ensureInitialized();

  @override
  final MappingHook superHook = const ChainedHook([
    CouchDocumentBaseRawHook(),
    UnmappedPropertiesHook('unmappedProps'),
  ]);

  static MediaFolder _instantiate(DecodingData data) {
    return MediaFolder(
      parent: data.dec(_f$parent),
      sortHint: data.dec(_f$sortHint),
      name: data.dec(_f$name),
      id: data.dec(_f$id),
      attachments: data.dec(_f$attachments),
      deleted: data.dec(_f$deleted),
      rev: data.dec(_f$rev),
      revisions: data.dec(_f$revisions),
      revsInfo: data.dec(_f$revsInfo),
      unmappedProps: data.dec(_f$unmappedProps),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MediaFolder fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MediaFolder>(map);
  }

  static MediaFolder fromJson(String json) {
    return ensureInitialized().decodeJson<MediaFolder>(json);
  }
}

mixin MediaFolderMappable {
  String toJson() {
    return MediaFolderMapper.ensureInitialized().encodeJson<MediaFolder>(
      this as MediaFolder,
    );
  }

  Map<String, dynamic> toMap() {
    return MediaFolderMapper.ensureInitialized().encodeMap<MediaFolder>(
      this as MediaFolder,
    );
  }

  MediaFolderCopyWith<MediaFolder, MediaFolder, MediaFolder> get copyWith =>
      _MediaFolderCopyWithImpl<MediaFolder, MediaFolder>(
        this as MediaFolder,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MediaFolderMapper.ensureInitialized().stringifyValue(
      this as MediaFolder,
    );
  }

  @override
  bool operator ==(Object other) {
    return MediaFolderMapper.ensureInitialized().equalsValue(
      this as MediaFolder,
      other,
    );
  }

  @override
  int get hashCode {
    return MediaFolderMapper.ensureInitialized().hashValue(this as MediaFolder);
  }
}

extension MediaFolderValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MediaFolder, $Out> {
  MediaFolderCopyWith<$R, MediaFolder, $Out> get $asMediaFolder =>
      $base.as((v, t, t2) => _MediaFolderCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MediaFolderCopyWith<$R, $In extends MediaFolder, $Out>
    implements MediaBaseCopyWith<$R, $In, $Out> {
  @override
  MapCopyWith<
    $R,
    String,
    AttachmentInfo,
    AttachmentInfoCopyWith<$R, AttachmentInfo, AttachmentInfo>
  >?
  get attachments;
  @override
  RevisionsCopyWith<$R, Revisions, Revisions>? get revisions;
  @override
  ListCopyWith<$R, RevsInfo, RevsInfoCopyWith<$R, RevsInfo, RevsInfo>>?
  get revsInfo;
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
  get unmappedProps;
  @override
  $R call({
    String? parent,
    int? sortHint,
    String? name,
    String? id,
    Map<String, AttachmentInfo>? attachments,
    bool? deleted,
    String? rev,
    Revisions? revisions,
    List<RevsInfo>? revsInfo,
    Map<String, dynamic>? unmappedProps,
  });
  MediaFolderCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MediaFolderCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MediaFolder, $Out>
    implements MediaFolderCopyWith<$R, MediaFolder, $Out> {
  _MediaFolderCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MediaFolder> $mapper =
      MediaFolderMapper.ensureInitialized();
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
    Object? parent = $none,
    int? sortHint,
    String? name,
    Object? id = $none,
    Object? attachments = $none,
    bool? deleted,
    Object? rev = $none,
    Object? revisions = $none,
    Object? revsInfo = $none,
    Map<String, dynamic>? unmappedProps,
  }) => $apply(
    FieldCopyWithData({
      if (parent != $none) #parent: parent,
      if (sortHint != null) #sortHint: sortHint,
      if (name != null) #name: name,
      if (id != $none) #id: id,
      if (attachments != $none) #attachments: attachments,
      if (deleted != null) #deleted: deleted,
      if (rev != $none) #rev: rev,
      if (revisions != $none) #revisions: revisions,
      if (revsInfo != $none) #revsInfo: revsInfo,
      if (unmappedProps != null) #unmappedProps: unmappedProps,
    }),
  );
  @override
  MediaFolder $make(CopyWithData data) => MediaFolder(
    parent: data.get(#parent, or: $value.parent),
    sortHint: data.get(#sortHint, or: $value.sortHint),
    name: data.get(#name, or: $value.name),
    id: data.get(#id, or: $value.id),
    attachments: data.get(#attachments, or: $value.attachments),
    deleted: data.get(#deleted, or: $value.deleted),
    rev: data.get(#rev, or: $value.rev),
    revisions: data.get(#revisions, or: $value.revisions),
    revsInfo: data.get(#revsInfo, or: $value.revsInfo),
    unmappedProps: data.get(#unmappedProps, or: $value.unmappedProps),
  );

  @override
  MediaFolderCopyWith<$R2, MediaFolder, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _MediaFolderCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class MediaItemMapper extends SubClassMapperBase<MediaItem> {
  MediaItemMapper._();

  static MediaItemMapper? _instance;
  static MediaItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MediaItemMapper._());
      MediaBaseMapper.ensureInitialized().addSubMapper(_instance!);
      AttachmentInfoMapper.ensureInitialized();
      RevisionsMapper.ensureInitialized();
      RevsInfoMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MediaItem';

  static String? _$parent(MediaItem v) => v.parent;
  static const Field<MediaItem, String> _f$parent = Field(
    'parent',
    _$parent,
    opt: true,
  );
  static int _$sortHint(MediaItem v) => v.sortHint;
  static const Field<MediaItem, int> _f$sortHint = Field(
    'sortHint',
    _$sortHint,
  );
  static String _$name(MediaItem v) => v.name;
  static const Field<MediaItem, String> _f$name = Field('name', _$name);
  static List<String> _$media(MediaItem v) => v.media;
  static const Field<MediaItem, List<String>> _f$media = Field(
    'media',
    _$media,
  );
  static String? _$id(MediaItem v) => v.id;
  static const Field<MediaItem, String> _f$id = Field(
    'id',
    _$id,
    key: r'_id',
    opt: true,
  );
  static Map<String, AttachmentInfo>? _$attachments(MediaItem v) =>
      v.attachments;
  static const Field<MediaItem, Map<String, AttachmentInfo>> _f$attachments =
      Field('attachments', _$attachments, key: r'_attachments', opt: true);
  static bool _$deleted(MediaItem v) => v.deleted;
  static const Field<MediaItem, bool> _f$deleted = Field(
    'deleted',
    _$deleted,
    key: r'_deleted',
    opt: true,
    def: false,
  );
  static String? _$rev(MediaItem v) => v.rev;
  static const Field<MediaItem, String> _f$rev = Field(
    'rev',
    _$rev,
    key: r'_rev',
    opt: true,
  );
  static Revisions? _$revisions(MediaItem v) => v.revisions;
  static const Field<MediaItem, Revisions> _f$revisions = Field(
    'revisions',
    _$revisions,
    key: r'_revisions',
    opt: true,
  );
  static List<RevsInfo>? _$revsInfo(MediaItem v) => v.revsInfo;
  static const Field<MediaItem, List<RevsInfo>> _f$revsInfo = Field(
    'revsInfo',
    _$revsInfo,
    key: r'_revs_info',
    opt: true,
  );
  static Map<String, dynamic> _$unmappedProps(MediaItem v) => v.unmappedProps;
  static const Field<MediaItem, Map<String, dynamic>> _f$unmappedProps = Field(
    'unmappedProps',
    _$unmappedProps,
    opt: true,
    def: const {},
  );

  @override
  final MappableFields<MediaItem> fields = const {
    #parent: _f$parent,
    #sortHint: _f$sortHint,
    #name: _f$name,
    #media: _f$media,
    #id: _f$id,
    #attachments: _f$attachments,
    #deleted: _f$deleted,
    #rev: _f$rev,
    #revisions: _f$revisions,
    #revsInfo: _f$revsInfo,
    #unmappedProps: _f$unmappedProps,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = '!doc_type';
  @override
  final dynamic discriminatorValue = "media_item";
  @override
  late final ClassMapperBase superMapper = MediaBaseMapper.ensureInitialized();

  @override
  final MappingHook superHook = const ChainedHook([
    CouchDocumentBaseRawHook(),
    UnmappedPropertiesHook('unmappedProps'),
  ]);

  static MediaItem _instantiate(DecodingData data) {
    return MediaItem(
      parent: data.dec(_f$parent),
      sortHint: data.dec(_f$sortHint),
      name: data.dec(_f$name),
      media: data.dec(_f$media),
      id: data.dec(_f$id),
      attachments: data.dec(_f$attachments),
      deleted: data.dec(_f$deleted),
      rev: data.dec(_f$rev),
      revisions: data.dec(_f$revisions),
      revsInfo: data.dec(_f$revsInfo),
      unmappedProps: data.dec(_f$unmappedProps),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MediaItem fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MediaItem>(map);
  }

  static MediaItem fromJson(String json) {
    return ensureInitialized().decodeJson<MediaItem>(json);
  }
}

mixin MediaItemMappable {
  String toJson() {
    return MediaItemMapper.ensureInitialized().encodeJson<MediaItem>(
      this as MediaItem,
    );
  }

  Map<String, dynamic> toMap() {
    return MediaItemMapper.ensureInitialized().encodeMap<MediaItem>(
      this as MediaItem,
    );
  }

  MediaItemCopyWith<MediaItem, MediaItem, MediaItem> get copyWith =>
      _MediaItemCopyWithImpl<MediaItem, MediaItem>(
        this as MediaItem,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MediaItemMapper.ensureInitialized().stringifyValue(
      this as MediaItem,
    );
  }

  @override
  bool operator ==(Object other) {
    return MediaItemMapper.ensureInitialized().equalsValue(
      this as MediaItem,
      other,
    );
  }

  @override
  int get hashCode {
    return MediaItemMapper.ensureInitialized().hashValue(this as MediaItem);
  }
}

extension MediaItemValueCopy<$R, $Out> on ObjectCopyWith<$R, MediaItem, $Out> {
  MediaItemCopyWith<$R, MediaItem, $Out> get $asMediaItem =>
      $base.as((v, t, t2) => _MediaItemCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MediaItemCopyWith<$R, $In extends MediaItem, $Out>
    implements MediaBaseCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get media;
  @override
  MapCopyWith<
    $R,
    String,
    AttachmentInfo,
    AttachmentInfoCopyWith<$R, AttachmentInfo, AttachmentInfo>
  >?
  get attachments;
  @override
  RevisionsCopyWith<$R, Revisions, Revisions>? get revisions;
  @override
  ListCopyWith<$R, RevsInfo, RevsInfoCopyWith<$R, RevsInfo, RevsInfo>>?
  get revsInfo;
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
  get unmappedProps;
  @override
  $R call({
    String? parent,
    int? sortHint,
    String? name,
    List<String>? media,
    String? id,
    Map<String, AttachmentInfo>? attachments,
    bool? deleted,
    String? rev,
    Revisions? revisions,
    List<RevsInfo>? revsInfo,
    Map<String, dynamic>? unmappedProps,
  });
  MediaItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MediaItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MediaItem, $Out>
    implements MediaItemCopyWith<$R, MediaItem, $Out> {
  _MediaItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MediaItem> $mapper =
      MediaItemMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get media =>
      ListCopyWith(
        $value.media,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(media: v),
      );
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
    Object? parent = $none,
    int? sortHint,
    String? name,
    List<String>? media,
    Object? id = $none,
    Object? attachments = $none,
    bool? deleted,
    Object? rev = $none,
    Object? revisions = $none,
    Object? revsInfo = $none,
    Map<String, dynamic>? unmappedProps,
  }) => $apply(
    FieldCopyWithData({
      if (parent != $none) #parent: parent,
      if (sortHint != null) #sortHint: sortHint,
      if (name != null) #name: name,
      if (media != null) #media: media,
      if (id != $none) #id: id,
      if (attachments != $none) #attachments: attachments,
      if (deleted != null) #deleted: deleted,
      if (rev != $none) #rev: rev,
      if (revisions != $none) #revisions: revisions,
      if (revsInfo != $none) #revsInfo: revsInfo,
      if (unmappedProps != null) #unmappedProps: unmappedProps,
    }),
  );
  @override
  MediaItem $make(CopyWithData data) => MediaItem(
    parent: data.get(#parent, or: $value.parent),
    sortHint: data.get(#sortHint, or: $value.sortHint),
    name: data.get(#name, or: $value.name),
    media: data.get(#media, or: $value.media),
    id: data.get(#id, or: $value.id),
    attachments: data.get(#attachments, or: $value.attachments),
    deleted: data.get(#deleted, or: $value.deleted),
    rev: data.get(#rev, or: $value.rev),
    revisions: data.get(#revisions, or: $value.revisions),
    revsInfo: data.get(#revsInfo, or: $value.revsInfo),
    unmappedProps: data.get(#unmappedProps, or: $value.unmappedProps),
  );

  @override
  MediaItemCopyWith<$R2, MediaItem, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _MediaItemCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class MediaAttachmentMapper extends ClassMapperBase<MediaAttachment> {
  MediaAttachmentMapper._();

  static MediaAttachmentMapper? _instance;
  static MediaAttachmentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MediaAttachmentMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MediaAttachment';

  static String _$name(MediaAttachment v) => v.name;
  static const Field<MediaAttachment, String> _f$name = Field('name', _$name);
  static String _$attachmentId(MediaAttachment v) => v.attachmentId;
  static const Field<MediaAttachment, String> _f$attachmentId = Field(
    'attachmentId',
    _$attachmentId,
    key: r'attachment_id',
  );

  @override
  final MappableFields<MediaAttachment> fields = const {
    #name: _f$name,
    #attachmentId: _f$attachmentId,
  };

  static MediaAttachment _instantiate(DecodingData data) {
    return MediaAttachment(
      name: data.dec(_f$name),
      attachmentId: data.dec(_f$attachmentId),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MediaAttachment fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MediaAttachment>(map);
  }

  static MediaAttachment fromJson(String json) {
    return ensureInitialized().decodeJson<MediaAttachment>(json);
  }
}

mixin MediaAttachmentMappable {
  String toJson() {
    return MediaAttachmentMapper.ensureInitialized()
        .encodeJson<MediaAttachment>(this as MediaAttachment);
  }

  Map<String, dynamic> toMap() {
    return MediaAttachmentMapper.ensureInitialized().encodeMap<MediaAttachment>(
      this as MediaAttachment,
    );
  }

  MediaAttachmentCopyWith<MediaAttachment, MediaAttachment, MediaAttachment>
  get copyWith =>
      _MediaAttachmentCopyWithImpl<MediaAttachment, MediaAttachment>(
        this as MediaAttachment,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MediaAttachmentMapper.ensureInitialized().stringifyValue(
      this as MediaAttachment,
    );
  }

  @override
  bool operator ==(Object other) {
    return MediaAttachmentMapper.ensureInitialized().equalsValue(
      this as MediaAttachment,
      other,
    );
  }

  @override
  int get hashCode {
    return MediaAttachmentMapper.ensureInitialized().hashValue(
      this as MediaAttachment,
    );
  }
}

extension MediaAttachmentValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MediaAttachment, $Out> {
  MediaAttachmentCopyWith<$R, MediaAttachment, $Out> get $asMediaAttachment =>
      $base.as((v, t, t2) => _MediaAttachmentCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MediaAttachmentCopyWith<$R, $In extends MediaAttachment, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? attachmentId});
  MediaAttachmentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _MediaAttachmentCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MediaAttachment, $Out>
    implements MediaAttachmentCopyWith<$R, MediaAttachment, $Out> {
  _MediaAttachmentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MediaAttachment> $mapper =
      MediaAttachmentMapper.ensureInitialized();
  @override
  $R call({String? name, String? attachmentId}) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (attachmentId != null) #attachmentId: attachmentId,
    }),
  );
  @override
  MediaAttachment $make(CopyWithData data) => MediaAttachment(
    name: data.get(#name, or: $value.name),
    attachmentId: data.get(#attachmentId, or: $value.attachmentId),
  );

  @override
  MediaAttachmentCopyWith<$R2, MediaAttachment, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _MediaAttachmentCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

