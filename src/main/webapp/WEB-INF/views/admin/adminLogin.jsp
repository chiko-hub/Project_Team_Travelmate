<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <link rel="stylesheet" href="/admin/css/admin.css">
    <script src="/admin/script/admin.js"></script>

</head>
<body>

<section id="login-container">
    <h2>Admin Login</h2>
    <form method="post" action="/adminLogin">
        <div class="field">
            <label for="username">Admin ID</label>
            <input type="text" id="username" name="adminid" placeholder="아이디를 입력하세요" required >
        </div>
        <div class="field">
            <label for="password">Password</label>
            <input type="password" id="password" name="pwd" placeholder="비밀번호를 입력하세요" required>
        </div>
        <div class="btn-group">
            <input type="submit" value="로그인" class="btn-submit">
        </div>
    </form>
</section>


</body>
</html>