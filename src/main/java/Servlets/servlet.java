/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entity.Employee;
import Entity.Person;
import Entity.Student;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mshao
 */
@WebServlet("/servlet")
public class servlet extends HttpServlet {

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
        String action = request.getServletPath();
        /* Create EntityManagerFactory */
        EntityManagerFactory emf = Persistence
                .createEntityManagerFactory("com.mycompany_Assignment2_war_1.0-SNAPSHOTPU");

        /* Create EntityManager */
        EntityManager em = emf.createEntityManager();
        EntityTransaction transaction = em.getTransaction();
        transaction.begin();

        if (action.equals("/add")) {
            String type = request.getParameter("type");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");

            if (type.equals("student")) {
                try {

                    Student s = new Student();

                    s.setName(name);
                    s.setAddress(address);
                    s.setEmail(email);
                    s.setPhone(phone);

                    em.persist(s);

                    transaction.commit();

                } catch (Exception ex) {
                    Logger.getLogger(servlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                try {

                    Employee e = new Employee();

                    e.setName(name);
                    e.setAddress(address);
                    e.setEmail(email);
                    e.setPhone(phone);

                    em.persist(e);

                    transaction.commit();

                } catch (Exception ex) {
                    Logger.getLogger(servlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            try (PrintWriter out = response.getWriter()) {
                out.println("Record added successfully");
            }

        }
        if (action.equals("/search")) {
            long id = Long.parseLong(request.getParameter("id"));
            Person p = em.find(Person.class, id);
            try (PrintWriter out = response.getWriter()) {
                out.println(p.toString());
            }
        }
        if (action.equals("/delete")) {
            long id = Long.parseLong(request.getParameter("id"));
            Person p = em.find(Person.class, id);
            em.remove(p);
            transaction.commit();
            try (PrintWriter out = response.getWriter()) {
                out.println("Record deleted successfully");
            }
        }
        if (action.equals("/update")) {
            long id = Long.parseLong(request.getParameter("id"));
            Person p = em.find(Person.class, id);
            em.remove(p);
            
            String type = request.getParameter("type");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");

           if (type.equals("student")) {
                try {
                    Student s = new Student();

                    s.setName(name);
                    s.setAddress(address);
                    s.setEmail(email);
                    s.setPhone(phone);

                    em.persist(s);

                    transaction.commit();

                } catch (Exception ex) {
                    Logger.getLogger(servlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                try {

                    Employee e = new Employee();

                    e.setName(name);
                    e.setAddress(address);
                    e.setEmail(email);
                    e.setPhone(phone);

                    em.persist(e);

                    transaction.commit();

                } catch (Exception ex) {
                    Logger.getLogger(servlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            try (PrintWriter out = response.getWriter()) {
                out.println("Record updated successfully");
            }
        }
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
