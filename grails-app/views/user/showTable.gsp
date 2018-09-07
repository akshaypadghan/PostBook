<%--
  Created by IntelliJ IDEA.
  User: akshay
  Date: 5/9/18
  Time: 4:42 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>User Table</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.flash.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
    <style>
    #example{
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    #example td, #example th {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }

    #example tr:nth-child(even){background-color: #f2f2f2;}

    #example tr:hover {background-color: #ddd;}

    #example th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: center;
        background-color: #4CAF50;
        color: white;
    }
    </style>
</head>

<body>
        this is page to show user Table
        <button id="reload">reload</button>
        <table id="example">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>name</th>
                    <th>username</th>
                    <th>email</th>
                    <th>Gender</th>
                    <th>DOB</th>
                    <th>Address</th>

                </tr>
            </thead>
        </table>
    <script>
            $(document).ready(function () {
                // $('#reload').click(function () {
                    var URL = "${createLink(controller: 'user', action: 'ajaxShowTable')}";
                    var response;
                    $.ajax({
                        url: URL,
                        success: function (resp) {
                            console.log(resp);
                            //response = resp;

                            $("#example").DataTable({
                                //"data": response,
                                "data" : resp,
                                //"iDisplayLength": 5,
                                "columns": [
                                    {
                                        "data":"id"
                                    },
                                    {
                                        "data": "name"
                                    },
                                    {
                                        "data": "username"
                                    },
                                    {
                                        "data": "email"
                                    },
                                    {
                                        "data": "gender"
                                    },
                                    {
                                        "data":"dob"
                                    },
                                    {
                                        "data":"address"
                                    }

                                ]

                            });

                        }
                    });

                //});
            });
    </script>
</body>
</html>