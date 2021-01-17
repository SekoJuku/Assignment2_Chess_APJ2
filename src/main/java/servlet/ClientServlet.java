package servlet;

import client.Client;
import client.ServerThread;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Scanner;

@WebServlet(name = "ClientServlet", urlPatterns = "/request")
public class ClientServlet extends HttpServlet {
    private static Client client;
    private static final String host = "2.132.23.116";
    private static final int portNumber = 8189;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getParameter("sendmsg") != null)
        {
            String m = request.getParameter("sendmsg");
            client.sendMsg(m);
//            System.out.println(m);
        }
        if(request.getParameter("username") != null)
        {
            String username = request.getParameter("username");

            client = new Client(username, host, portNumber);
            client.startClient();

            request.getRequestDispatcher("jsp/main-page.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setAttribute("chat", ServerThread.getMsgs());

        String json = new Gson().toJson(ServerThread.getMsgs());

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);

    }
}