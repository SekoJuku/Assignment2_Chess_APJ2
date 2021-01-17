package servlet;

import client.Client;
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

@WebServlet(name = "ClientServlet", urlPatterns = "/request")
public class ClientServlet extends HttpServlet {
    private static final String host = "2.132.21.81";
    private static final int portNumber = 8189;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HashMap<String, String> list = new HashMap<>();
        list.put("message", "empty");
        String msg = request.getParameter("msg");

        Socket socket = new Socket(host, portNumber);

        PrintWriter serverOut = new PrintWriter(socket.getOutputStream(), false);
        serverOut.println("Player1" + " > " + msg);
        serverOut.flush();

        String json = new Gson().toJson(list);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
