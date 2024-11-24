<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="Hỏi Dân IT - Dự án laptopshop"/>
    <meta name="author" content="Hỏi Dân IT"/>
    <title>Detail product</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Quản lí sản phẩm</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active"><a href="/admin/product">Danh sách sản phẩm</a></li>
                    <li class="breadcrumb-item active">Thông tin chi tiết</li>
                </ol>
                <div class="container mt-3">
                    <div class="row">
                        <div>
                            <h3>Thông tin sản phẩm id = ${id}</h3>
                        </div>
                        <hr/>
                        <div class="col-md-5">
                            <img style="width: 100%" src="/images/product/${product.image}"/>
                        </div>
                        <div class="col-md-7">
                            <div class="card" style="width: 100%">
                                <div class="card-header">
                                    Thông tin sản phẩm
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">ID: ${product.id}</li>
                                    <li class="list-group-item">Tên sản phẩm: ${product.name}</li>
                                    <li class="list-group-item">Hãng sản xuất: ${product.factory}</li>
                                    <li class="list-group-item">Giá thành: <fmt:formatNumber type="number" value="${product.price}"/></li>
                                    <li class="list-group-item">Mục đích: ${product.purpose}</li>
                                    <li class="list-group-item">Thông tin chung: ${product.detailDesc}</li>
                                    <li class="list-group-item">Thông tin tóm tắt: ${product.shortDesc}</li>
                                    <li class="list-group-item">Số lượng kho : ${product.quantity}</li>
                                    <li class="list-group-item">Đã bán : ${product.sold}</li>
                                </ul>
                            </div>

                        </div>
                        <div class="col-12 mb-3">
                            <a href="/admin/product" class="btn btn-success mt-3">Quay lại</a>
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