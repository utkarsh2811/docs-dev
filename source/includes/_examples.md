# Examples

## Working with collections

When getting or updating (post,put,delete) data we should be able to identify a particular data item. There are two ways of doing this: providing key/id separately, or providing it inside the data item payload.

> Example:

```json
{
  name: "character",
  schema: {
    fields: [
      { name: "id", type: "long", identifier: { primary: true } },
      { name: "name", type: "string" }
    ]
  }
}
```

This example will create identifier named `character.id` (name could be changed using "name" property) inside collection's application. This identifier will be used to create a key under which data item is stored, e.g. for the above data item `{"id": 1, "name": "Batman"}` we will use `id:1` and exchange it for internal `intempt id`, then store data item under that id. 

Every time we'll see data item with `{"id":1}` it will hit the same data item in the storage.

Relational analogy here is `sequence id generator`, except that it's not a sequence, but based on data provided inside the data item. 

Identifiers are resolved by `name`, so the `name` is unique across application. For given identifier name, `{"id":1}` will always resolve to the same `intempt id`. But for different identifier names even same values are different `intempt ids`, e.g. `charachter.id = 1` and `movie.id = 1` are never the same `intempt ids`. 

> Collection "movie":

```json
{
  name: "movie",
  schema: {
    fields: [
      { name: "id", type: "long", identifier: { primary: true } },
      { name: "name", type: "string" },
      {
        name: "characters",
        type: {
          type: "array",
          elementType: {
            type: "record",
            fields: [{ name: "name", type: "string" }]
          }
        }
      }
    ]
  }
}
```

Next we'll have a look into relations between collections. For a better example, let's have one collection first and then split it into two using relations.




> Data item:

```json

{
  id: 0,
  name: "The Dark Knight",
  characters: [{ name: "Batman" }, { name: "Joker" }]
}


```

<div class="spacer"></div>

Both schema definition and an actual item should be pretty clear. We have a movie with a name and list of characters. And `id` field is used as item identifier. The name of collection identifier will be "movie.id".

> Collection "movie":

```json
{
  name: "movie",
  schema: {
    fields: [
      { name: "id", type: "long", identifier: { primary: true } },
      { name: "name", type: "string" }
    ]
  }
}
```

Now suppose we want to move characters out of the movie item into its own collection. The definitions should be also straightforward.


> Collection "character":

```json
{
  name: "character",
  schema: {
    fields: [
      { name: "id", type: "long", identifier: { primary: true } },
      { name: "name", type: "string" }
    ]
  }
}
```

> Data items:

```json
{"id": 1, name: "The Dark Knight"}
{"id": 1, name: "Batman"}
{"id": 2, name: "Joker"}
```

<div class="spacer"></div>

So now we have two different collections with two different identifiers: `movie.id` and `character.id`. But how do we know characters are from this particular movie?

> Collection "character":

```json
{
  name: "character",
  schema: {
    fields: [
      { name: "id", type: "long", identifier: { primary: true } },
      { name: "name", type: "string" },
      { name: "movieId", type: "long", identifier: {???} }
    ]
  }
}
```

We need a `movie id` not only in movie collection but also inside `character` collection.

> Collection "character":

```json
{
  name: "character",
  schema: {
    fields: [
      { name: "id", type: "long", identifier: { primary: true } },
      { name: "name", type: "string" },
      {
        name: "movieId",
        type: "long",
        identifier: {
          relation: {
            name: "characters",
            identifier: { collection: "movie", name: "id" }
          }
        }
      }
    ]
  }
}
```

<div class="spacer"></div>

This time however, this is not a primary identifier(only one primary for collection is allowed). Additionally, it needs to point to `movie primary id` by using a `relation`:

Now identifier `movieId(character.movieId)` is pointing to `movie.id` and relation is named "characters"(the same way it was when characters field was an array). Note that `collection + name` give full identifier name and it should match the name of `identifier` we want to point to.

Additionally, we have few a special collection types which enforce more requirements: `profile` and `event`. Those are created by setting corresponding flags on collections.

Profile collection `primary id` is used as a `profile id` across whole application. Profile collection requires also a `user id`, so we can link profile to a user. Only one profile collection allowed per application.

Event collection is required to have `profile id`. Events not belonging to any profile are not supported.
