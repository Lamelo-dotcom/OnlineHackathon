package ac.za.tut.servlets;

import ac.za.tut.entities.HackathonEvent;
import ac.za.tut.sb.HackathonEventFacadeLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GetHackathonServlet extends HttpServlet {

    @EJB
    private HackathonEventFacadeLocal hackFl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Long hackathonId = Long.valueOf(request.getParameter("hackathonId"));
        
        HackathonEvent hackathon = hackFl.find(hackathonId);
        
        session.setAttribute("hackathon", hackathon);
        
        RequestDispatcher disp = request.getRequestDispatcher("update_hackathon.jsp");
        disp.forward(request, response);
    }

}
