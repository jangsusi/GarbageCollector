package map;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import common.RequestMapping;


@RequestMapping("/map_info.do")
public class CtrlList implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession();
        System.out.println(session.getAttribute("auth"));
        System.out.println(session.getAttribute("helperId"));


	    String l = null;

//        String search_place= request.getParameter("search_place");

        MapDAO dao = new MapDAO_OracleImpl();
        List<MapVO> rl = dao.findAll();
        
        request.setAttribute("rl", rl);
        
        
		return "/map/map_info.jsp";
	}

}
