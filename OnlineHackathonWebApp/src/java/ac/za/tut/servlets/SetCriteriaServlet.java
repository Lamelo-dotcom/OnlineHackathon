package ac.za.tut.servlets;

import ac.za.tut.entities.Criteria;
import ac.za.tut.entities.HackathonEvent;
import ac.za.tut.sb.CriteriaFacadeLocal;
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

public class SetCriteriaServlet extends HttpServlet {
   
    @EJB
    private CriteriaFacadeLocal critFl;
    
    @Override 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        HackathonEvent hackathon = (HackathonEvent)session.getAttribute("hackathon");
        
        String name = request.getParameter("criteriaName");
        String desc = request.getParameter("criteriaDescription");
        int weight = Integer.parseInt(request.getParameter("criteriaWeight"));
        
        List<Criteria> criterias = new ArrayList<>();
        
        Criteria criteria = createCriteria(hackathon,name,desc,weight);
        
        critFl.create(criteria);
        
        criterias.add(criteria);
        
        session.setAttribute("criterias", criterias);
        
        response.sendRedirect("add_judging_criteria.html");
        
        /*RequestDispatcher disp = request.getRequestDispatcher("add_judging_criteria.html");
        disp.forward(request, response);*/
    }

    private Criteria createCriteria(HackathonEvent hackathon, String name, String desc, int weight) {
        Criteria criteria = new Criteria();
        
        criteria.setDescription(desc);
        criteria.setName(name);
        criteria.setWeight(weight);
        criteria.setHackathon(hackathon);
        
        return  criteria;
        
    }


}
