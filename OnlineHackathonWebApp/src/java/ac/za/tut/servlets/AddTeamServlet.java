package ac.za.tut.servlets;

import ac.za.tut.entities.HackathonEvent;
import ac.za.tut.entities.Team;
import ac.za.tut.sb.TeamFacadeLocal;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddTeamServlet extends HttpServlet {

    @EJB
    private TeamFacadeLocal teamFl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        HackathonEvent hackathon = (HackathonEvent)session.getAttribute("hackathon");
        
        String teamName = request.getParameter("teamName");
        String description = request.getParameter("description");
        
        List<Team> teams = new ArrayList<>();
        
        Team team = createTeam(hackathon,teamName,description);
        
        teamFl.create(team);
        teams.add(team);
        
        session.setAttribute("teams", teams);
        
        response.sendRedirect("add_teams.html");
        
        /*RequestDispatcher disp = request.getRequestDispatcher("add_teams.html");
        disp.forward(request, response);*/
    }

    private Team createTeam(HackathonEvent hackathon, String teamName, String description) {
       
        Team team = new Team();
        
        team.setName(teamName);
        team.setDescription(description);
        team.setHackathon(hackathon);
        
        return team;
    }


}
