console.log("Testing");
console.log("jquery validation");
$( document ).ready(function() {
    console.log( "ready!" );
});
$(function(){ 
    
    
    var $post = $("#postValidate");
    if($post.length){
        $post.validate(
            {
                rules:{
                    title:{
                        required: true,
                        minlength: 6
                        
                    },
                    description:{
                        required: true,
                        minlength: 20
                    },
                    "post_attachments[avatar][]":{
                        required: true,
                       
                    }
                    
                },
                messages:{
                    "post[title]":{
                        minlength: 'Title must contain minimum 6 characters.'
                    },
                    "post[description]":{
                        minlength: 'Description must contain minimum 20 characters.'
                    }
                    
                    
                    
                }
            }
        )
    }
})

