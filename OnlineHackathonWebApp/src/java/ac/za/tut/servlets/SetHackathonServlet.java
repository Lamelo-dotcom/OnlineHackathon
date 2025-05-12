package ac.za.tut.servlets;

import ac.za.tut.entities.HackathonEvent;
import ac.za.tut.sb.HackathonEventFacadeLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SetHackathonServlet extends HttpServlet {
    
    @EJB
    private HackathonEventFacadeLocal hackFl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        HttpSession session = request.getSession();
        
        String hackathonName = request.getParameter("hackathonName");
        String description = request.getParameter("description");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String regClosingDate = request.getParameter("regClosingDate");
        String location = request.getParameter("location");
        
        String status = "Upcoming";
        
        HackathonEvent event = createEvent(hackathonName,description,regClosingDate,startDate,endDate,location,status);
        
        hackFl.create(event);
        
        session.setAttribute("hackathon",event);
        
        RequestDispatcher disp = request.getRequestDispatcher("add_judging_criteria.html");
        disp.forward(request, response);
    }

    private HackathonEvent createEvent(String hackathonName, String description,String regClosingDate ,String startDate, String endDate, String location, String status ) {
       
        HackathonEvent event = new HackathonEvent();
        
        event.setDescription(description);
        event.setEndDate(endDate);
        event.setName(hackathonName);
        event.setLocation(location);
        event.setStartDate(startDate);
        event.setStatus(status);
        event.setRegistrationDeadline(regClosingDate);
        
        return event;
    }

}
