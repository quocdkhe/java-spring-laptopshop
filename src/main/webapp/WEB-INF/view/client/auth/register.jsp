<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Register</title>
    <link href="css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">Đăng kí</h3></div>
                            <div class="card-body">
                                <form:form method="post" action="/register" modelAttribute="registerUser">
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <form:input path="firstName" class="form-control" id="inputFirstName"
                                                            type="text" placeholder="Tên"/>
                                                <label for="inputFirstName">Tên</label>
                                                <form:errors cssClass="invalid-feedback" path="firstName"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <form:input path="lastName" class="form-control" id="inputLastName"
                                                            type="text" placeholder="Họ"/>
                                                <label for="inputLastName">Họ</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <form:input path="email" cssClass="form-control" id="inputEmail"
                                                    type="email" placeholder="name@example.com"
                                                    cssErrorClass="form-control is-invalid"/>
                                        <label for="inputEmail">Địa chỉ Email</label>
                                        <form:errors cssClass="invalid-feedback" path="email"/>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-4">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <form:input path="phone" class="form-control"
                                                            id="inputPhone" cssErrorClass="is-invalid form-control"
                                                            type="text" placeholder="Số điện thoại"/>
                                                <label for="inputPhone">Số điện thoại</label>
                                            </div>
                                            <form:errors path="phone" cssClass="invalid-feedback"/>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <form:input path="address" cssClass="form-control"
                                                            id="inputAddress" type="text"
                                                            cssErrorClass="form-control is-invalid"
                                                            placeholder="Địa chỉ"/>
                                                <label for="inputAddress">Địa chỉ</label>
                                            </div>
                                            <form:errors cssClass="invalid-feedback" path="address"/>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <form:input path="password" class="form-control" id="inputPassword"
                                                            cssErrorClass="form-control is-invalid"
                                                            type="password" placeholder="Mật khẩu"/>
                                                <label for="inputPassword">Mật khẩu</label>
                                            </div>
                                            <form:errors cssClass="invalid-feedback" path="password"/>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <form:input path="confirmPassword" cssClass="form-control"
                                                            id="inputPasswordConfirm" type="password"
                                                            cssErrorClass="form-control is-invalid"
                                                            placeholder="Xác nhận mật khẩu"/>
                                                <label for="inputPasswordConfirm">Xác nhận mật khẩu</label>
                                            </div>
                                        </div>
                                        <form:errors cssClass="invalid-feedback" path="confirmPassword"/>
                                    </div>
                                    <div class="mt-4 mb-0">
                                        <div class="d-grid">
                                            <button class="btn btn-primary" type="submit">Đăng kí</button>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                            <div class="card-footer text-center py-3">
                                <div class="small">Đã có tài khoản ?<a href="/login">Đăng nhập</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
</body>
</html>
