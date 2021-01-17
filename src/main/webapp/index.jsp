<%@ page import="java.net.Socket" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.util.Scanner" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <style>
        .chess-board { border-spacing: 0; border-collapse: collapse; }
        .chess-board th { padding: .6em; font-size: 1.5em}
        .chess-board td { border: 1px solid;  }
        .chess-board .light { background: #eee; width: 1.5em; height: 1.5em;}
        .chess-board .dark { background: #999; }
        td{
            text-align: center;
            font-size: 2.5em;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-dark bg-dark justify-content-between">
    <a class="navbar-brand">Chess <span class="glyphicon glyphicon-knight"></span></a>
    <form class="form-inline">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
</nav>
<br>
<div class="list">

    <div class="container">
        <div class="row">
            <table class="chess-board col-md-5">

                <tbody>
                <tr><th></th><th>a</th><th>b</th><th>c</th><th>d</th><th>e</th><th>f</th><th>g</th><th>h</th></tr>
                <tr>
                    <th>8</th>
                    <td class="light">&#9820;</td>
                    <td class="dark">&#9822;</td>
                    <td class="light">&#9821;</td>
                    <td class="dark">&#9819;</td>
                    <td class="light">&#9818;</td>
                    <td class="dark">&#9821;</td>
                    <td class="light">&#9822;</td>
                    <td class="dark">&#9820;</td>

                </tr>
                <tr>

                    <th>7</th>
                    <td class="dark"> &#9823;</td>
                    <td class="light">&#9823;</td>
                    <td class="dark"> &#9823;</td>
                    <td class="light">&#9823;</td>
                    <td class="dark"> &#9823;</td>
                    <td class="light">&#9823;</td>
                    <td class="dark"> &#9823;</td>
                    <td class="light">&#9823;</td>
                </tr>
                <tr>
                    <th>6</th>
                    <td class="light"></td>
                    <td class="dark"></td>
                    <td class="light"></td>
                    <td class="dark"></td>
                    <td class="light"></td>
                    <td class="dark"></td>
                    <td class="light"></td>
                    <td class="dark"></td>
                </tr>
                <tr>
                    <th>5</th>
                    <td class="dark"></td>
                    <td class="light"></td>
                    <td class="dark"></td>
                    <td class="light"></td>
                    <td class="dark"></td>
                    <td class="light"></td>
                    <td class="dark"></td>
                    <td class="light"></td>
                </tr>
                <tr>
                    <th>4</th>
                    <td class="light"></td>
                    <td class="dark"></td>
                    <td class="light"></td>
                    <td class="dark"></td>
                    <td class="light"></td>
                    <td class="dark"></td>
                    <td class="light"></td>
                    <td class="dark"></td>
                </tr>
                <tr>
                    <th>3</th>
                    <td class="dark"></td>
                    <td class="light"></td>
                    <td class="dark"></td>
                    <td class="light"></td>
                    <td class="dark"></td>
                    <td class="light"></td>
                    <td class="dark"></td>
                    <td class="light"></td>
                </tr>
                <tr>
                    <th>2</th>
                    <td class="light">&#9817;</td>
                    <td class="dark"> &#9817;</td>
                    <td class="light">&#9817;</td>
                    <td class="dark"> &#9817;</td>
                    <td class="light">&#9817;</td>
                    <td class="dark"> &#9817;</td>
                    <td class="light">&#9817;</td>
                    <td class="dark"> &#9817;</td>
                </tr>
                <tr>
                    <th>1</th>
                    <td class="dark"> &#9814;</td>
                    <td class="light">&#9816;</td>
                    <td class="dark"> &#9815;</td>
                    <td class="light">&#9813;</td>
                    <td class="dark"> &#9812;</td>
                    <td class="light">&#9815;</td>
                    <td class="dark"> &#9816;</td>
                    <td class="light">&#9814;</td>
                </tr>
                </tbody>
            </table>

            <div class="col-md-2">

            </div>

            <div class="col-md-5">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <span class="glyphicon glyphicon-comment"></span> Chat
                        <div class="btn-group ud pull-right">
                            <span class="glyphicon glyphicon-menu-up" id="arrow"></span>
                        </div>
                    </div>
                    <div class="panel-body">
                        <ul class="chat">
                            <%
                                Socket socket = new Socket("2.132.21.81", 8189);
                                Thread.sleep(1000); // waiting for network communicating.
                                PrintWriter serverOut = new PrintWriter(socket.getOutputStream(), false);
                                InputStream serverInStream = socket.getInputStream();
                                Scanner serverIn = new Scanner(serverInStream);
                                while(!socket.isClosed())
                                {
                                    if(serverInStream.available() > 0){
                                        if(serverIn.hasNextLine()){
                            %>

                                        <li class="right clearfix"><span class="chat-img pull-right">
                                                <img src="http://placehold.it/50/FA6F57/fff&text=BP" alt="User Avatar" class="img-circle" />
                                            </span>
                                            <div class="chat-body clearfix">
                                                <div class="header">
                                                    <strong class="primary-font">Username</strong>
                                                </div>
                                                <p>
                                                    <% out.println(serverIn.nextLine()); %>
                                                </p>
                                            </div>
                                        </li>
                            <%
                                        }
                                    }
                                }
                            %>

                        </ul>
                    </div>
                    <div class="panel-footer">
                        <div class="input-group">
                            <input id="btn-input" type="text" class="form-control input-sm msgg" placeholder="Type your message here..." />
                            <span class="input-group-btn">
                                    <button class="btn btn-warning btn-sm" id="btn-chat">
                                        Send</button>
                                </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {

        var view = true;
        $(".ud").on("click", function(){
            $(".panel-body, .panel-footer").slideToggle();

            if(view == true)
            {
                $("#arrow").removeClass("glyphicon-menu-up");
                $("#arrow").addClass("glyphicon-menu-down");
                view = false;
            }
            else
            {
                $("#arrow").removeClass("glyphicon-menu-down");
                $("#arrow").addClass("glyphicon-menu-up");
                view = true;
            }
        });

        $("#btn-chat").on("click", function (){

            event.preventDefault();
            $.ajax({
                url: "http://localhost:8080/assignment2JAVA2_war_exploded/request?&msg=" + $(".msgg").val(),
                type: 'GET',
                success: function (data) {

                }
            });

            $(".msgg").val("");

        });

    });
</script>
</body>
</html>