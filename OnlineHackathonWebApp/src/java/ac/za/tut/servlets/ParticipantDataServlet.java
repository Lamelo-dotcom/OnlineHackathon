package ac.za.tut.servlets;

import ac.za.tut.entities.HackathonEvent;
import ac.za.tut.entities.User;
import ac.za.tut.sb.HackathonEventFacadeLocal;
import ac.za.tut.sb.UserFacadeLocal;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ParticipantDataServlet extends HttpServlet {

    @EJB
    private UserFacadeLocal userFl;

    @EJB
    private HackathonEventFacadeLocal hackFl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Validate and retrieve the User from session
        User user = (User) session.getAttribute("User");
        if (user == null || user.getId() == null) {
            // Redirect to login if user is not authenticated
            response.sendRedirect("login.jsp");
            return;
        }

        // Refresh the user to ensure up-to-date hackathons
        user = userFl.find(user.getId());
        if (user == null) {
            session.setAttribute("error", "User not found. Please log in again.");
            response.sendRedirect("login.jsp");
            return;
        }
        session.setAttribute("User", user);

        // Load hackathons and ensure the list is not null
        List<HackathonEvent> hackathons = hackFl.findAll();
        if (hackathons == null) {
            hackathons = new ArrayList<>();
        }

        // Set statistics
        int numOfHackathons = hackFl.count();
        int numOfPerticipant = userFl.count();
        int numOfSubmission = user.getHackathons() != null ? user.getHackathons().size() : 0; // Example logic
        int numOfJudging = 0; // Placeholder, implement logic for judging count

        session.setAttribute("numOfHackathons", numOfHackathons);
        session.setAttribute("numOfPerticipant", numOfPerticipant);
        session.setAttribute("numOfSubmission", numOfSubmission);
        session.setAttribute("numOfJudging", numOfJudging);
        session.setAttribute("hackathons", hackathons);

        RequestDispatcher disp = request.getRequestDispatcher("participant_dashboard.jsp");
        disp.forward(request, response);
    }
}