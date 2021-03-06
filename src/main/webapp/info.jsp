<%-- 
    Document   : info
    Created on : Nov 24, 2020, 11:07:40 AM
    Author     : ACER
--%>

<%@page import="models.PhanHoi"%>
<%@page import="Bean.KienNghiGopBean"%>
<%@page import="models.KienNghiGop"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="models.KienNghi"%>
<%@page import="models.KienNghi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <link type="text/css" rel="stylesheet" href="common/admin.css">
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <title>Quản lý kiến nghị</title>
    </head>
    <body>
        <div class="wrapper">
            <div class="sidebar">
                <h2>Quản Lý</h2>
                <ul>
                    <li><a href="adminpage.jsp"><i class="fas fa-home"></i>Trang chủ</a></li>
                    <li><a href="quanly"><i class="fas fa-address-card"></i>Thông Tin Kiến Nghị</a></li>                    
                    <li><a href="#"><i class="fas fa-address-book"></i>Gửi Kiến Nghị</a></li>
                    <li><a href="login.jsp">Đăng Xuất</a></li>
                </ul> 
                <div class="social_media">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
            <div class="main_content">
                <div class="header"><h1>QUẢN LÝ KIẾN NGHỊ</h1></div> 
                <%
                    List<KienNghiGop> listKienNghiGop = (List<KienNghiGop>) request.getAttribute("listKNG");
                    List<KienNghi> listKienNghi = (List<KienNghi>) request.getAttribute("listKN");
                    List<KienNghi> listKienNghiChuaGop = (List<KienNghi>) request.getAttribute("listKNCG");
                    List<KienNghi> listKienNghiChuaGopORDER = (List<KienNghi>) request.getAttribute("listKNCG1");
                    List<KienNghi> listDaTraLoi = (List<KienNghi>) request.getAttribute("listDaTraLoi");
                    List<KienNghiGopBean> listKienNghiGopBean = (List<KienNghiGopBean>) request.getAttribute("listKNGB");
                    List<PhanHoi> listPhanHoi = (List<PhanHoi>) request.getAttribute("listPH");
                    if (request.getParameter("type") != null) {
                        listKienNghi = (List<KienNghi>) request.getAttribute("listKN1");
                    }
                %>

                <div>
                    <div class="header"><h2>KIẾN NGHỊ GỘP</h2></div>
                    <table class="table table-bordered">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col" style="width: 2%"></th>
                                <th scope="col" style="width: 70%">Tiêu đề gộp</th>
                                <th scope="col">Số lần phản ánh</th>
                                <th scope="col" style="width: 2%"></th>
                            </tr>
                        </thead>
                        <tbody>

                            <% for (int i = 0; i < listKienNghiGopBean.size(); ++i) {
                                    KienNghiGopBean kngb = listKienNghiGopBean.get(i);
                                    KienNghiGop kng = kngb.getKienNghiGop();
                                    int kngID = kng.getMaKienNghiGop();
                                    List<KienNghi> kienNghiThanhPhan = kngb.getThanhPhanGop();
                                    String hrefToggleIdGop = "#" + "toggleIdGop" + i;
                                    String toggleIdGop = "toggleIdGop" + i;
                                    String chinhSuaId = "chinhSua" + i;
                                    String xoaId = "xoa" + i;
                            %>

                            <tr>
                                <td>
                                    <span style="cursor: pointer;" class="accordion-toggle collapsed"
                                          data-toggle="collapse" href="<%=hrefToggleIdGop%>">+</span>
                                </td>
                                <td><%=kng.getTieuDeGop()%></td>
                                <td><%=kng.getSoLanPA()%></td>
                            </tr>
                            <tr class="hide-table-padding">
                                <td></td>
                                <td colspan="5">
                                    <div id="<%=toggleIdGop%>" class="collapse in p-3">
                                        <div class="row">
                                            <h5>Nội dung gộp:<br>
                                                <%=kng.getNoiDungGop()%><br></h5>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2">
                                                <form action="modify.jsp" id="<%=chinhSuaId%>">
                                                    <input type="hidden" name="kngID" value="<%=kngID%>">  
                                                    <button type="submit" form="<%=chinhSuaId%>" class="btn btn-info">Chỉnh sửa</button>
                                                </form>
                                            </div>
                                            <div class="col-lg-2">
                                                <form action="chinhSua" id="<%=xoaId%>" method="post">
                                                    <input type="hidden" name="kngID" value="<%=kngID%>">  
                                                    <button type="submit" name="xoaKNG" form="<%=xoaId%>" class="btn btn-warning">Xóa kiến nghị gộp</button>
                                                </form>
                                            </div>
                                        </div>

                                    </div>
                                </td>
                            </tr>
                            <% }%>

                        </tbody>
                    </table>

                    <form action="gopKienNghi" id="gopKienNghi" method="post">
                        <div class="header"><h2>KIẾN NGHỊ CHƯA TRẢ LỜI</h2></div>    
                        <table class="table table-hover table-bordered">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col" style="width: 2%"></th>
                                    <th scope="col" style="width: 50%">Tiêu đề</th>
                                    <th scope="col" style="width: 15%">                                      
                                        <div class="dropdown">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Phân loại
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <button class="dropdown-item" type="submit" value="Tất cả" name="PhanLoai" formaction="quanly_sapxep">Tất cả</button>
                                                <button class="dropdown-item" type="submit" value="Chính sách" name="PhanLoai" formaction="quanly_sapxep">Chính sách</button>
                                                <button class="dropdown-item" type="submit" value="Đất đai" name="PhanLoai" formaction="quanly_sapxep">Đất Đai</button>
                                                <button class="dropdown-item" type="submit" value="Y tế" name="PhanLoai" formaction="quanly_sapxep">Y tế</button>
                                                <button class="dropdown-item" type="submit" value="Môi trường" name="PhanLoai" formaction="quanly_sapxep">Môi trường</button>

                                            </div>
                                        </div>            
                                    </th>
                                    <th scope="col" style="width: 15%"><div class="dropdown">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Ngày phản ánh
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <button class="dropdown-item" type="submit" value="Mới nhất" name="Ngay" formaction="quanly_sapxep">Mới nhất</button>
                                                <button class="dropdown-item" type="submit" value="Cũ nhất" name="Ngay" formaction="quanly_sapxep">Cũ nhất</button>
                                            </div>
                                        </div></th>
                                    <th scope="col">
                                        Trạng thái
                                        </div></th>
                                    <th scope="col" style="width: 2%"></th>
                                </tr>
                            </thead>
                            <!--</form>-->

                            <tbody>

                                <% int i;
                                    if (request.getParameter("order") != null) {
                                        listKienNghiChuaGop = listKienNghiChuaGopORDER;
                                    }
                                    for (i = 0; i < listKienNghiChuaGop.size(); ++i) {
                                        KienNghi kn = listKienNghiChuaGop.get(i);
                                        String hrefToggleId = "#" + "toggle" + i;
                                        String toggleId = "toggle" + i;
                                        int id = kn.getMaKienNghi();
                                        String checkboxID = "customCheck" + Integer.toString(i);
                                        if (kn.getTrangThai().equals("chưa trả lời")) {
                                %>

                                <tr>
                                    <td>
                                        <span style="cursor: pointer;" class="accordion-toggle collapsed"
                                              data-toggle="collapse" href="<%=hrefToggleId%>">+</span>
                                    </td>
                                    <td><%=kn.getTieuDe()%></td>
                                    <td><%=kn.getPhanLoai()%></td>
                                    <td><%=kn.getNgayPhanAnh()%></td>
                                    <td><%=kn.getTrangThai()%></td>
                                    <td>
                                        <div class="custom-control custom-checkbox mb-3">
                                            <input type="checkbox" class="custom-control-input" id="<%=checkboxID%>" name="selectedKN"
                                                   value="<%=id%>">
                                            <label class="custom-control-label" for="<%=checkboxID%>"></label>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="hide-table-padding">
                                    <td></td>
                                    <td colspan="5">
                                        <div id="<%=toggleId%>" class="collapse in p-3">
                                            <div class="row">
                                                <h5>Nội dung kiến nghị:</h5>
                                            </div>
                                            <div class="row">
                                                <p><%=kn.getNoiDung()%></p>
                                            </div>
                                        </div></td>
                                </tr>
                                <% }
                                    }%>

                            </tbody>
                        </table>
                        <!-- Button trigger modal -->
                        <div class="row justify-content-center">
                            <%
                                String err = request.getParameter("err");
                                if ("1".equals(err)) {
                                    out.print("<h5 style=\"color: red;\">Chưa chọn kiến nghị!</h5>");
                                } else if ("2".equals(err)) {
                                    out.print("<h5 style=\"color: red;\">Chưa điền tiêu đề hoặc nội dung!</h5>");
                                }

                                String message = request.getParameter("mes");
                                if ("success".equals(message)) {
                                    out.print("<h5 style=\"color: green;\">Gộp thành công!</h5>");
                                }
                            %>
                        </div>
                        <div class="row">
                            <button id="gop" type="button" class="btn btn-success mx-auto" data-toggle="modal" data-target="#exampleModalCenter">
                                Gộp
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLongTitle">Gộp kiến nghị đã chọn</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="inputTieuDe">Tiêu đề gộp</label>
                                                <input type="text" class="form-control" id="inputTieuDe" name="tieuDeGop">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputNoiDung">Nội dung gộp</label>
                                                <textarea class="form-control" id="inputNoiDung" rows="5" name="noiDungGop"></textarea> 
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                            <button type="submit" name="gopkn" form="gopKienNghi" class="btn btn-primary">Đồng ý</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div>
                        <div class="header"><h2>KIẾN NGHỊ ĐÃ TRẢ LỜI</h2></div>
                        <table class="table table-hover table-bordered">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col" style="width: 2%"></th>
                                    <th scope="col">Tiêu đề</th>
                                    <th scope="col">                                      
                                        <div class="dropdown">
                                            Phân loại
                                        </div>            
                                    </th>
                                    <th scope="col">
                                        Ngày phản ánh

                                    </th>
                                    <th scope="col">
                                        Trạng thái
                                        </div></th>
                                </tr>
                            </thead>
                            <!--</form>-->

                            <tbody>

                                <%
                                    for (i = 0; i < listDaTraLoi.size(); ++i) {
                                        KienNghi kn = listDaTraLoi.get(i);
                                        String hrefToggleId = "#" + "toggle" + (i + listKienNghiChuaGop.size());
                                        String toggleId = "toggle" + (i + listKienNghiChuaGop.size());
                                        int id = kn.getMaKienNghi();

                                        if (kn.getTrangThai().equals("đã trả lời")) {
                                            String NoiDung = "";
                                            for (int j = 0; j < listPhanHoi.size(); j++) {
                                                if (id == listPhanHoi.get(j).getId()) {
                                                    NoiDung = listPhanHoi.get(j).getNoiDung();
                                                    break;
                                                }
                                            }
                                %>

                                <tr>
                                    <td>
                                        <span style="cursor: pointer;" class="accordion-toggle collapsed"
                                              data-toggle="collapse" href="<%=hrefToggleId%>">+</span>
                                    </td>
                                    <td><%=kn.getTieuDe()%></td>
                                    <td><%=kn.getPhanLoai()%></td>
                                    <td><%=kn.getNgayPhanAnh()%></td>
                                    <td><%=kn.getTrangThai()%></td>
                                </tr>
                                <tr class="hide-table-padding">
                                    <td></td>
                                    <td colspan="5">
                                        <div id="<%=toggleId%>" class="collapse in p-3">
                                            <div class="row">
                                                <h5>Nội dung kiến nghị:</h5>
                                            </div>
                                            <div class="row">
                                                <p><%=kn.getNoiDung()%></p>
                                            </div>
                                            <div class="row">
                                                <h5>Nội dung phản hồi:</h5>
                                            </div>
                                            <div class="row">
                                                <p><%=NoiDung%></p>
                                            </div>
                                            <div class="row">

                                            </div>
                                        </div></td>
                                </tr>
                                <% }
                                    }%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    </body>
</html>