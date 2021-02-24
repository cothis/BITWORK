$(function () {
    let validTargets = document.querySelectorAll("input[pattern]");
    for (let target of validTargets) {
        target.validationMessage = target.title;
        target.addEventListener("change", function () {
            let valid = this.checkValidity();
            if (valid) {
                this.classList.remove("red-important");
            } else {
                this.classList.add("red-important");
                this.reportValidity();
            }
        });
    }

    $("#companyName").change(function () {
        $("#makeCompany").prop("disabled", true);
        $("#checkDuplicate").prop("disabled", false);
    });

    $("#makeCompany").click(function () {
        for (let obj of validTargets) {
            let valid = obj.checkValidity();
            if (valid) {
                obj.classList.remove("red-important");
            } else {
                obj.reportValidity();
                obj.focus();
                obj.classList.add("red-important");
                return;
            }
        }
        let formData = $(this.form).serialize();
        $.ajax("makeCompany", {
            method: "post",
            data: formData,
            dataType: "json",
            success: function (result) {
                if (result) {
                    alert("회사가 생성되었습니다.");
                    location.href = "..";
                } else {
                    alert("생성에 실패했습니다.");
                }
            }
        });
    });

    $("#checkDuplicate").click(function () {
        let $companyName = $("#companyName");
        let $makeCompany = $("#makeCompany");
        let companyName = $companyName.val().trim();
        $companyName.val(companyName);
        let data = {
            companyName: companyName
        };
        if (companyName) {
            $.ajax("/member/api?command=searchCompany", {
                method: "post",
                data: data,
                dataType: "json",
                success: function (data) {
                    if (data.length) {
                        console.log(data);
                        $makeCompany.prop("disabled", true);
                        $companyName.focus();
                        alert("중복된 회사명이 존재합니다");
                    } else {
                        $makeCompany.prop("disabled", false);
                        $("#checkDuplicate").attr("disabled", true);
                    }
                },
                error: function () {
                    alert("통신 실패입니다");
                }
            });
        } else {
            $companyName.val("").focus();
            alert("아이디를 입력하세요");
        }
    });

    document.querySelector("#cancel").addEventListener("click", function () {
        history.back();
    })
});
