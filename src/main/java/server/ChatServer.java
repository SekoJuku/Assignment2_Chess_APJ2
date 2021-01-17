package server;

//public class ChatServer {

//    public static void main(String[] args) {
//        try {
//            ServerSocket serverSocket = new ServerSocket(8081);
//            Socket socket = serverSocket.accept();
//            Scanner scanner = new Scanner(socket.getInputStream());
//            PrintWriter printWriter = new PrintWriter(socket.getOutputStream());
//            printWriter.write("hello");
//            printWriter.flush();
//
//
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        Socket socket = new Socket();
//        Client c = new Client(socket);

//    }
//}

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

public class ChatServer {

    private static final int portNumber = 8189;

    private int serverPort;
    private List<ClientThread> clients;

    public static void main(String[] args){
        ChatServer server = new ChatServer(portNumber);
        server.startServer();
    }

    public ChatServer(int portNumber){
        this.serverPort = portNumber;
    }

    public List<ClientThread> getClients(){
        return clients;
    }

    private void startServer(){
        clients = new ArrayList<ClientThread>();
        ServerSocket serverSocket = null;
        try {
            serverSocket = new ServerSocket(serverPort);
            acceptClients(serverSocket);
        } catch (IOException e){
            System.err.println("Could not listen on port: " + serverPort);
            System.exit(1);
        }
    }

    private void acceptClients(ServerSocket serverSocket){

        System.out.println("server starts port = " + serverSocket.getLocalSocketAddress());
        while(true){
            try{
                Socket socket = serverSocket.accept();
                System.out.println("accepts : " + socket.getRemoteSocketAddress());
                ClientThread client = new ClientThread(this, socket);
                Thread thread = new Thread(client);
                thread.start();
                clients.add(client);
            } catch (IOException ex){
                System.out.println("Accept failed on : "+serverPort);
            }
        }
    }
}