/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.KienNghi;
import services.SapXepService;

/**
 *
 * @author MSI GV62
 */
public class SapXepController extends HttpServlet {

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
        String req = request.getParameter("PhanLoai");
        String req1 = request.getParameter("Ngay");
        if (req != null) {
            if (req.equals("Tất cả")) {
                response.sendRedirect("quanly");
            } else {
                try {
                    ArrayList<KienNghi> listKN = SapXepService.OrderByType(req);
                    request.setAttribute("listKN1", listKN);
                    request.getRequestDispatcher("quanly?type=" + req).forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(SapXepController.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(SapXepController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } else if (req1 != null) {
            try {
                ArrayList<KienNghi> listKN = new ArrayList<KienNghi>();
                if (req1.equals("Mới nhất")) {
                    listKN = SapXepService.OrderByDateDESC();
                } else {
                    listKN = SapXepService.OrderByDateASC();
                }
                request.setAttribute("listKN1", listKN);
                request.getRequestDispatcher("quanly?type=date").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(SapXepController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(SapXepController.class.getName()).log(Level.SEVERE, null, ex);
            }
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