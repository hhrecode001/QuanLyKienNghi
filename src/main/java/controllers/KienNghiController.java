/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Bean.KienNghiGopBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.KienNghi;
import models.KienNghiGop;
import models.PhanHoi;
import services.GopKienNghiService;
import services.KienNghiService;
import services.PhanHoiService;

/**
 *
 * @author ACER
 */

public class KienNghiController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            List<KienNghi> listKienNghi = KienNghiService.getKienNghi();
            List<KienNghiGop> listKienNghiGop = KienNghiService.getKienNghiGop();
            List<KienNghi> listKienNghiChuaGop = KienNghiService.getKienNghiChuaGop();
            List<KienNghiGopBean> listKienNghiGopBean = GopKienNghiService.getKienNghiGopBean();
            List<PhanHoi> listPhanHoi = PhanHoiService.getPhanHoi();
            List<KienNghi> listDaTraLoi = (List<KienNghi>) KienNghiService.getKienNghiDaTraLoi();
            request.setAttribute("listDaTraLoi", listDaTraLoi);
            request.setAttribute("listPH", listPhanHoi);
            request.setAttribute("listKNG", listKienNghiGop);
            request.setAttribute("listKNCG", listKienNghiChuaGop);
            request.setAttribute("listKN", listKienNghi);
            request.setAttribute("listKNGB", listKienNghiGopBean);
            request.getRequestDispatcher("info.jsp").forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(KienNghiController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(KienNghiController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
