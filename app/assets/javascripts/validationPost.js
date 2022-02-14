console.log("Testing");
console.log("jquery validation");
$( document ).ready(function() {
    console.log( "ready!" );
});
$(function(){ 
    
    
    var $register = $("#postValidate");
    if($register.length){
        $register.validate(
            {
                rules:{
                    "post[title]":{
                        
                        minlength: 6
                        
                    },
                    "post[description]":{
                        minlength: 20
                    },
                    "post_attachments[avatar][]":{
                        required: true,
                       
                    },
                    "post[sport_id]":{
                        required: true
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




// console.log("Testing");
// $( document ).ready(function() {
//     console.log( "ready!" );
// });
// $(function(){ 
    
    
//     var $register = $("#registration");
//     if($register.length){
//         $register.validate(
//             {
//                 rules:{
//                     fname:{
//                         required: true,
//                         minlength: 2
//                     },
//                     lname:{
//                         required: true,
//                         minlength: 2
//                     },
//                     email:{
//                         required: true,
//                         minlength: 4
//                     },
//                     pass:{
//                         required: true,
//                         minlength: 5
//                     },
//                     confirmpass:{
//                         required: true,
//                         minlength: 5,
//                         equalTo: "#password"
//                     },
//                     age:{
//                         required: true,
//                         range: [18, 100]

//                     },
//                     url:{
//                         required: true,
//                         url: true
//                     },
//                     address:{
//                         required: true,
//                         maxlength: 100
//                     }

//                 },
//                 messages:{
//                     fname:{
//                         required: 'First name must exist.'
//                     },
//                     lname:{
//                         required: 'Last name must exist.'
//                     },
//                     email:{
//                         required: 'Enter valid email.'
//                     },
//                     age:{
//                         required: 'Age must exist.',
//                         range: 'Age should be between 18 to 100'
//                     },
//                     url:{
//                         required: 'Enter valid Url.'
//                     },
//                     pass:{
//                         required: 'Enter valid password.'
//                     }
                    
//                 }
//             }
//         )
//     }
// })