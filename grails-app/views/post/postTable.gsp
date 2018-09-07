<%--
  Created by IntelliJ IDEA.
  User: akshay
  Date: 6/9/18
  Time: 5:50 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Post Table</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
    <link rel="stylesheet"  href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet"  href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css">
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
    #postData{
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    #postData td, #postData th {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }

    #postData tr:nth-child(even){background-color: #f2f2f2;}

    #postData tr:hover {background-color: #ddd;}

    #postData th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: center;
        background-color: #4CAF50;
        color: white;
    }
    </style>

</head>

<body>
        <table id="postData">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Description</th>
                    <th>Post Date</th>
                    <th>User</th>
                </tr>
            </thead>
        </table>
        <script type="text/javascript">
                $(document).ready(function () {
                        var URL = "${createLink(controller: 'post',action:'ajaxShowTable')}"
                        $.ajax({
                                url : URL,
                                success: function (response) {
                                        $("#postData").DataTable({
                                            "data":response,
                                            "columns":[
                                                {"data":"id"},
                                                {"data":"description"},
                                                {"data":"postCreatedOn"},
                                                {
                                                    "data":"user.id"

                                                }
                                            ]
                                        });
                                    console.log(response);
                                }
                        })
                });
        </script>
</body>
</html>