/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.universal.servlet;

import com.universal.dao.DriverDao;
import com.universal.dao.UserDao;
import com.universal.dto.Driver;
import com.universal.dto.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lenov0
 */
public class journeyServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
           /* out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet journeyServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet journeyServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
           String drivername=request.getParameter("drivername");
           String driverid;
            driverid = request.getParameter("driverid");
          String cityfrom=request.getParameter("cityfrom");
           String cityto=request.getParameter("cityto");
            String name=request.getParameter("name");
             String email=request.getParameter("email");
             String phone=request.getParameter("phone");
             String returndate= request.getParameter("returndate");
             String departuretime= request.getParameter("departuretime");
             String returntime= request.getParameter("returntime");
             String fare= request.getParameter("fare");
             String departuredate= request.getParameter("departuredate");
             int amount = 0;
             
             String username;
            username = request.getSession().getAttribute("login").toString();
            System.out.println(username);
            amount = UserDao.generateamount(cityfrom, cityto);
                  
                  User user=new User();
                  user.setCityfrom(cityfrom);
                  user.setUsername(username);
                  user.setCityto(cityto);
                  user.setEmail(email);
                  user.setPhone(phone);
                  user.setName(name);
                  user.setAmount(amount);
                  
                  Driver driver=new Driver();
                  driver.setCityFrom(cityfrom);
                  driver.setCityTo(cityto);
                  driver.setDeparturedate(departuredate);
                  driver.setDeparturetime(departuretime);
                  driver.setFare(fare);
                  driver.setReturndate(returndate);
                  driver.setReturntime(returntime);
                  driver.setName(drivername);
                  int id=Integer.parseInt(driverid);
                  driver.setId(id);
                  driver.setAmount(amount);
                  driver.setPassengername(name);
                  
                  UserDao.addjourneyrecord(user);
                  DriverDao.addDutyRecord(driver);
                  
           response.sendRedirect("payuform.jsp");
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
