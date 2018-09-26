/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.universal.servlet;

import com.universal.dao.DriverDao;
import com.universal.dto.Driver;
import com.universal.mail.Mailer;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author lenov0
 */
public class RegisterServlet extends HttpServlet {

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
  String imgName="";
  String name="";
  String password="";
  String username="";
  String email="";
  String phone="";
  String city="";
  String lisence="";
  int age=0;
  String gender="";
  
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
          /*  out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
          
  String path = "";
String itemName = "";

FileItem item = null;
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (isMultipart)
{
FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
List items = upload.parseRequest(request);
Iterator itr = items.iterator();
while (itr.hasNext())
{
 item = (FileItem) itr.next();
if (!item.isFormField())
{
itemName = item.getName();
System.out.println("=================11====="+itemName);
imgName = itemName.toString();
int i = itemName.toString().lastIndexOf("\\");
imgName = imgName.substring(itemName.lastIndexOf("\\")+1);
System.out.println("================22======"+imgName);
System.out.println("================33======"+name);
System.out.println("================44======"+path);
path = getServletConfig().getServletContext().getRealPath("/");
path=path.replace("/build","");
path +="upload"+File.separator+imgName;
System.out.println("************"+path);
File savedFile = new File(path);
item.write(savedFile);
}  
else{
    System.out.println("**************NOT A FORM DATA");
     String fieldName = item.getFieldName();
      
      String fieldData = item.getString();
      
  
      if(fieldName.equals("name"))
      {
                  name = fieldData;
          System.out.println("======================FIELDNAME IS"+name);
      }
      if(fieldName.equals("password"))
      {
                  password = fieldData;
          System.out.println("======================FIELDNAME IS"+name);
      }
      if(fieldName.equals("ImageFile"))
      {
                  imgName = fieldData;
          System.out.println("======================FIELDNAME IS"+name);
      }
       if(fieldName.equals("username"))
      {
                  username = fieldData;
          System.out.println("======================FIELDNAME IS"+name);
      }
        if(fieldName.equals("email"))
      {
                  email = fieldData;
          System.out.println("======================FIELDNAME IS"+name);
      }
         if(fieldName.equals("phone"))
      {
                  phone = fieldData;
          System.out.println("======================FIELDNAME IS"+name);
      }
          if(fieldName.equals("city"))
      {
                  city = fieldData;
          System.out.println("======================FIELDNAME IS"+name);
      }
           if(fieldName.equals("lisence"))
      {
                  lisence = fieldData;
          System.out.println("======================FIELDNAME IS"+name);
      }
            if(fieldName.equals("gender"))
      {
                  gender = fieldData;
          System.out.println("======================FIELDNAME IS"+name);
      }
             if(fieldName.equals("age"))
      {
                  String s=fieldData;
                  age=Integer.parseInt(s);
          System.out.println("======================FIELDNAME IS"+name);
      }

    }
}


}

        Driver driver=new Driver();
        driver.setAge(age);
        driver.setCity(city);
        driver.setEmail(email);
        driver.setGender(gender);
        driver.setLisence(lisence);
        driver.setName(name);
        driver.setPassword(password);
        driver.setPhone(phone);
        driver.setProfile(imgName);
        driver.setUsername(username);
        
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 8) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String myHash = salt.toString();
       
        driver.setHash(myHash);
    
        
       DriverDao.addDriver(driver);
       
         Mailer.send("javademo2987@gmail.com","javademo@2987",email," email verification","Your verification link is"+ "   http://localhost:12142/HireDriverMain/ActivateAccount?key1="+email+"&key2="+myHash); 
             response.sendRedirect("homepage.jsp");
        } catch (Exception ex) {
           ex.printStackTrace();
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
