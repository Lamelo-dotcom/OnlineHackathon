package ac.za.tut.servlets;

import ac.za.tut.entities.HackathonEvent;
import ac.za.tut.sb.CriteriaFacadeLocal;
import ac.za.tut.sb.HackathonEventFacadeLocal;
import ac.za.tut.sb.TeamFacadeLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteHackathon extends HttpServlet {
    
    @EJB
    private HackathonEventFacadeLocal hackFl;
    @EJB 
    private TeamFacadeLocal teamFl;
    @EJB
    private CriteriaFacadeLocal criteriaFl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Long hackathonId = Long.valueOf(request.getParameter("hackathonId"));
        
        HackathonEvent hackathon = hackFl.find(hackathonId);
        teamFl.removeHackthonTeams(hackathonId);
        criteriaFl.removeHackathonCriteria(hackathonId);
        
        hackFl.remove(hackathon);
        response.sendRedirect("AdminDataServlet.do");
    
    }
}