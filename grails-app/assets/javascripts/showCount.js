

function updateCount() {
    $(document).ready(function () {
        $('button').click(function () {
            var URL = "${createLink(controller:'post',action:'ajaxCount')}";
            var something = $("#counter").text;
            $.ajax({
                url: URL,
                data: "data",
                success: function (resp) {
                    //alert("there is some result here: "+resp);
                    console.log(resp);
                    $("#counter").text(resp);
                    console.log("sdkjskksss " + something);
                    console.log("sdkjskksss " + $("#counter").text);

                }
            });
        });
    });
}
