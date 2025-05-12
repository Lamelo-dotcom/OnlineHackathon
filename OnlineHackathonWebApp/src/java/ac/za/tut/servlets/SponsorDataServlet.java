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

public class SponsorDataServlet extends HttpServlet {

    @EJB
    private UserFacadeLocal userFl;

    @EJB
    private HackathonEventFacadeLocal hackFl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("User");
        if (user == null || !"Sponsor".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        user = userFl.find(user.getId());
        session.setAttribute("User", user);

        List<HackathonEvent> hackathons = hackFl.findAll();
        session.setAttribute("hackathons", hackathons);

        RequestDispatcher disp = request.getRequestDispatcher("sponsor_dashboard.jsp");
        disp.forward(request, response);
    }
}