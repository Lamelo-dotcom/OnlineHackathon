package ac.za.tut.servlets;

import ac.za.tut.entities.User;
import ac.za.tut.sb.HackathonEventFacadeLocal;
import ac.za.tut.sb.UserFacadeLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    @EJB
    private UserFacadeLocal userFl;
    @EJB
    private HackathonEventFacadeLocal hackFl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String loginErr;

        User user = userFl.findUserByEmail(username);

        if ((username.equals("root")) && (password.equals("root"))) {
            response.sendRedirect("AdminDataServlet.do");
        } else {
            if (user != null && user.getPassword().equals(password)) {
                session.setAttribute("User", user);
                System.out.println("User name : " + user.getEmail() + " User ID : " + user.getId());
                if ("Participant".equals(user.getRole())) {
                    response.sendRedirect("ParticipantDataServlet.do");
                } else if ("Mentor".equals(user.getRole())) {
                    response.sendRedirect("MentorDataServlet.do");
                } else if ("Sponsor".equals(user.getRole())) {
                    response.sendRedirect("SponsorDataServlet.do");
                }
            } else {
                loginErr = "Incorrect Email or Password. Please try again and ensure Caps Lock is not enabled.";
                session.setAttribute("loginErr", loginErr);
                response.sendRedirect("login.jsp");
            }
        }
    }
}