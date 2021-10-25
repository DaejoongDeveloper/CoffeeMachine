<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String btnMilkState = "";
String btnCoffee = "";

//btnMilkState = (String)request.getAttribute("btnMilkState"); 
if ((String) request.getAttribute("btnMilkState") != null) {
	btnMilkState = "ok";
}

btnCoffee = (String) request.getAttribute("btnCoffee");
if (btnCoffee == null) {
	btnCoffee = "coffeeOut";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffee Vending Machine</title>
<style type="text/css">
#content {
	width: 900px;
	height: 1300px;
	margin: 40px auto;
	border: 10px solid #eee;
	padding: 30px;
}

table {
	width: 100%;
	border: 5px solid #ddd;
	padding: 5px;
	margin: 5px auto;
}

td {
	width: 100px;
	border: 2px solid #aaa;
	padding: 5px;
	text-align: center;
}

.coffee {
	background-color: black;
	color: white;
	font-weight: 900;
	font-size: 2em;
}

#imgReturn {
	width: 69px;
	height: 67px;
	background-image: url(img/return.png);
}

#img500 {
	width: 80px;
	height: 80px;
	background-image: url(img/coin500.png);
}

#img100 {
	width: 80px;
	height: 80px;
	background-image: url(img/coin100.png);
}

#img50 {
	width: 80px;
	height: 80px;
	background-image: url(img/coin50.png);
}

#aaa{
	width: 200px;
	hieght: 300px;
	background-position: center;
	background-image: url(img/coffeeOut.png);
	background-repeat: no-repeat;
	}
	
	#outImage { 
	margin-top: 50px; 
	width: 100x; 
	height: 150px; 
} 

	
	

</style>
</head>
<body>
	<div id="content">
		<form action="vm" method="post">
			<table>
			<tr>
				<td colspan="3" id = "bbb">
				<img src = "img/vmbackground.png" width = 860 height = 300>
			</tr>
				<tr>
					<td class="coffee">밀크커피</td>
					<td class="coffee">프림커피</td>
					<td class="coffee">블랙커피</td>
				</tr>
				<tr>
					<td colspan="1"><img src="img/milk.png">
					<td colspan="1"><img src="img/cream.png">
					<td colspan="1"><img src="img/black.png">
				</tr>
				<tr>
					<td class="price">300원</td>
					<td class="price">300원</td>
					<td class="price">200원</td>
				</tr>

				<tr>
					<td class="btn">
						<%
						if (btnMilkState.equals("ok")) {
						%> <input type="submit"
						name="btnCoffee" value="밀크"> <%} else {%> <input
						type="submit" disabled name="btnCoffee" value="밀크"> <%}%>
					</td>
					<td class="btn"><input type="submit"
						${(empty btnCreamState)? "disabled" : ""} name="btnCoffee"
						value="프림"></td>
					<td class="btn"><input type="submit"
						${(empty btnBlackState)? "disabled" : ""} name="btnCoffee"
						value="블랙"></td>
				</tr>
				
				
				
				<tr>
					<td class="coffee">레쓰비</td>
					<td class="coffee">사이다</td>
					<td class="coffee">콜라</td>
				</tr>
				<tr>
					<td colspan="1"><img src="img/canCoffee.png" width= 120px height = 120px>
					<td colspan="1"><img src="img/canFanta.png" width= 120px height = 120px>
					<td colspan="1"><img src="img/canCola.png" width= 120px height = 120px>
				</tr>
				<tr>
					<td class="price">500원</td>
					<td class="price">500원</td>
					<td class="price">700원</td>
				</tr>

				<tr>
					<td class="btn"><input type="submit" 
						${(empty btncanCoffeeState)? "disabled" : ""} name="btnCoffee"
						value="레쓰비"></td>
					<td class="btn"><input type="submit" 
						${(empty btncanFantaState)? "disabled" : ""} name="btnCoffee"
						value="사이다"></td>
					<td class="btn"><input type="submit"
						${(empty btncanColaState)? "disabled" : ""} name="btnCoffee"
						value="콜라"></td>
				</tr>
				
				
				<tr>
					<td colspan="1" class="coin"><input type="submit" id="img500"
						name="btnCoin" value="500"></td>
					<td colspan="1" class="coin"><input type="submit" id="img100"
						name="btnCoin" value="100"></td>
					<td colspan="1" class="coin"><input type="submit" id="img50"
						name="btnCoin" value="50"></td>
				</tr>
				<tr>
					<td>잔액 : <input type="text" name="inMoney" value="${inMoney}"
						style="text-align: center; width: 120px;"></td>
					<td>메시지 : <input type="text" name="message" value="${message}"
						style="text-align: center; width: 120px;"></td>
					<td><input type="submit" id="imgReturn" name="btnReturn"
						value="반환"></td>
				</tr>
				<tr>
					<td colspan="2" id="aaa">
						<img id = "outImage" src="img/<%=btnCoffee%>.png" >
				
					
					<td colspan="1">반환된 동전<br> 500원 : <input type="text"
						name="m500" value="${m500}"><br> 
						100원 : <input type="text" name="m100" value="${m100}"><br> 
						50원 : <input type="text" name="m50" value="${m50}">
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>