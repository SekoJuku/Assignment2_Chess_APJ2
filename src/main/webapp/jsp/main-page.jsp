<%@ page import="java.net.Socket" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.util.Scanner" %>
<%@ page import="client.Client" %>
<%@ page import="java.util.List" %>
<%@ page import="client.ServerThread" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
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
                    <td id="a8" class="element light">&#9820;</td>
                    <td id="b8" class="element dark" >&#9822;</td>
                    <td id="c8" class="element light" >&#9821;</td>
                    <td id="d8" class="element dark" >&#9819;</td>
                    <td id="e8" class="element light">&#9818;</td>
                    <td id="f8" class="element dark" >&#9821;</td>
                    <td id="g8" class="element light">&#9822;</td>
                    <td id="h8" class="element dark" >&#9820;</td>
                </tr>
                <tr>
                    <th>7</th>
                    <td id="a7" class="element dark" > &#9823;</td>
                    <td id="b7" class="element light">&#9823;</td>
                    <td id="c7" class="element dark" > &#9823;</td>
                    <td id="d7" class="element light">&#9823;</td>
                    <td id="e7" class="element dark" > &#9823;</td>
                    <td id="f7" class="element light">&#9823;</td>
                    <td id="g7" class="element dark" > &#9823;</td>
                    <td id="h7" class="element light">&#9823;</td>
                </tr>
                <tr>
                    <th>6</th>
                    <td id="a6" class="element light"></td>
                    <td id="b6" class="element dark" ></td>
                    <td id="c6" class="element light"></td>
                    <td id="d6" class="element dark" ></td>
                    <td id="e6" class="element light"></td>
                    <td id="f6" class="element dark" ></td>
                    <td id="g6" class="element light"></td>
                    <td id="h6" class="element dark" ></td>
                </tr>
                <tr>
                    <th>5</th>
                    <td id="a5" class="element dark" ></td>
                    <td id="b5" class="element light"></td>
                    <td id="c5" class="element dark" ></td>
                    <td id="d5" class="element light"></td>
                    <td id="e5" class="element dark" ></td>
                    <td id="f5" class="element light"></td>
                    <td id="g5" class="element dark" ></td>
                    <td id="h5" class="element light"></td>
                </tr>
                <tr>
                    <th>4</th>
                    <td id="a4" class="element light"></td>
                    <td id="b4" class="element dark" ></td>
                    <td id="c4" class="element light"></td>
                    <td id="d4" class="element dark" ></td>
                    <td id="e4" class="element light"></td>
                    <td id="f4" class="element dark" ></td>
                    <td id="g4" class="element light"></td>
                    <td id="h4" class="element dark" ></td>
                </tr>
                <tr>
                    <th>3</th>
                    <td id="a3" class="element dark" ></td>
                    <td id="b3" class="element light"></td>
                    <td id="c3" class="element dark" ></td>
                    <td id="d3" class="element light"></td>
                    <td id="e3" class="element dark" ></td>
                    <td id="f3" class="element light"></td>
                    <td id="g3" class="element dark" ></td>
                    <td id="h3" class="element light"></td>
                </tr>
                <tr>
                    <th>2</th>
                    <td id="a2" class="element light">&#9817;</td>
                    <td id="b2" class="element dark" > &#9817;</td>
                    <td id="c2" class="element light">&#9817;</td>
                    <td id="d2" class="element dark" > &#9817;</td>
                    <td id="e2" class="element light">&#9817;</td>
                    <td id="f2" class="element dark" > &#9817;</td>
                    <td id="g2" class="element light">&#9817;</td>
                    <td id="h2" class="element dark" > &#9817;</td>
                </tr>
                <tr>
                    <th>1</th>
                    <td id="a1" class="element dark" > &#9814;</td>
                    <td id="b1" class="element light">&#9816;</td>
                    <td id="c1" class="element dark" > &#9815;</td>
                    <td id="d1" class="element light">&#9813;</td>
                    <td id="e1" class="element dark" > &#9812;</td>
                    <td id="f1" class="element light">&#9815;</td>
                    <td id="g1" class="element dark" > &#9816;</td>
                    <td id="h1" class="element light">&#9814;</td>
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

                            <%--                            <li class="right clearfix"><span class="chat-img pull-right">--%>
                            <%--                                                <img src="http://placehold.it/50/FA6F57/fff&text=BP" alt="User Avatar" class="img-circle" />--%>
                            <%--                                            </span>--%>
                            <%--                                <div class="chat-body clearfix">--%>
                            <%--                                    <div class="header">--%>
                            <%--                                        <strong class="primary-font">Username</strong>--%>
                            <%--                                    </div>--%>
                            <%--                                    <p>--%>

                            <%--                                    </p>--%>
                            <%--                                </div>--%>
                            <%--                            </li>--%>


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

        var index = 0;

        setInterval(function (){

            $.ajax({
                url: "http://localhost:8080/assignment2JAVA2_war_exploded/request",
                type: 'GET',
                success: function (data) {
                    // $(".ccc").html("");



                    if(index == data.length)
                    {

                    }
                    else {
                        for ( ; index < data.length; index++) {
                            $(".chat").append("<li class=\"right clearfix\"><span class=\"chat-img pull-right\">\n" +
                                "                                                <img src=\"http://placehold.it/50/FA6F57/fff&text=BP\" alt=\"User Avatar\" class=\"img-circle\" />\n" +
                                "                                            </span>\n" +
                                "                                <div class=\"chat-body clearfix\">\n" +
                                "                                    <div class=\"header\">\n" +
                                "                                        <strong class=\"primary-font\"></strong>\n" +
                                "                                    </div>\n" +
                                "                                    <p>\n" + data[index] +
                                "\n" +
                                "                                    </p>\n" +
                                "                                </div>\n" +
                                "                            </li>")
                        }
                    }
                }
            });
            $(".panel-body").scrollIntoView();
        }, 2000);

        $("#btn-chat").on("click", function (){
            var m = "sendmsg=" + $(".msgg").val();

            event.preventDefault();
            $.ajax({
                url: "http://localhost:8080/assignment2JAVA2_war_exploded/request",
                type: 'POST',
                data: m,
                success: function (data) {
                    $(".msgg").val("");
                }
            });

            $(".msgg").val("");
        });

        $(".element").on("click", function(){

            var i = $(this).attr("id");
            var e = $(this).html();

            if(e != "")
            {
                if(current != "")
                {

                    document.getElementById(i).textContent = current;
                    current = "";
                }
                else
                {
                    current = e;
                    document.getElementById(i).textContent = "";
                }
            }
            else
            {
                document.getElementById(i).textContent = current;
                current = "";
            }

        });

        var current = "";

    });
</script>
</body>
</html>