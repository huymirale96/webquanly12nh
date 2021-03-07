using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebQuanLy12nh.Model
{
    public class DvuYTe
    {
        string id;
        int tienPhi;
        string tenDV;
        int soLuong;
        int tongTien;

        public DvuYTe(string id, int tienPhi, string tenDV, int soLuong, int tongTien)
        {
            this.Id = id;
            this.TienPhi = tienPhi;
            this.TenDV = tenDV;
            this.SoLuong = soLuong;
            this.TongTien = tongTien;
        }

        public DvuYTe()
        {
            this.Id = "";
            this.TienPhi = 1;
            this.TenDV = "";
            this.SoLuong = 1;
            this.TongTien = 1;
        }

        public string Id { get => id; set => id = value; }
        public int TienPhi { get => tienPhi; set => tienPhi = value; }
        public string TenDV { get => tenDV; set => tenDV = value; }
        public int SoLuong { get => soLuong; set => soLuong = value; }
        public int TongTien { get => tongTien; set => tongTien = value; }
    }
}