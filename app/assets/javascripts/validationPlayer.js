console.log("Testing");
console.log("jquery validation");
$( document ).ready(function() {
    console.log( "ready!" );
});
$(function(){ 
    
    
    var $player = $("#playerValidate");
    if($player.length){
        $player.validate(
            {
                rules:{
                    "player[name]":{
                        required: true,
                        minlength: 3
                        
                    },
                    "player[email]":{
                      required: true,
                      minlength: 4,
                      email :true
                    }
                    
                },
                messages:{
                  "player[name]":{
                        minlength: 'Name must contain at least 3 characters'
                    },
                    "player[email]":{
                      required: 'Enter valid email.'
                    }
                    
                    
                    
                }
            }
        )
    }
})

