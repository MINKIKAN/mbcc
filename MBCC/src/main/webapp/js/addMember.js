let check = 0;
let ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

function idcheck(){
	 if($.trim($("#id").val())==''){
		 $("#msg").html("아이디를 입력하세요.");
		 $("#id").focus();
		 $("#id").css("border", "");
		 return;
	 }
	 let id=$("#id").val();
	 $.ajax({ 
		 url : ctx+"/validateId.do",
		 type : "POST",
		 data : {"id" : id},
		 success : getResult,  
		 error : function(){ alert("error"); }    		 
	 });
}  

function getResult(data){	
	 if(data == "null"){
		 alert("사용가능한 아이디 입니다.");
	
		 $("#pw").focus();
		 $("#id").css("border", "3px blue solid")
		 check = 1;
	
	 }else{
	 alert("이미 사용하고 있는 id 입니다.");
		 $("#id").val("");
		 $("#id").focus();
		 $("#id").css("border", "3px red solid")
		 check = -1;
	 } 	 
}

function validCheck(form){
	if(check == 0){
		$("#msg").html('id 중복체크 해주세요');
		return false;
	} else if(check == -1){
		$("#msg").html('id 중복체크 다시하세요');
		return false;
	}
	if($.trim($("#pw").val())==''){
		 $("#msg").html("비밀번호를 입력하세요.");
		 $("#pw").focus();
		 return;
	 }

	 if($.trim($("#name").val())==''){
		 $("#msg").html("이름를 입력하세요.");
		 $("#id").focus();
		 return;
	 }

	if(!form.email.value.match( /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/)){
		$("#msg").html("이메일 형식이 다릅니다");
		form.email.value="test@test.com";
		form.email.focus();
		return false;
	}
	
	if(!form.tel.value.match( /010-\d{3,4}-\d{4}/)){
		$("#msg").html("전화번호 형식이 다릅니다");
		form.tel.value="010-1234-1234";
		form.tel.focus();
		return false;
	}
	form.submit();
	
	alert("회원가입에 성공 하였습니다")
	
}

	$("#id").keyup(function(e) {
		 if(e.keyCode=='8'){
			 check =0;
		 }
	  $("#id").css("border", "");
	});
	
	let inputs =  document.querySelectorAll("input"); 
    inputs.forEach((input)=>{
        input.onchange = function(){
            $("#msg").html("");
        };
    })
	
	

	
