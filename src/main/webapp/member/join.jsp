<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>BitWork - Join</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script>

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

    </script>
    <style>
        #file_form {
            box-sizing: border-box;
            padding: 15px;
            width: 712px;
            margin: 0 auto;
            background-color: rgb(20, 52, 85);
        }

        #user_picture {
            display: none;
        }

        .input-form {
            display: flex;
        }

        .picture-form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .text-form {
            margin-left: 15px;
            width: 100%;
        }

        .form-buttons {
            display: flex;
            justify-content: flex-end;
        }

        .form-group input {
            width: 70%;
        }

    </style>
</head>
<body>
    <jsp:include page="../commons/nav.jsp"/>
    <main>
        <form id="file_form" action="${pageContext.request.contextPath}/member/join" method="post" enctype="multipart/form-data">
            <div class="input-form">
                <div class="picture-form">
                    <div class="picture-img">
                        <img src="" alt="프로필사진" width="250px" height="250px">
                    </div>
                    <div>
                        <input type="file" name="user_picture" id="user_picture" accept="image/jpeg, image/png">
                        <button id="uploadPicture" type="button" onclick="callInputFile()">사진 등록</button>
                    </div>
                </div>
                <div class="text-form">
                    <div class="form-group">
                        <label for="user_id"></label>
                        <input type="text" name="user_id" id="user_id" placeholder="ID">
                        <button type="button" id="checkDuplicate">중복확인</button>
                    </div>
                    <div class="form-group">
                        <label for="user_pw"></label>
                        <input type="text" name="user_pw" id="user_pw" placeholder="PASSWORD">
                    </div>
                    <div class="form-group">
                        <label for="user_name"></label>
                        <input type="text" name="user_name" id="user_name" placeholder="이름">
                    </div>
                    <div class="form-group">
                        <label for="user_phone"></label>
                        <input type="text" name="user_phone" id="user_phone" placeholder="전화번호">
                    </div>
                    <div class="form-group">
                        <label for="user_email"></label>
                        <input type="text" name="user_email" id="user_email" placeholder="이메일">
                    </div>
                    <div class="form-group">
                        <label for="user_position"></label>
                        <input type="text" name="user_position" id="user_position" placeholder="직급" value="사원">
                    </div>
                </div>
            </div>
            <div class="form-buttons">
                <button type="button" name="cancel" id="cancel">취소</button>
                <button type="button" name="join" id="join" disabled>가입 신청</button>
            </div>
        </form>
    </main>
</body>
</html>
