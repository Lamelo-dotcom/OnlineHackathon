package ac.za.tut.servlets;

import ac.za.tut.entities.User;
import ac.za.tut.sb.HackathonEventFacadeLocal;
import ac.za.tut.sb.UserFacadeLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class JoinHackathonServlet extends HttpServlet {

    @EJB
    private HackathonEventFacadeLocal hackFl;

    @EJB
    private UserFacadeLocal userFl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        Long hackathonId = Long.valueOf(request.getParameter("hackathonId"));
        User user = (User) session.getAttribute("User");

        if (user != null && user.getId() != null) {
            // Reattach the user to the persistence context
            user = userFl.find(user.getId());
            if (user != null) {
                hackFl.joinHackathon(hackathonId, user.getId());
                session.setAttribute("message", "Successfully joined the hackathon!");
            } else {
                session.setAttribute("message", "User not found. Please log in again.");
            }
        } else {
            session.setAttribute("message", "User not found in session. Please log in.");
        }

        RequestDispatcher disp = request.getRequestDispatcher("confirm_hackathon.jsp");
        disp.forward(request, response);

    }

}
