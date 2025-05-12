package ac.za.tut.servlets;

import ac.za.tut.entities.HackathonEvent;
import ac.za.tut.entities.User;
import ac.za.tut.sb.UserFacadeLocal;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WithdrawHackathonServlet extends HttpServlet {

    @EJB
    private UserFacadeLocal userFl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
     
         Long hackathonId = Long.valueOf(request.getParameter("hackathonId"));
         User user = (User) session.getAttribute("User");
        
         if (user != null && user.getHackathons() != null) {
                List<HackathonEvent> userHackathons = user.getHackathons();
                HackathonEvent hackathonToRemove = null;

                // Find the hackathon to remove
                for (HackathonEvent he : userHackathons) {
                    if (he.getId().equals(hackathonId)) {
                        hackathonToRemove = he;
                        break;
                    }
                }

                // Remove the hackathon if found
                if (hackathonToRemove != null) {
                    userHackathons.remove(hackathonToRemove);
                    userFl.edit(user);
                }
            }
              
         response.sendRedirect("ParticipantDataServlet.do");
         
    }

}
