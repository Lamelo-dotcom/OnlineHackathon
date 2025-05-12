package ac.za.tut.servlets;

import ac.za.tut.entities.HackathonEvent;
import ac.za.tut.sb.HackathonEventFacadeLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateHackathonServlet extends HttpServlet {

      @EJB
    private HackathonEventFacadeLocal hackFl;
      
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
            Long id = Long.valueOf(request.getParameter("hackathonId"));
            String name = request.getParameter("hackathonName");
            String description = request.getParameter("description");
            String regClosingDate = request.getParameter("regClosingDate");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            String location = request.getParameter("location");
        
            HackathonEvent hackathon  = hackFl.find(id);
            
               if (hackathon != null) {
                hackathon.setName(name);
                hackathon.setDescription(description);
                hackathon.setRegistrationDeadline(regClosingDate);
                hackathon.setStartDate(startDate);
                hackathon.setEndDate(endDate);
                hackathon.setLocation(location);

                hackFl.edit(hackathon);
            }
               
               response.sendRedirect("AdminDataServlet.do");
        
    }

}
