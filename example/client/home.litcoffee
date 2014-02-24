Repeat component example
===



     Template.home.heading = ->
         @label or 'Header.'

     Template.home.last = ->
         if @$index is @$last.$index then return true
         false

     Template.home.indexRoot = ->
         protoroot = (child, pR)->
             cp = child?.__proto__
             console.log 'child', child.$index, 'proto', cp
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
