/* Checks FTP connection - Sends AJAX request to controller*/
function FtpConnection(choice) {
    var ip, port, username, password;  
    if (choice == 'u') {
        ip = $("#txtIpAddress").val();
        port= $("#txtPortNumber").val();
        username= $("#txtUserName").val();
        password= $("#txtPassword").val();
    }
    else {
        ip = $("#txtIpAddressD").val();
        port= $("#txtPortNumberD").val();
        username= $("#txtUserNameD").val();
        password= $("#txtPasswordD").val();
    }
    $.ajax({
        url: "Connection/TestFtpConnection",
        cache: false,
        type: "POST",
        dataType: "json",
        async: false,
        data: { ip: ip,
            port: port,
            username: username,
            password: password
        },
        success: function (data) {
            if (data) {
                alert("Connected successfully");

                if (choice == 'u') {
                    $("#btnTestConnection").addClass('noDisplay');
                    $("#btnTestConnectionSuccess").removeClass('noDisplay');
                }
                else {
                    $("#btnTestConnectionD").addClass('noDisplay');
                    $("#btnTestConnectionSuccessD").removeClass('noDisplay');
                }
            }
            else {
                alert("Unable to connect Please try again later");
            }
        }
    });
    return false;
}

/* Uploads multiple files to server */
function FileUpload() {
    filesToUpload = [];

    // Iterate over each uploaded file
    $(".MultiFile-title").each(function (index) {
        filesToUpload[index] = $(this).text();
    });
    $.ajax({
        traditional: true,
        url: "Connection/UploadFiles",
        cache: false,
        type: "POST",
        dataType: "json",
        async: false,
        data: {
            fileCollection: filesToUpload,
            ftpServerIp: "192.168.1.69",
            ftpUserID: "autohou0",
            ftpPassword: "jill5113"
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

function FileDownload() {
    $.ajax({
        url: "Connection/FtpDownload",
        cache: false,
        type: "POST",
        dataType: "json",
        async: false,
        data: { ip: $("#txtIp").val(),
            port: $("#txtport").val(),
            username: $("#txtUser").val(),
            password: $("#txtPass").val(),
            ftpPath: $("#txtPath").val()

        },
        success: function (data) {
            alert(data);
            for (var i = 0; i < data.length; i++) {
                var item = "<a class='lnkImage' href='" + data[i] + "' target='_blank'> </a>";
                $("#lnkDownloads").append(item);
                $(".lnkImage").click();
            }

            if (data) {

                alert("File has been downloaded SucessFully");
            }
            else {
                alert("Unable to connect Please try again later");
            }
        }
    });
}