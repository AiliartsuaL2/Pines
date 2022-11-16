<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


<style>
.div_Wrap{
  display: flex;
  justify-content: center;
}

.navigation_wrap{
	position : absolute;
    left: 4.5%;
    top: 26%;
    width: 19%;
    height: 30%;
}
.navigation_title_wrap{
	width : 99%;
	height : 18%;
	padding-top : 5%;
	text-align : center;
	border: solid 1px #FA6A6A;
	background-color : #FA6A6A;
	
}
.navigation_title{
	width : 100%;
	height : 100%;
	background-color : #FA6A6A;
	color : white;
	font-size : 20pt;
	font-weight : bold;
}
.big_category_wrap{
	width : 99.7%;
	height : 18%;
	text-align : center;
	background-color : #FA6A6A;
}
.big_category_plant{
	width : 50%;
	float : left;
	border : 0;
	height : 100%;
	background-color : #FA6A6A;
	border-top: solid 1px white;
	border-right: solid 1px white;
	color : white;
	font-size : 16pt;
	font-weight : bold;
	cursor : pointer;
}
.big_category_flower{
	width : 50%;
	float : left;
	border : 0;
	height : 100%;
	background-color : #FA6A6A;
	border-top: solid 1px white;
	color : white;
	font-size : 16pt;
	font-weight : bold;
	cursor : pointer;
}

.plant_wrap{
	float : left;
	width : 50%;
	height : 100%;
}

.flower_wrap{
	float : left;
	width : 50%;
	height : 101.5%;
}
.btn_plant{
	margin-top : -1px;
	width : 100%;
	height : 17%;
	
}
.btn_flower{
	margin-left : -1px;
	margin-top : -1px;
	width : 100%;
	height : 25%;
}

.btn_seed{
	background-color : white;
	color : #D5D5D5;
	border: solid 1px #FA6A6A;
	width : 100%;
	height : 100%;
	font-size : 15px;
	cursor : pointer;
}

.btn_airplant{
	background-color : white;
	color : #D5D5D5;
	border: solid 1px #FA6A6A;
	width : 100%;
	height : 100%;
	font-size : 15px;
	cursor : pointer;
}
.btn_potted{
	background-color : white;
	color : #D5D5D5;
	border: solid 1px #FA6A6A;
	width : 100%;
	height : 100%;
	font-size : 15px;
	cursor : pointer;
}
.btn_orchid{
	background-color : white;
	color : #D5D5D5;
	border: solid 1px #FA6A6A;
	width : 100%;
	height : 100%;
	font-size : 15px;
	cursor : pointer;
}
.btn_succulents{
	background-color : white;
	color : #D5D5D5;
	border: solid 1px #FA6A6A;
	width : 100%;
	height : 100%;
	font-size : 15px;
	cursor : pointer;
}
.btn_herb{
	background-color : white;
	color : #D5D5D5;
	border: solid 1px #FA6A6A;
	width : 100%;
	height : 100%;
	font-size : 15px;
	cursor : pointer;
}
.btn_anniversary{
	background-color : white;
	color : #D5D5D5;
	border: solid 1px #FA6A6A;
	width : 100%;
	height : 100%;
	font-size : 15px;
	cursor : pointer;
}
.btn_opening{
	background-color : white;
	color : #D5D5D5;
	border: solid 1px #FA6A6A;
	width : 100%;
	height : 100%;
	font-size : 15px;
	cursor : pointer;
}
.btn_promotion{
	background-color : white;
	color : #D5D5D5;
	border: solid 1px #FA6A6A;
	width : 100%;
	height : 100%;
	font-size : 15px;
	cursor : pointer;
}
.btn_remembrance{
	background-color : white;
	color : #D5D5D5;
	border: solid 1px #FA6A6A;
	width : 100%;
	height : 100%;
	font-size : 15px;
	cursor : pointer;
}
</style>
<body >
<div class="div_Wrap">
<div class="navigation_wrap">
	<div class="navigation_title_wrap">
		<label class="navigation_title">카테고리</label>
	</div>
	<div class="big_category_wrap">
			<input type="button" id="big_category_plant" class="big_category_plant" value="식물" onclick="location='plantList.do?parentCategoryId=plant'" >
			<input type="button" id="big_category_flower" class="big_category_flower" value="꽃/화환" onclick="location='flowerList.do?parentCategoryId=flower'">
	</div>
	<div class="plant_wrap">
		<div class="btn_plant">
			<input type="button" id="btn_seed" class="btn_seed" value="묘목/묘종" onclick="location='plantList.do?categoryId=seed'">
		</div>
		<div class="btn_plant">
			<input type="button" id="btn_airplant" class="btn_airplant" value="식물/공중식물" onclick="location='plantList.do?categoryId=airplant'">
		</div>
		<div class="btn_plant">
			<input type="button" id="btn_potted" class="btn_potted" value="관엽/공기정화" onclick="location='plantList.do?categoryId=potted'">
		</div>
		<div class="btn_plant">
			<input type="button" id="btn_succlents" class="btn_succulents" value="다육/선인장" onclick="location='plantList.do?categoryId=succulents'">
		</div>
		<div class="btn_plant">
			<input type="button" id="btn_orchid" class="btn_orchid" value="동양란/서양란" onclick="location='plantList.do?categoryId=orchid'">
		</div>
		<div class="btn_plant">
			<input type="button" id="btn_herb" class="btn_herb" value="야생/허브/분재" onclick="location='plantList.do?categoryId=herb'">
		</div>
	</div>
	<div class="flower_wrap">
		<div class="btn_flower">
			<input type="button" id="btn_anniversary" class="btn_anniversary" value="생일/기념일" onclick="location='flowerList.do?categoryId=anniversary'">
		</div>
		<div class="btn_flower">
			<input type="button" id="btn_opening" class="btn_opening" value="개업/이전" onclick="location='flowerList.do?categoryId=opening'">
		</div>
		<div class="btn_flower">
			<input type="button" id="btn_promotion" class="btn_promotion" value="승진/취임" onclick="location='flowerList.do?categoryId=promotion'">
		</div>
		<div class="btn_flower">
			<input type="button" id="btn_remembrance" class="btn_remembrance" value="추모/근조" onclick="location='flowerList.do?categoryId=remembrance'">
		</div>
	
	</div>
</div>

</div>
</body>
</html>