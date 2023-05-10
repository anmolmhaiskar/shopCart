package com.anmol.shopcart.servlets;

import com.anmol.shopcart.dao.CategoryDao;
import com.anmol.shopcart.dao.ProductDao;
import com.anmol.shopcart.entities.Category;
import com.anmol.shopcart.entities.Product;
import com.anmol.shopcart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

@WebServlet(name = "ProductOperationServlet", urlPatterns = {"/ProductOperationServlet"})
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            System.out.println("ProductOperationServlet");
            String operation = request.getParameter("operation");

            if (operation.trim().equals("addCategory")) {
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                Category category = new Category(title, description);
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category added sucessfully !!");
                response.sendRedirect("admin.jsp");
                return;
            } else if (operation.trim().equals("addProduct")) {
                String productName = request.getParameter("productName");
                String productDescription = request.getParameter("productDescription");
                int productPrice = Integer.parseInt(request.getParameter("productPrice"));
                int productDiscount = Integer.parseInt(request.getParameter("productDiscount"));
                int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
                Part part = request.getPart("prodPic");

                int catId = Integer.parseInt(request.getParameter("catId"));
                CategoryDao catdao = new CategoryDao(FactoryProvider.getFactory());
                Category catObj = catdao.getCategoryById(catId);

                Product prod = new Product();
                prod.setProductName(productName);
                prod.setProductDescription(productDescription);
                prod.setProductPrice(productPrice);
                prod.setProductDiscount(productDiscount);
                prod.setProductQuantity(productQuantity);
                prod.setCategory(catObj);
                prod.setProductPhoto(part.getSubmittedFileName());

                ProductDao prodDao = new ProductDao(FactoryProvider.getFactory());
                prodDao.saveProduct(prod);
    
                InputStream is = null;
                FileOutputStream fos = null;
                try{
//                    get path
                    String path = request.getServletContext().getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName();

//                    read and write file to products folder
                    is = part.getInputStream();
                    fos = new FileOutputStream(path);

                    byte[] data = new byte[is.available()];
                    is.read(data);
                    fos.write(data);
                    
                }catch(Exception e){
                    e.printStackTrace();
                }finally{
                    fos.close();
                    is.close();
                }
                
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Product added sucessfully !!");
                response.sendRedirect("admin.jsp");
                return;
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
