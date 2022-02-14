console.log("Testing");
$( document ).ready(function() {
    console.log( "ready!" );
});
$(function(){ 
    
    
    var $register = $("#postValidate");
    if($register.length){
        $register.validate(
            {
                rules:{
                    post:{
                        required: true,
                        minlength: 2
                    }
                    
                },
                messages:{
                    fname:{
                        required: 'First name must exist.'
                    }
                    
                }
            }
        )
    }
})