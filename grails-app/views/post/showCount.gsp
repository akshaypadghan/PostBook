<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Post Count Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <style media="screen">
      #counter{
        font-size: 180px;
        text-align: center;
        margin-top: 10%;
      }

      #disclaimer{
        padding-top: 50px;
        margin-left: 50px;
        color: red;
      }

      #infoText{
        font-size: 70px;
        text-align: center;
        padding-top: 100px;

      }
      .btn{
              border-radius: 50%;
              width: 170px;
              height: 170px;
              font-size: 40px;
              color: blue;
              margin-left: 470px;
            }
    </style>
  </head>
  <body>
    <div class="container">
      <p id="infoText">Posts done in Last Two Hours are...</p>
        <div class="counterArea">
          <p id="counter">${postCount}</p> <button type="button" name="button" id="refreshButton" class="btn btn-success" onclick="updateCount()">Refresh</button>
        </div>
        <footer id="disclaimer">**This will be updated after every two hours</footer>
    </div>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
  <script type="text/javascript">
        function updateCount(){
            document.findById("counter").innerHTML = "${latestCount}"
        }
  </script>
  </body>
</html>
