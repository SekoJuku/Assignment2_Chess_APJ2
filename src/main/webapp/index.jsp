<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
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
            <div class="col-md-10">

                <h1>Welcome to Chess club</h1>
                <h4 class="col-md-4">Play with other players</h4>

                <img class="col-md-6 rounded-circle " style="width: 70%"
                     src="https://svgsilh.com/svg/1389919.svg">
            </div>
            <form action="<c:url value="/request"/>" method="post">
                <div class="col-md-2">
                    <div class="form-row align-items-center">
                        <div class="">
                            <label class="sr-only" for="inlineFormInputGroup">Username</label>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div style="color: red;">${requestScope.msg}</div>
                                    <div class="input-group-text">@</div>
                                </div>
                                <input type="text" class="form-control" name="username" id="inlineFormInputGroup" required placeholder="Username">
                            </div>
                        </div>
                        <div class="col-auto">
                            <button class="btn btn-warning btn-outline-primary" style="font-size: 20px;">Play Chess</button>
                        </div>
                    </div>
                </div>
            </form>


        </div>

    </div>
</div>

</body>
</html>