/*
 * Copyright © 2019 Florian Geyer, Moritz Bielefeld
 * 
 * E-Mail: dhbw@windows3.de
 * Webseite: https://www.wpvs.de/
 * 
 * Dieser Quellcode ist lizenziert unter einer
 *  Intimmeat der rigorosen Ultrafalken
 */
package dhbwka.wwi.vertsys.javaee.recordcollecta.tasks.web;

import dhbwka.wwi.vertsys.javaee.recordcollecta.tasks.ejb.CategoryBean;
import dhbwka.wwi.vertsys.javaee.recordcollecta.tasks.ejb.TaskBean;
import dhbwka.wwi.vertsys.javaee.recordcollecta.tasks.jpa.Category;
import dhbwka.wwi.vertsys.javaee.recordcollecta.tasks.jpa.Task;
import dhbwka.wwi.vertsys.javaee.recordcollecta.tasks.jpa.TaskStatus;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Service
 */
@WebServlet(urlPatterns = {"/app/tasks/account/"})
public class AccountServlet extends HttpServlet {

    @EJB
    private CategoryBean categoryBean;
    
    @EJB
    private TaskBean taskBean;  
    
    
        @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Alle vorhandenen Kategorien ermitteln
        request.setAttribute("categories", this.categoryBean.findAllSorted());

        // Anfrage an dazugerhörige JSP weiterleiten
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/tasks/account.jsp");
        dispatcher.forward(request, response);

        // Alte Formulardaten aus der Session entfernen
        HttpSession session = request.getSession();
        session.removeAttribute("categories_form");
        
    }
    
}
