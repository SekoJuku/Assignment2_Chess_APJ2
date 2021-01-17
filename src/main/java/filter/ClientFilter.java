package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "ClientFilter")
public class ClientFilter implements Filter {


    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        if(req.getParameter("username") != null)
        {
            String user = req.getParameter("username");
            if(user.length() < 4)
            {
                req.setAttribute("msg", "Username size is too small");
                ((HttpServletRequest) req).getRequestDispatcher("index.jsp").forward(req, resp);
            }
        }

        chain.doFilter(req, resp);
    }


}
