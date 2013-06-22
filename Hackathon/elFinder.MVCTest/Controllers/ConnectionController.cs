using System;
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

    }
}
