package ac.za.tut.servlets;

import ac.za.tut.entities.HackathonEvent;
import ac.za.tut.entities.User;
import ac.za.tut.sb.HackathonEventFacadeLocal;
import ac.za.tut.sb.UserFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ManageUsersServlet extends HttpServlet {

  @EJB
    private UserFacadeLocal userFl;
    @EJB
    private HackathonEventFacadeLocal hackFl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        int numOfPerticipants = userFl.countByRole("Participant");
        int numOfMentors = userFl.countByRole("numOfMentors");
        int numOfSponsors = userFl.countByRole("numOfSponsors");
        int numOfUsers = userFl.count();
        
        List<User> users = userFl.findAll();
        List<User> participants = userFl.findAllByRole("Participant");
        List<User> mentors = userFl.findAllByRole("Mentor");
        List<User> sponsors = userFl.findAllByRole("Sponsor");
        

        session.setAttribute("numOfPerticipants", numOfPerticipants);
        session.setAttribute("numOfMentors", numOfMentors);
        session.setAttribute("numOfSponsors", numOfSponsors);
        session.setAttribute("numOfUsers", numOfUsers);
        session.setAttribute("participants", participants);
        session.setAttribute("mentors", mentors);
        session.setAttribute("sponsors", sponsors);
        session.setAttribute("users", users);

        RequestDispatcher disp = request.getRequestDispatcher("user_management.jsp");
        disp.forward(request, response);
    }
}

