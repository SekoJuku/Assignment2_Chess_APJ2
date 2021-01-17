package server;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class ClientThread implements Runnable {
    private Socket socket;
    private PrintWriter clientOut;
    private ChatServer server;

    public ClientThread(ChatServer server, Socket socket){
        this.server = server;
        this.socket = socket;
    }

    private PrintWriter getWriter(){
        return clientOut;
    }

    @Override
    public void run() {
        try{
            this.clientOut = new PrintWriter(socket.getOutputStream(), false);
            Scanner in = new Scanner(socket.getInputStream());

            while(!socket.isClosed()){
                if(in.hasNextLine()){
                    String input = in.nextLine();
                    // System.out.println(input);
                    for(ClientThread thatClient : server.getClients()){
                        PrintWriter thatClientOut = thatClient.getWriter();
                        if(thatClientOut != null){
                            thatClientOut.write(input + "\r\n");
                            thatClientOut.flush();
                        }
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();

        }
    }
}