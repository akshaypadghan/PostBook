

function updateCount() {
    $(document).ready(function () {
        $('button').click(function () {
            var URL = "${createLink(controller:'post',action:'ajaxCount')}";
            $.ajax({
                url: URL,
                data: "data",
                success: function (resp) {
                    $("#counter").text(resp);
                }
            });
        });
    });
}
