using System;
using System.IO;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace elFinder.MVCTest.Controllers
{
    public class ConnectionController : Controller
    {
        /// <summary>
        /// Tests FTP Connection and returns result to JS
        /// </summary>
        /// <param name="ip"></param>
        /// <param name="port"></param>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public JsonResult TestFtpConnection(string ip, string port, string username, string password)
        {
            string uri = "ftp://" + ip + ":" + port;
            var request = (FtpWebRequest)WebRequest.Create(uri);
            request.Method = WebRequestMethods.Ftp.ListDirectory;
            request.Credentials = new NetworkCredential(username, password);
            try
            {
                using (var response = (FtpWebResponse)request.GetResponse())
                {
                    if (response.StatusDescription.ToLower().Contains("connection accepted"))
                    {
                        return new JsonResult { Data = true, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
                    }
                    return new JsonResult { Data = true, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
                }
            }
            catch (Exception)
            {
                return new JsonResult { Data = false, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
            }
        }


        /// <summary>
        /// Tests FTP Connection and returns result to JS
        /// </summary>
        /// <param name="ip"></param>
        /// <param name="port"></param>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public JsonResult FtpDownload(string ip, string port, string username, string password, string ftpPath)
        {
            try
            {
                // File download
                FtpWebRequest ftpReq;
                string fileName = ftpPath;
                if (ftpPath.Contains(@"\"))
                {
                    string[] pathArr = ftpPath.Split('\\');
                    fileName = pathArr.Last();
                }
                using (FileStream outputStream = new FileStream("\\" + fileName, FileMode.Create))
                {
                    string uri = "ftp://" + ip + ":" + port + "/" + ftpPath;
                    ftpReq = (FtpWebRequest) FtpWebRequest.Create(uri);
                    ftpReq.Method = WebRequestMethods.Ftp.DownloadFile;
                    ftpReq.UseBinary = true;
                    ftpReq.Credentials = new NetworkCredential(username, password);
                    FtpWebResponse response = (FtpWebResponse) ftpReq.GetResponse();
                    Stream ftpStream = response.GetResponseStream();
                    long cl = response.ContentLength;
                    int bufferSize = 2048;
                    int readCount;
                    byte[] buffer = new byte[bufferSize];

                    readCount = ftpStream.Read(buffer, 0, bufferSize);
                    while (readCount > 0)
                    {
                        outputStream.Write(buffer, 0, readCount);
                        readCount = ftpStream.Read(buffer, 0, bufferSize);
                    }

                    ftpStream.Close();
                    outputStream.Close();
                    response.Close();


                }
                return new JsonResult { Data = false, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
            }
            catch (Exception)
            {
                return new JsonResult {Data = false, JsonRequestBehavior = JsonRequestBehavior.AllowGet};
            }
        }

    }
}
