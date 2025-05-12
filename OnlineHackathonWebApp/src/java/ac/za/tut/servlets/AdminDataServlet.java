package ac.za.tut.servlets;

import ac.za.tut.entities.HackathonEvent;
import ac.za.tut.sb.HackathonEventFacadeLocal;
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

public class AdminDataServlet extends HttpServlet {

    @EJB
    private UserFacadeLocal userFl;
    @EJB
    private HackathonEventFacadeLocal hackFl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        int numOfHackathons = hackFl.count();
        int numOfPerticipant = userFl.count();
        int numOfSubmission = userFl.count();
        int numOfJudging = userFl.count();
        List<HackathonEvent> hackathons = hackFl.findAll();

        session.setAttribute("numOfHackathons", numOfHackathons);
        session.setAttribute("numOfPerticipant", numOfPerticipant);
        session.setAttribute("numOfJudging", numOfJudging);
        session.setAttribute("numOfSubmission", numOfSubmission);
        session.setAttribute("hackathons", hackathons);

        RequestDispatcher disp = request.getRequestDispatcher("admin_dashboard.jsp");
        disp.forward(request, response);
    }
}
