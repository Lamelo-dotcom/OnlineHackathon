package ac.za.tut.servlets;

import ac.za.tut.entities.User;
import ac.za.tut.sb.UserFacadeLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ViewProfileServlet extends HttpServlet {

    @EJB
    private UserFacadeLocal userFl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        User user = (User)session.getAttribute("User");
        
        String strUserId = request.getParameter("uesrId");
        
        if (strUserId != null) {
            Long userId = Long.valueOf(strUserId);
            
            user = userFl.find(userId);
            
        }
        
        session.setAttribute("User", user);
       
        
        RequestDispatcher disp = request.getRequestDispatcher("profile.jsp");
        disp.forward(request, response);
        
    }
}
