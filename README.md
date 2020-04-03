## Part 1.

1. Replace ranges in the given string with the shortened form. e. g. `'abcdab987612' => 'a-dab9-612'`

2. Wrap the long lines in the given text to the given length. Example:

```ruby
'To be or not to be that is the question', 5 => 
  `To be
  or 
  not
  to be
  that
  is
  the
  quest
  ion`
```

## Part 2.

We have the YAML file with the translations in the simple format (translations_simple.yml, attached). We want to use it with the rails [I18n] system.
Write a program that will transform the translations from simple format into a YAML file that can be used in the rails application.

``` yaml
# translations_simple.yml
'en.pets.types.cat': Cat
'en.pets.types.dog': Dog
'en.pets.title': My lovely pets
'en.actions.add': Add
'en.actions.remove': Remove
'en.language': <strong>Language</strong>
```

```yaml
# translations.yml - resulting file
en:
  pets:
    types:
      cat: Cat
      dog: Dog
    title: My lovely pets
  actions:
    add: Add
    remove: Remove
  language: <strong>Language</strong>
```
