function callInputFile() {
    $("#user_picture")[0].click();
}

$(function () {
    $("#join").click(function () {
        let fileForm = $("#file_form")[0];
        let formData = new FormData(fileForm);
        $.ajax("join", {
            processData: false,
            contentType: false,
            type: "post",
            data: formData,
            dataType: "json",
            success: function (result) {
                if (result.success === "fail") {
                    alert("가입에 실패했습니다.");
                } else {
                    alert("가입되었습니다.");
                }
            }
        })
    })

    $("#user_picture").change(function (event) {
        let reader = new FileReader();
        reader.addEventListener("load", function (event) {
            $("img")[0].setAttribute("src", event.target.result);
        });

        reader.readAsDataURL(event.target.files[0]);
    });

    $("#user_id").change(function () {
        $("#join").prop("disabled", true);
        $("#checkDuplicate").prop("disabled", false);
    });

    $("#checkDuplicate").click(function () {
        let $userId = $("#user_id");
        let $join = $("#join");
        let id = $userId.val().trim();
        $userId.val(id);
        let data = {
            id: id
        };
        if (id) {
            $.ajax("api?command=findById", {
                type: "post",
                data: data,
                dataType: "json",
                success: function (data) {
                    if (data) {
                        $join.prop("disabled", true);
                        $userId.focus();
                        alert("중복된 아이디가 존재합니다");
                    } else {
                        $join.prop("disabled", false);
                        $("#checkDuplicate").attr("disabled", true);
                    }
                },
                error: function () {
                    alert("통신 실패입니다");
                }
            });
        } else {
            $userId.val("").focus();
            alert("아이디를 입력하세요");
        }
    });
})