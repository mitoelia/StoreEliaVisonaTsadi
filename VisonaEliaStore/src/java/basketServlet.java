/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.google.gson.Gson;
import com.google.gson.stream.JsonWriter;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Elia
 */
@WebServlet(urlPatterns = {"/basketServlet"})
public class basketServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet basketServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet basketServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
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
        
        String s;
        s = request.getParameterNames().toString();
        response.setContentType("application/json");
        PrintWriter writer = response.getWriter();
        try {
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(prodottiServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InstantiationException ex) {
                Logger.getLogger(prodottiServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IllegalAccessException ex) {
                Logger.getLogger(prodottiServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            Connection con = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1;instanceName=ELIA_SQL;databaseName=VisonaEliaStore;user=ecommercestore;password=ecommercestore;");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT BasketId, Descrizione, Prezzo, Quantità FROM dbo.Prodotti inner join dbo.Basket on dbo.Prodotti.ProdottoId = dbo.Basket.ProdottoId WHERE dbo.Basket.UtenteId = 1");    //iteratore aperto su una connessione odbc
            //è un navigatore, leggo i risultati un pò per volta
        
            response.setCharacterEncoding("utf-8");
            
            writer.print("[");

            

            boolean first = true;
            while (true) {
                
                if(!rs.next()) break;
                
                if (first) {
                    first = false;
                } else {
                    writer.println(",");
                }

                writer.print("{");
                writer.printf(" \"Descrizione\": \"%s\"", rs.getString("Descrizione"));
                writer.printf(", \"Prezzo\": \"%s\"", rs.getString("Prezzo"));
                writer.printf(", \"BasketId\": \"%s\"", rs.getString("BasketId"));
                writer.printf(", \"Quantita\": \"%s\"", rs.getString("Quantità"));
                writer.print(" }");
            }

            //readerContatti.close();

            writer.print("]");
            con.close();
            
            } catch (SQLException ex) {
                writer.print("Errore :(");
            Logger.getLogger(prodottiServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        
        
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        BasketViewModel basket = (BasketViewModel)gson.fromJson(reader, BasketViewModel.class);
        
        try {
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(basketServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InstantiationException ex) {
                Logger.getLogger(basketServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IllegalAccessException ex) {
                Logger.getLogger(basketServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            Connection con = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1;instanceName=ELIA_SQL;databaseName=VisonaEliaStore;user=ecommercestore;password=ecommercestore;");
            Statement stmt = con.createStatement();
            
            String sql = "INSERT into dbo.Basket (OrdineId, UtenteId, ProdottoId, Quantità) "
                    + "VALUES("
                    + "'" + basket.OrdineId + "'"
                    + ", '" + basket.UserId + "'"
                    + ", '" + basket.ProdottoId + "'"
                    + ", '" + basket.Quantita + "'"
                    + ")";
            
            stmt.execute(sql);
            
            JsonWriter writer = new JsonWriter(response.getWriter());
            gson.toJson(
                    Risposta.OK, 
                    Risposta.class, 
                    writer
            );
            
            
            con.close();
            
            } catch (SQLException ex) {
                Logger.getLogger(basketServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
    
    
    
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        BasketViewModel contatto = (BasketViewModel)gson.fromJson(reader, BasketViewModel.class);
        
        try {
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(basketServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InstantiationException ex) {
                Logger.getLogger(basketServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IllegalAccessException ex) {
                Logger.getLogger(basketServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            Connection con = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1;instanceName=ELIA_SQL;databaseName=VisonaEliaStore;user=ecommercestore;password=ecommercestore;");
            Statement stmt = con.createStatement();
            
            String sql = "delete from dbo.Basket "
                    + " WHERE BasketId = " + request.getParameter("BasketId")
                    ;
            
            stmt.execute(sql);
            
            JsonWriter writer = new JsonWriter(response.getWriter());
            gson.toJson(
                    Risposta.OK, 
                    Risposta.class, 
                    writer
            );
            
            
            con.close();
            
            } catch (SQLException ex) {
                Logger.getLogger(basketServlet.class.getName()).log(Level.SEVERE, null, ex);
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
