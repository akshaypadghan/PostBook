<!DOCTYPE html>
<html lang="en">
<head>
  <title>Create Group</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Create Group Here...</h2>
  <form>
    <div class="form-group">
      <label for="title">Group Name</label>
      <input type="text" class="form-control" id="title" placeholder="Enter Group Name Here.." name="title">
    </div>
    <div class="form-group">
      <label for="description">Group Description</label>
      <input type="text" class="form-control" id="description" placeholder="Enter Group Description Here..." name="description">
    </div>
    <div class="form-group">
          <label for="groupMembers">Add Members to Group</label></br>
          <select multiple>
                <g:each in="${userList}" var="user" status="i">
                <option>${user.name}</option>
                </g:each>
          </select>
        </div>
     <g:actionSubmit value="add" action="updateGroup"/>
  </form>
</div>

</body>
</html>
