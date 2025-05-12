package ac.za.tut.servlets;

import ac.za.tut.entities.HackathonEvent;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class CreateHackathonServlet extends HttpServlet {

    @EJB
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        HttpSession session = request.getSession();
        
        HackathonEvent event = (HackathonEvent)session.getAttribute("hackathon");
        
        session.setAttribute("hackathon", event);
        
        RequestDispatcher disp = request.getRequestDispatcher("hackathon_creation_confirmation.html");
        disp.forward(request, response);
    }

}
