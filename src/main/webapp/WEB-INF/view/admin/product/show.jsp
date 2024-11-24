<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="Hỏi Dân IT - Dự án laptopshop"/>
    <meta name="author" content="Hỏi Dân IT"/>
    <title>Dashboard - Hỏi Dân IT</title>
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
                    <li class="breadcrumb-item active">Quản lí sản phẩm</li>
                </ol>
                <div class="mt-5">
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <div class="d-flex justify-content-between">
                                <h3>Bảng sản phẩm</h3>
                                <a href="/admin/product/create" class="btn btn-primary">Thêm mới sản phẩm</a>
                            </div>

                            <hr/>
                            <table class=" table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Giá</th>
                                    <th>Hãng sản xuất</th>
                                    <th>Số lượng kho</th>
                                    <th>Đã bán</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="p" items="${products}">
                                    <tr>
                                        <td>${p.id}</td>
                                        <td>${p.name}</td>
                                        <td><fmt:formatNumber type="number" value="${p.price}"/></td>
                                        <td>${p.factory}</td>
                                        <td>${p.quantity}</td>
                                        <td>${p.sold}</td>
                                        <td>
                                            <a href="/admin/product/${p.id}"
                                               class="btn btn-success">Chi tiết</a>
                                            <a href="/admin/product/update/${p.id}"
                                               class="btn btn-warning mx-2">Cập nhật</a>
                                            <a href="/admin/product/delete/${p.id}"
                                               class="btn btn-danger">Xóa</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
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