function FtpConnection() {
    $.ajax({
        url: "/Upload/TestFtpConnection",
        cache: false,
        type: "POST",
        dataType: "json",
        async: false,
        data: { ip: $("#txtIpAddress").val(),
            port: $("#txtPortNumber").val(),
            username: $("#txtUserName").val(),
            password: $("#txtPassword").val()
        },
        success: function (data) {
            if (data) {
                alert("Connected successfully");
            }
            else {
                alert("Unable to connect Please try again later");
            }
        }
    });
}

function FileUpload() {
    $.ajax({
        url: "/Upload/UploadFiles",
        cache: false,
        type: "POST",
        dataType: "json",
        async: false,
        data: { 
        },
        success: function (data) {
            if (data) {
                alert("Connected successfully");
            }
            else {
                alert("Unable to connect Please try again later");
            }
        }
    });
}