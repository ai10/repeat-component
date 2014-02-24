repeat-component
================

ng-like {{#repeat things }} block helper for Meteor-UI {{/repeat}}
 - equivalent #for and #repeat block helpers extending #each native helper
 - include prototypical: $parent context in each nest
 - $first, $last, $middle, $even, $odd, and $index helpers
*example/home.html*
```HTML
 <div class="container">
    <div class="row">
        <h1>#repeat things =  #for things by <a href="github.com/charlesjshort/repeat-component">charlesjshort&nbsp;<i class="ion-social-github"></i></a></h1>
        <h2 class="well">#each with prototype scope <p class="well"> $parent, $index, $first, $last, $odd, $even, $middle</p></h2> 
    </div>
    <div class="row">
      {{#repeat things }}
      <div class="col-sm-6">
      <h2 class="{{ getColor }}">{{ indexRoot }}</h2>
        <ul class="list-group">
          {{#for things }}
            <div class="col-sm-6">
            <li class="list-group-item">
            <h4 class="{{ getColor }} list-group-item-heading">{{ indexRoot }}</h4>
            <ul class="list-group">
                {{#repeat things }}
                <div class="col-sm-6">
                <li class="list-group-item">
                <h4 class="{{ getColor }} list-group-item-heading">{{ indexRoot }}</h4>
                <ul class="list-group">
                  {{#for things }}
                  <div class="col-sm-6">
                      <li class="{{ getColor }} list-group-item">{{ indexRoot }}</li>
                  </div>
                  {{/for}}
              </ul>
                </li>
                </div>
              {{/repeat}}
          </ul>
          </li>
          </div>
          {{/for}}
      </ul>
    </div>
      {{/repeat}}
  </div>
</div><!-- /.container !-->
```
*example/home.litcoffee*
```coffeescript
Template.home.heading = ->
         @label or 'Header.'

     Template.home.last = ->
         if @$index is @$last.$index then return true
         false

     Template.home.indexRoot = ->
         protoroot = (child, pR)->
             cp = child?.__proto__
             pR = "[#{ child.$index }]"+pR
             if cp.$index?
                 return protoroot cp, pR
             else
                 return pR
         
         protoroot this, ""

     Template.home.getColor = ->
         if @$odd then return 'text-danger'
         'text-success'
     
     Template.home.things = ->
         [0, 1]
