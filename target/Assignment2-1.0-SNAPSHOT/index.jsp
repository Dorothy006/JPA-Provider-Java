<%-- 
    Document   : index
    Created on : 19-Apr-2019, 12:45:33 PM
    Author     : mshao
--%>

<%@page import="Entity.Employee"%>
<%@page import="Entity.Student"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" 
              crossorigin="anonymous"/>
        <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>

        <script>

            $(document).ready(function (e) {


            });
        </script>
    </head>
    <body>

        <div class="container body-content" style="margin-top: 3%"> 
            <div>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal_add">
                    Add</button>
                <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modal_update">
                    Update</button>
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal_search">
                    Search</button>
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal_delete">
                    Delete</button>
            </div> 
            <div id="searchResult">
                <!-- search result -->
            </div>
        </div>
        <!-- Modal Add -->
        <div class="modal" id="modal_add">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Add A New Person</h4>
                        <button type="button" class="close" data-dismiss="modal">&times</button>
                    </div>
                    <!-- Modal body -->
                    <form method="post" action="add">
                        <div class="modal-body">
                            <div class="form-group">
                                <select class="form-control" name="type">
                                    <option>Select Person Type</option>
                                    <option value="student">Student</option>
                                    <option value="employee">Employee</option>
                                </select><br>
                                <input  type="text" class="form-control" name="name" placeholder="Name"><br>
                                <input  type="text" class="form-control" name="address" placeholder="Address"><br>
                                <input  type="text" class="form-control" name="email" placeholder="Email"><br>
                                <input  type="text" class="form-control" name="phone" placeholder="Phone"><br>
                            </div>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" id="btn_add" class="btn btn-primary">Add</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Modal Update -->
        <div class="modal" id="modal_update">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Update a Person</h4>
                        <button type="button" class="close" data-dismiss="modal">&times</button>
                    </div>
                    <!-- Modal body -->
                    <form  method="post" action="update">
                        <div class="modal-body">
                            <div class="form-group">   
                                <label class="form-group">Enter person's ID to update</label>  
                                <input  type="text" class="form-control" name="id" placeholder="ID"><br>
                                <select class="form-control" name="type">
                                    <option>Select Person Type</option>
                                    <option value="student">Student</option>
                                    <option value="employee">Employee</option>
                                </select><br>
                                <input  type="text" class="form-control" name="name" placeholder="Name"><br>
                                <input  type="text" class="form-control" name="address" placeholder="Address"><br>
                                <input  type="text" class="form-control" name="email" placeholder="Email"><br>
                                <input  type="text" class="form-control" name="phone" placeholder="Phone"><br>
                            </div>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" id="btn_update" class="btn btn-primary">Update</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--Model search-->
        <div class="modal" id="modal_search">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Search a person</h4>
                        <button type="button" class="close" data-dismiss="modal">&times</button>
                    </div>
                    <!-- Modal body -->
                    <form  method="post" action="search">
                        <div class="modal-body">
                            <div class="form-group">   
                                <label class="form-group">Enter person's ID to search</label>
                                <input  type="text" class="form-control" name="id" placeholder="ID"><br>
                            </div>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" id="btn_update" class="btn btn-primary">Search</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Modal Delete -->
        <div class="modal" id="modal_delete">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Delete a Customer</h4>
                        <button type="button" class="close" data-dismiss="modal">&times</button>
                    </div>
                    <!-- Modal body -->
                    <form  method="post" action="delete">
                        <div class="modal-body">
                            <div class="form-group">
                                <label class="form-group">Enter person's ID to delete</label>
                                <input  type="text" class="form-control" name="id" placeholder="ID"><br>

                            </div>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" id="btn_delete" class="btn btn-primary">Delete</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
