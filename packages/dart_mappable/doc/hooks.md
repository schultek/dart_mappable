Hooks provide a way to hook into the encoding and decoding process for a class or single field.
When using hooks, you have the possibility to inspect and modify values before and after they are encoded or decoded.

To use hooks, create a custom class extending the `MappingHook` class, and set this as the `hook` 
argument of either the `MappableClass` or `MappableField` annotation like this:

```dart
class GameHook extends MappingHook {
  const GameHook();
}

class PlayerHook extends MappingHook {
  const PlayerHook();
}

@MappableClass(hook: GameHook())
class Game {
  @MappableField(hook: PlayerHook())
  Player player;

  Game(this.player);
}

class Player {
  String id;
  Player(this.id);
}
```

Now, whenever an instance of `Game` is encoded or decoded, the `GameHook` will be applied to the class and the `PlayerHook` will be applied to the `player` field.
Inside your hook class, you have four methods that you can override:

- `dynamic beforeDecode(dynamic value)`
- `dynamic afterDecode(dynamic value)`
- `dynamic beforeEncode(dynamic value)`
- `dynamic afterEncode(dynamic value)`

Each method takes a dynamic value and returns an optionally modified value.

> Tip: If the `beforeDecode` hook already returns an instance of the target type, the normal decoding logic is skipped. The same is true for the `beforeEncode` hook.
> This gives you the possibility to use different custom mappers on the same type, especially on a field-by-field level.

A simple use-case for this would be to modify the input json before an object is decoded.
In the example below, the player field can either be a full json object, or a single string.
The string would then be treated as the id of the player.

```dart
class PlayerHook extends MappingHook {
  const PlayerHook();

  @override
  dynamic beforeDecode(dynamic value) {
    if (value is String) {
      return {'id': value};
    }
    return value;
  }
}

...

void main() {
  // This works as usual
  Game game = GameMapper.fromJson('{"player": {"id": "Tom"}}');
  print(game.player.id); // Tom;

  // Special case: 'player' is a string instead of an object
  Game game2 = GameMapper.fromJson('{"player": "John"}');
  print(game.player.id); // John
}
```

Additionally, it is important to note that field- and class-hooks are inherited by any subclasses.
When both the superclass and the subclass define class-hooks, both are applied in the following order:
`super.beforeDecode -> sub.beforeDecode -> decode -> sub.afterDecode -> super.afterDecode`. For field-hooks, only the sub-class-hook is applied.

### Chaining multiple `MappingHook`s

You can chain and apply multiple hooks using the `ChainedHook` class like this:
`@MappableClass(hook: ChainedHook([ MyHook1(), MyHook2(), ... ]))`.

The hooks are applied for encoding and decoding in nested order:
`first.beforeDecode -> second.beforeDecode -> ... -> decode -> ... -> second.afterDecode -> first.afterDecode`.

### Unmapped Properties

A frequently needed use-case for hooks is to catch additional, unmapped properties from json when decoding an object.
Because of this, we provide a ready-to-use `MappingHook` called `UnmappedPropertiesHook`.

To use this hook, define a `Map<String, dynamic>` field in your class, and provide it's name to the `UnmappedPropertiesHooks` constructor.
Be aware that you have to provide the matching json key of the field (after applying the case style, etc.) instead of the dart field name.

```dart
@MappableClass(hook: UnmappedPropertiesHook('unmappedProps'))
class Game with GameMappable{
  String id;
  Map<String, dynamic> unmappedProps;

  Game(this.id, this.unmappedProps);
}

void main() {
  Game game = GameMapper.fromJson('{"id": 1, "type": "pacman", "score": 100}');
  print(game.id); // 1
  print(game.unmappedProps); // {type: pacman, score: 100}
}
```

---

<p align="right"><a href="../topics/Custom%20Mappers-topic.html">Next: Custom Mappers</a></p>
