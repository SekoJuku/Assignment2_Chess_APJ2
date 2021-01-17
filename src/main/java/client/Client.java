package client;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.net.InetSocketAddress;
//import java.net.Socket;
//import java.util.Scanner;
//
//public class Client {
//    public static void main(String[] args) {
//        try {
//            while(true)
//            {
//                Socket socket = new Socket();
//                String chat = "2.132.21.81";
//                socket.connect(new InetSocketAddress(chat,8189));
//                Scanner scanner = new Scanner(socket.getInputStream());
//                PrintWriter writer = new PrintWriter(socket.getOutputStream());
//                Scanner sc = new Scanner(System.in);
//
//    //            while(true) {
//                    String str = sc.next();
//                    writer.write(str);
//                    writer.flush();
//                    if(str.equals("break")) {
//                        break;
//                    }
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
//}

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.LinkedList;
import java.util.Scanner;

public class Client {

//    private static final String host = "2.132.21.81";
//    private static final String host = "192.168.1.241";
//    private static final int portNumber = 8189;

    private String userName;
    private String serverHost;
    private int serverPort;
    private String msg;
    private boolean hasMessages = false;

    private ServerThread serverThread;

//    public static void main(String[] args){
//        String readName = null;
//        Scanner scan = new Scanner(System.in);
//        System.out.println("Please input username:");
//        while(readName == null || readName.trim().equals("")){
//            readName = scan.nextLine();
//            if(readName.trim().equals("")){
//                System.out.println("Invalid. Please enter again:");
//            }
//        }
//
//        Client client = new Client(readName, host, portNumber);
//        client.startClient(scan);
//    }

    public Client(String userName, String host, int portNumber){
        this.userName = userName;
        this.serverHost = host;
        this.serverPort = portNumber;
    }

    public void sendMsg(String m)
    {
        serverThread.addNextMessage(m);
    }

    public void startClient(){
        try{
            Socket socket = new Socket(serverHost, serverPort);
            Thread.sleep(1000); // waiting for network communicating.
            PrintWriter serverOut = new PrintWriter(socket.getOutputStream(), false);
            InputStream serverInStream = socket.getInputStream();
            Scanner serverIn = new Scanner(serverInStream);
            // BufferedReader userBr = new BufferedReader(new InputStreamReader(userInStream));
            // Scanner userIn = new Scanner(userInStream);

            serverThread = new ServerThread(socket, userName);
            Thread serverAccessThread = new Thread(serverThread);
            serverAccessThread.start();

//            SendThread sendThread = new SendThread(socket, userName);
//            while(serverAccessThread.isAlive()){
//                if(hasMessages){
//                    serverThread.addNextMessage(msg);
//                    hasMessages = false;
//                }
//            }

        }catch(IOException ex){
            System.err.println("Fatal Connection error!");
            ex.printStackTrace();
        }catch(InterruptedException ex){
            System.out.println("Interrupted");
        }
    }
}