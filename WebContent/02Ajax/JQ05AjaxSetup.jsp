<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ05AjaxSetup.jsp</title>
<script src="../common/jquery/jquery-3.5.1.js"></script>
<script>
$(function(){
	//setup()에서 url과 dataType을 설정한다.
	$.ajaxSetup({
		url : "./common/05JSONData.json",
		dataType : "json"
			
	});
	
	//위에서 미리 정의했으므로 콜백메소드만 정의한다.
	$('#btn').click(function () {
		$.ajax({
			success : function(responseData){
				/*
				콜백되는 JSON배열 데이터를 each()로 읽어서 배열의 갯수만큼
				반복한다. 이때 각 반복시 JSON객체를 파싱하게 된다.
				파싱할때는 .(점)과 [](배열) 두가지 형태를 사용할 수 있다.
				*/
			
				$.each(responseData, function(index, value){
					var htmlStr = "<tr>";
					htmlStr += " <td>"+(index+1)+"</td>";
					htmlStr += " <td>"+value.name+"</td>";
					htmlStr += " <td>"+value["age"]+"</td>";
					htmlStr += " <td>"+value["주소"]+"</td>";
					htmlStr += " 	</tr>";
					
					//해당 요소 뒷부분에 컨텐츠를 추가한다.
					$('#tbl1').append(htmlStr);
				});
			},
			error : errFunc
		});
	});
});

/*
 	실패시 호출되는 콜백메소드도 콜백데이터를 가지고 있으며
 	아래와 같이 사용한다.
 */
function errFunc(errData) {
	alert("실패:" + errData.status+ ":"+errData.statusText);
}
</script>
</head>
<body>
	<div class="container">
	<h2>$.ajaxSetup() 메소드 사용하기</h2>
	
	<table class="table table-bordered" id="tbl1">
		<tr>
			<td>NO</td>
			<td>이름</td>
			<td>나이</td>
			<td>출신지역</td>
		</tr>
		hgjgkjgkghkgj
	</table>
	
	<button id="btn">JSON데이터 가져오기</button>	
</div>
	
</body>
</html>