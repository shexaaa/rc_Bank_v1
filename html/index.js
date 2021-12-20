$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
        if (item.type === "update") {
            $("#moneyAmount").html("$" + item.money)
            $("#welcomeName").html("Welcome " + item.playerName)
        }
    })






   

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://rc_Bank/exit', JSON.stringify({})); // Wenn man ESC triggert er Callback exit in der Main.lua Client
            return
        }
    };
    

    $("#close").click(function () {
        $.post('http://rc_Bank/exit', JSON.stringify({})); 
        return
    })
    
})