<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>单图片上传</title>
</head>
<body>
<fieldset>
<legend>图片上传</legend>
<h2>多张图片上传 单张10M以下的 PNG、JPG、GIF 格式的图片</h2>
<form action="program/edit.do" method="post" enctype="multipart/form-data">
    选择文件:<input type="file" name="file">

    选择文件1:<input type="file" name="file">

    选择文件:<input type="file" name="file">
    <input type="submit" value="上传"> 
</form>
</fieldset>
</body>
</html>