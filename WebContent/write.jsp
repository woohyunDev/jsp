<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>write</title>
	</head>
	<body>
		<form action="insert.jsp" method = "post" onsubmit="return formCheck();">
			제목 : <input type="text" name = "title"/> <br/>
			글쓴이 : <input type = "text" name="writer"/> <br/>
			날짜 : <input type = "text" name = "regdate" /> <br/>
			내용 : <textarea rows="10" cols="20" name = "content"></textarea>
			<input type="submit">
			
		</form>
	
	</body>
	
	<script>
		function formCheck(){
			var title = document.forms[0].title.value;
			var writer = document.forms[0].writer.value;
			var regdate = document.forms[0].regdate.value;
			var content = document.forms[0].content.value;
			
			if(title == null || title == ""){
				alert('제목을 입력하세요');
				document.forms[0].title.focus();
				return false;
			}
			if(writer == null || writer == ""){
				alert('작성자를 입력하세요');
				document.forms[0].writer.focus();
				return false;
			} else if (writer.match(/^(\w+)@(\w+)[.](\w+)$/ig) == null){
				alert('이메일형식으로써주세요');
				document.forms[0].writer.focus();
				return false;
			}
			if(content == null || content == "" ){
				alert('내용을 입력하세요');
				document.forms[0].content.focus();
				return false;
			}
			if(regdate == null || regdate == ""){
				alert('날짜를 입력하세요');
				document.forms[0].regdate.focus();
				return false;
			}
		}
	</script>
</html>