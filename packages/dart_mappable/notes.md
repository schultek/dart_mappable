
---

# Current

## Global vs Local Mappers

Currently all mappers are used globally, which has the following implications:

- There can only be a single mapper for a type at a time. (inflexible)
- Mappers must be registered before being able to be used. (easy to forget)
- Once registered, mappers are used for any and all models. (unwanted sideeffects, hard to catch bugs)
- Mappers can be freely registered and un-registered. (unwanted breakage)


## Primitive and Default Mappers

Currently there is no difference in how primitive types, user types and custom types are handled.
All are just mappers. This has the following implications:

- The handling of primitive values goes through the full code path for finding and executing mappers. (slow)
- Primitive mappers can be un-registered or overridden. (unwanted breakage)



# Proposal

The new system should follow these rules:

- No global registry of mappers, mappers are only used "locally".
- "locally" means for zone. Mappers are registered for a zone (and its descendant zones).
- Mapping options (e.g. includeTypeId) are also set based on the zone.
- Primitive types are handled inline and have no mappers.
- Statically inferred mappers are used explicitly and won't use the discovery code path.
- Dynamically used mappers can be used for statically unknown types, but not override statically inferred mappers.
- There will be new APIs for specifying dynamic mappers and options for a zone.

The following APIs will be removed:

- `MapperContainer.globals`
- `MyClassMapper.ensureInitialized()`
- `includeCustomMappers`

The following new APIs will be introduced:

- `fromJson<T>(..., mappers: [...])` and others (top-level functions) (tbd)
- `MyClass.fromJson<T>(..., mappers: [...])`, specifies extra mappers
- `useMappers` on both MappableClass and MappableField, specifies extra mappers statically
- `withMappers(mappers: [...], options: ..., () { ... })`, creates a new zone with mappers and options
- `MyClassMapper()`, generated factory constructor creating singleton instance