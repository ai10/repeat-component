repeat-component for Meteor-UI
====
(shark branch) [repeat-component.meteor.com](http://repeat-component.meteor.com)
---
ng-like {{#repeat things }} nestable block helper for Meteor-UI {{/repeat}}
 - equivalent #for and #repeat block helpers extending #each native helper
 - include prototypical: $parent context in each nest
 - $first, $last, $middle, $even, $odd, and $index helpers

```sh

mrt add repeat-component

```

```HTML

{{#for things }}
  {{#for things }}
  <p>{{ $value }}, {{ $even }}, {{ $odd }}, {{ $index }}, ...</p>
  {{/for}}
{{/for}}

```
