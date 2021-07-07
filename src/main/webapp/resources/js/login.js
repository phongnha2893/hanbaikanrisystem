// function uuidv4() {
//     return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
//         var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
//         return v.toString(16);
//     });
// }

$(document).ready(function() {

    $('#login-form input.input100').each(function(i,e) {
        $(this).on("input", function (){
            let formControl = $(this).closest(".form-group");
            if ($(formControl) && $(formControl).hasClass("has-error")) {
                $(formControl).removeClass("has-error");
                let errMessage = $(formControl).find("span");
                if ($(errMessage)) $(errMessage).html("");
            }
        })
    });

    // var uuid = uuidv4();
    //
    // $('#login-form input').each(function(i,e) {
    //     $(this).attr("autocomplete", uuid);
    // });
});
