<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="OptimusHackathon.Hacksercises" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <title></title>
  <link rel="stylesheet" href="https://d10ajoocuyu32n.cloudfront.net/mobile/1.3.1/jquery.mobile-1.3.1.min.css">
  
  <!-- Extra Codiqa features -->
  <link rel="stylesheet" href="codiqa.ext.css">
  <link rel="stylesheet" href = "css\site.css">
  <!-- jQuery and jQuery Mobile -->
  <script src="https://d10ajoocuyu32n.cloudfront.net/jquery-1.9.1.min.js"></script>
  <script src="https://d10ajoocuyu32n.cloudfront.net/mobile/1.3.1/jquery.mobile-1.3.1.min.js"></script>

  <!-- Extra Codiqa features -->
  <script src="https://d10ajoocuyu32n.cloudfront.net/codiqa.ext.js"></script>
  <script src="Scripts/jquery.MultiFile.js" type="text/javascript"></script>
  <script src="Scripts/jquery.MultiFile.js" type="text/javascript"></script>
</head>
<body>
   <form id="Form1" runat="server">
<!-- Home -->

<div data-role="page" id="home">
    <div data-theme="a" data-role="header">
        <h3>
            Hackathon
        </h3>
    </div>
    <div data-role="content">
        <ul data-role="listview" data-divider-theme="b" data-inset="true">
            <li data-role="list-divider" role="heading">
                Please choose your action
            </li>
            <li data-theme="c">
                <a href="#connector" data-transition="slide">
                    Upload
                </a>
            </li>
            <li data-theme="c">
                <a href="#downloader" data-transition="slide">
                    Download
                </a>
            </li>
        </ul>
    </div>
    <div data-theme="a" data-role="footer" data-position="fixed">
        <h3>
            Powered by Code Warriors
        </h3>
    </div>
</div>

<!-- Test Connection Page -->
<div data-role="page" id="connector">
    <div data-theme="a" data-role="header">
        <h3>
            Connector
        </h3>
    </div>
    <div data-role="content">
        <div data-role="fieldcontain">
            <label for="textinput1">
                IP Address
            </label>
            <input name="" id="textinput1" placeholder="192.168.1.1" value="" type="text"
            data-mini="true">
        </div>
        <div data-role="fieldcontain">
            <label for="textinput2">
                Port
            </label>
            <input name="" id="textinput2" placeholder="21" value="" type="number"
            data-mini="true">
        </div>
        <div data-role="fieldcontain">
            <label for="textinput3">
                User Name
            </label>
            <input name="" id="textinput3" placeholder="anonymous" value="" type="text"
            data-mini="true">
        </div>
        <div data-role="fieldcontain">
            <label for="textinput4">
                Password
            </label>
            <input name="" id="textinput4" placeholder="" value="" type="password"
            data-mini="true">
        </div>
        <a data-role="button" href="#uploader" data-icon="gear" data-iconpos="left">
            Test Connection
        </a>
		 <a data-role="button" href="#home" data-icon="home" data-iconpos="left">
                    Go to Home Page &lt;&lt;
                </a>
    </div>
    <div data-theme="a" data-role="footer" data-position="fixed">
        <h3>
            Powered by Code Warriors
        </h3>
    </div>
</div>

<!-- Uploader -->
<div data-role="page" id="uploader">
    <div data-theme="a" data-role="header">
        <h3>
            Uploader
        </h3>
    </div>
    <div data-role="content">
        <div data-role="fieldcontain">
            <label for="filesUploader">
                Choose Files to Upload
            </label>
			<br/>
             <asp:FileUpload ID="file_upload" class="multi" runat="server" Width="400" size="50" />
        </div>
		<a data-role="button" href="#home" data-icon="gear" data-iconpos="left">
            Upload
        </a>
		 <a data-role="button" href="#home" data-icon="home" data-iconpos="left">
                    Go to Home Page &lt;&lt;
                </a>
    </div>
    <div data-theme="a" data-role="footer" data-position="fixed">
        <h3>
            Powered by Code Warriors
        </h3>
    </div>	
</div>

<!-- Downloader -->
<div data-role="page" id="downloader">
    <div data-theme="a" data-role="header">
        <h3>
            Downloader
        </h3>
    </div>
    <div data-role="content">
        <div data-role="collapsible-set">
            <div data-role="collapsible" data-collapsed="true">
                <h3>
                    Choose Remote Server
                </h3>
                <div data-role="collapsible-set">
                    <div data-role="collapsible">
                        <h3>
                            Khushbu-PC (192.168.1.69)
                        </h3>
                        <img src="https://maps.googleapis.com/maps/api/staticmap?center=Pinnacle Towers, Sector 63, Noida&amp;zoom=13&amp;size=200x200&amp;markers=Pinnacle Towers, Sector 63, Noida&amp;sensor=false"
                        width="200" height="200">
                    </div>
                    <div data-role="collapsible">
                        <h3>
                            Varun-PC (192.168.1.135)
                        </h3>
                        <img src="https://maps.googleapis.com/maps/api/staticmap?center=Pinnacle Towers, Sector 63, Noida&amp;zoom=13&amp;size=200x200&amp;markers=Pinnacle Towers, Sector 63, Noida&amp;sensor=false"
                        width="200" height="200">
                    </div>
                </div>
            </div>
            <div data-role="collapsible">
                <h3>
                    Direct FTP
                </h3>
                <div data-role="fieldcontain">
                    <label for="textinput6">
                        IP Address
                    </label>
                    <input name="" id="textinput6" placeholder="192.168.1.1" value="" type="text"
                    data-mini="true">
                </div>
                <div data-role="fieldcontain">
                    <label for="textinput7">
                        Port
                    </label>
                    <input name="" id="textinput7" placeholder="21" value="" type="number"
                    data-mini="true">
                </div>
                <div data-role="fieldcontain">
                    <label for="textinput8">
                        User Name
                    </label>
                    <input name="" id="textinput8" placeholder="anonymous" value="" type="text"
                    data-mini="true">
                </div>
                <div data-role="fieldcontain">
                    <label for="textinput9">
                        Password
                    </label>
                    <input name="" id="textinput9" placeholder="" value="" type="password"
                    data-mini="true">
                </div>
                <div data-role="fieldcontain">
                    <label for="textinput10">
                        FTP Path (Directory/ Folder/ File)
                    </label>
                    <input name="" id="textinput10" placeholder="C://FolderName" value=""
                    type="text" data-mini="true">
                </div>
                <a data-role="button" href="#page1" data-icon="arrow-d" data-iconpos="left">
                    Download
                </a>                
            </div>
			<a data-role="button" href="#home" data-icon="home" data-iconpos="left">
                    Go to Home Page &lt;&lt;
                </a>
        </div>
    </div>
    <div data-theme="a" data-role="footer" data-position="fixed">
        <h3>
            Powered by Code Warriors
        </h3>
    </div>
</div>
</form>
</body>
</html>
