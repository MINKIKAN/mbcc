let ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	

$("#login").click(function() {
	
	if (checkIt()) {
		$.ajax({
			type: "post",
			url:ctx +"/loginCheck.do",
			data: {
				id: $("#id").val(),
				pw: $("#pw").val(),
				memNum:$("num").val() 
			},
			success: function(data) {
				if (data == "null") {
					alert("아이디와 패스워드를 확인해주세요.");
					$("#id").val("");
					$("#pw").val("");
				} else {
					alert(data + "님 환영합니다");
					window.location.href = ctx+"/main.do";
				}
			},
			error: function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});

	}
});



function checkIt() {
	console.log($("#id").val());
	if (!$.trim($("#id").val())) {
		alert("아이디를 입력하세요.");
		$("#id").focus();
		return false;
	}
	if (!$.trim($("#pw").val())) {
		alert("비밀번호를 입력하세요.");
		$("#pw").focus();
		return false;
	}
	
	return true;
};
