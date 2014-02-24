Repeat helper
===

     Template.repeat.__items = (parent)->
         $first = this[0]
         index = 0
         end = this.length-1
         $last = this[end]
         items = _.map this, (i)->
             obj = {}
             if i is null
                 obj.$value = null
             else if typeof i is 'object'
                 obj = i
             else
                 obj.$value = i
             
             unless parent is null
                 obj.__proto__ = parent
             
             if 0 < index < end
                 obj.$middle = true
             else
                 obj.$middle = false

             obj.$index = index++
             obj.$first = $first
             obj.$last = $last
             if (index%2 is 0) 
                 obj.$even = true 
                 obj.$odd = false
             else
                 obj.$odd = true
                 obj.$even = false
             
             obj

         items

     Template.for = Template.repeat

