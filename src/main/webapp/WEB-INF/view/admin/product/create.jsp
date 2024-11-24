<%-- 
Document   : create
Created on : Nov 15, 2024, 3:02:15 PM
Author     : dkien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="Hỏi Dân IT - Dự án laptopshop"/>
    <meta name="author" content="Hỏi Dân IT"/>
    <title>Thêm mới sản phẩm</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(() => {
            const avatarFile = $("#product-image");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#image-preview").attr("src", imgURL);
                $("#image-preview").css({"display": "block"});
            });
        });
    </script>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Quản lý sản phẩm</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="/admin/product">Quản lý sản phẩm</a></li>
                    <li class="breadcrumb-item active">Thêm mới</li>
                </ol>
                <div class="mt-3">
                    <div class="row">
                        <div class="col-md-6 mb-3 col-12 mx-auto">
                            <h3>Thêm mới sản phẩm</h3>
                            <hr/>
                            <form:form method="post" action="/admin/product/create"
                                       modelAttribute="newProduct" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="name" class="form-label">Tên sản phẩm: </label>
                                        <form:input id="name" type="text"
                                                    cssClass="form-control" path="name"
                                                    cssErrorClass="form-control is-invalid"/>
                                        <form:errors cssClass="invalid-feedback" path="name"/>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="price" class="form-label">Giá: </label>
                                        <form:input path="price" id="price"
                                                    type="number" class="form-control"
                                                    cssErrorClass="form-control is-invalid"/>
                                        <form:errors cssClass="invalid-feedback" path="price"/>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-12 mb-3">
                                        <label for="description" class="form-label">Thông tin chi tiết: </label>
                                        <form:textarea path="detailDesc" id="description"
                                                       class="form-control" cssErrorClass="form-control is-invalid"
                                        ></form:textarea>
                                        <form:errors cssClass="invalid-feedback" path="detailDesc"/>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-9 mb-3">
                                        <label for="short-des" class="form-label">Thông tin tóm tắt: </label>
                                        <form:input path="shortDesc" id="short-des"
                                                    type="text" class="form-control"
                                                    cssErrorClass="form-control is-invalid"/>
                                        <form:errors cssClass="invalid-feedback" path="shortDesc"/>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label for="quantity" class="form-label">Kho </label>
                                        <form:input path="quantity" id="quantity"
                                                    type="number" class="form-control"
                                                    cssErrorClass="form-control is-invalid"/>
                                        <form:errors cssClass="invalid-feedback" path="quantity"/>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="brand" class="form-label">Hãng sản xuất: </label>
                                        <form:select path="factory" class="form-select" id="brand">
                                            <form:option value="Apple">Apple</form:option>
                                            <form:option value="Lenovo">Lenovo</form:option>
                                            <form:option value="Dell">Dell</form:option>
                                            <form:option value="Asus">Asus</form:option>
                                            <form:option value="Acer">Acer</form:option>
                                        </form:select>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="purpose" class="form-label">Mục đích: </label>
                                        <form:select path="purpose" class="form-select" id="purpose">
                                            <form:option value="Văn phòng">Văn phòng</form:option>
                                            <form:option value="Mỏng nhẹ">Mỏng nhẹ</form:option>
                                            <form:option value="Gaming">Gaming</form:option>
                                            <form:option value="Doanh nhân">Doanh nhân</form:option>
                                        </form:select>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="product-image" class="form-label">Ảnh sản phẩm</label>
                                    <input class="form-control" type="file" id="product-image"
                                           accept=".png, .jpg, .jpeg, .webp" name="imageFile"/>
                                </div>
                                <div class="mb-3">
                                    <img style="max-height: 250px; display: none;" alt="avatar preview"
                                         id="image-preview"/>
                                </div>
                                <div class="col-12 mb-5">
                                    <button type="submit" class="btn btn-primary">Tạo mới</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
</body>

</html>
