function suaDichVu(ten, phi, id) {
    //  alert(ten + id+phi);
    $("#divTenLoaiBai").html("<div class='col-md-8'> <input name='ten' class='form-control' value='" + ten + "'/>" + "<input type='hidden' name='id' class='form-control' value='" + id + "'/></div><div class='col-md-3'><input type='submit' class='btn btn-success' value = 'Cập Nhật'/> </div> <br> <label style='padding-left:15px; padding-top:10px;'>Tiền Phí:</label> <br><div class='col-md-8'> <input name='tienPhi' class='form-control' value='" + phi + "' /></div>");
    $("#myModalSuaLoaiBai").modal();
}