$(document).ready(function () {
    var inputs = $("input");
    $.each(inputs, (k, v) => {
        $(v).on("input", function () {
            let formControl = $(v).parent();
            if ($(formControl) && $(formControl).hasClass("has-error")) {
                $(formControl).removeClass("has-error");
                let errMessage = $(formControl).children("span");
                if ($(errMessage)) $(errMessage).html("");
            }
        })
    });

    $(document).on("keydown", "form", function (event) {
        return event.key != "Enter";
    });

    // function hideStandardFormOnload () {
    //     var contractStandardsArea = $(".all-form-element-inner .form-contract-standards");
    //     var contractForms = contractStandardsArea.children(".standard-form-group");
    //
    //     $(contractForms[1]).hide();
    //     $(contractForms[2]).hide();
    //     $(contractForms[3]).hide();
    //     $(contractForms[4]).hide();
    // }
    // hideStandardFormOnload();
    //
    // function onStandardTouchSpinClick() {
    //     var contractStandardsArea = $(".all-form-element-inner .form-contract-standards");
    //     var contractForms = contractStandardsArea.children(".standard-form-group");
    //
    //     var quantityInput = $("button.bootstrap-touchspin-down").closest(".bootstrap-touchspin").children("input");
    //     var quantity = $(quantityInput).val();
    //     for (var i= 0; i< quantity; i++){
    //         $(contractForms[i]).show();
    //     }
    //     for (var i= quantity; i<5; i++) {
    //         $(contractForms[i]).hide();
    //     }
    // }
    //
    // $("button.bootstrap-touchspin-down").on("click", onStandardTouchSpinClick);
    //
    // $("button.bootstrap-touchspin-up").on("click", onStandardTouchSpinClick);
    //
    //
    // $("input[type='text'].other-radio").on("input", function (e){
    //     console.log(e.target.value);
    //     var inputText = e.target;
    //     var radioNearest = $(inputText).parent().children("input[type='radio']");
    //     $(radioNearest).val($(inputText).val());
    // });
    //
    // $("button#contract-form-submit").on("click" ,function (e) {
    //     e.preventDefault();
    //     if (confirm("契約を保存しますか？")) {
    //         $("#contractForm").submit();
    //     } else {
    //         return false;
    //     }
    // });
    //
    // $("button.cancel").on("click" ,function (e) {
    //     e.preventDefault();
    //     if (confirm("キャンセルしたい？")) {
    //         $(this).click();
    //     } else {
    //         return false;
    //     }
    // });
    $("a.delete-button").on("click", function (e) {
        e.preventDefault();
        if (confirm("Delete？")) {
            var link = $(this).attr('href');
            location.href = link;
        } else {
            return false;
        }
    });

    $("#maeukekin-import-cancel").on("click", function (e) {
        e.preventDefault();
        location.href = "/import-file/maeukekin";
    });

    $("#urikakekin-uchiwake-import-cancel").on("click", function (e) {
        e.preventDefault();
        location.href = "/import-file/urikakezandakauchiwake";
    });

    $("#maeukekin-export-cancel").on("click", function (e) {
        e.preventDefault();
        location.href = "/export-file/maeukekin";
    });

    $("#urikakezandakauchiwake-export-cancel").on("click", function (e) {
        e.preventDefault();
        location.href = "/export-file/urikakezandakauchiwake";
    });


});