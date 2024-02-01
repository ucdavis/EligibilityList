using System;
using System.Collections.Specialized;
using System.Net;
using EligibilityList.Core.Abstractions;
using Microsoft.Reporting.WebForms;

namespace EligibilityListBLL
{
    public interface IReportBLL
    {
        ReportResult GenerateELReport(string actionName, string fisCode, ReportType reportType);
        //ReportResult GenerateIndividualTimeRecordReport(TimeRecord timeRecord, ReportType reportType);
        //ReportResult GenerateCostShare(Project project, int year, ReportType reportType);
    }

    public class ReportBLL : IReportBLL
    {
        private static readonly string ReportViewerUserName = System.Web.Configuration.WebConfigurationManager.AppSettings["ReportViewerUser"];
        private static readonly string ReportViewerPassword = System.Web.Configuration.WebConfigurationManager.AppSettings["ReportViewerPassword"];
        private static readonly string ReportViewerDomainName = System.Web.Configuration.WebConfigurationManager.AppSettings["ReportViewerDomain"];

        public ReportResult GenerateELReport(string actionName, string fisCode, ReportType reportType)
        {
            const string reportPath = "/EligibilityList/EligibilityListByAction";

            var parameters = new ListDictionary();
            parameters["Action"] = string.IsNullOrEmpty(actionName) ? "%" : actionName;
            parameters["Department"] = string.IsNullOrEmpty(fisCode) ? "%" : fisCode;

            return GetReport(reportPath, parameters, reportType);
        }

        //public ReportResult GenerateIndividualTimeRecordReport(TimeRecord timeRecord, ReportType reportType)
        //{
        //    const string reportPath = "/FSNEP2/IndividualActivityRecord";

        //    var parameters = new ListDictionary();
        //    parameters["TimeRecordID"] = timeRecord.Id;

        //    return GetReport(reportPath, parameters, reportType);
        //}

        //public ReportResult GenerateCostShare(Project project, int year, ReportType reportType)
        //{
        //    const string reportPath = "/FSNEP2/CostShare";

        //    var parameters = new ListDictionary();

        //    parameters["ProjectID"] = project.Id;
        //    parameters["year"] = year;

        //    return GetReport(reportPath, parameters, reportType);
        //}

        public ReportResult GetReport(string reportPath, ListDictionary parameters, ReportType reportType)
        {
            var rview = new Microsoft.Reporting.WebForms.ReportViewer();

            IReportServerCredentials myCredentials = new CustomReportCredentials(ReportViewerUserName, ReportViewerPassword, ReportViewerDomainName);

            rview.ServerReport.ReportServerCredentials = myCredentials;
            //rview.ServerReport.ReportServerUrl = new Uri(ReportServerUrl);
            rview.ServerReport.ReportServerUrl = new Uri(System.Web.Configuration.WebConfigurationManager.AppSettings["ReportServer"]);

            rview.ServerReport.ReportPath = reportPath;

            var paramList = new System.Collections.Generic.List<Microsoft.Reporting.WebForms.ReportParameter>();

            foreach (string key in parameters.Keys)
            {
                paramList.Add(new Microsoft.Reporting.WebForms.ReportParameter(key, parameters[key] == null ? null : parameters[key].ToString()));
            }

            rview.ServerReport.SetParameters(paramList);

            string mimeType, encoding, extension;
            string[] streamids;
            Microsoft.Reporting.WebForms.Warning[] warnings;

            string format = "pdf"; //default to PDF

            if (reportType == ReportType.Excel) format = "excel";
            if (reportType == ReportType.Web) format = "HTML4.0";

            const string deviceInfo = "<DeviceInfo>" +
                                      "<SimplePageHeaders>True</SimplePageHeaders>" +
                                      "</DeviceInfo>";

            byte[] bytes = rview.ServerReport.Render(format, deviceInfo, out mimeType, out encoding, out extension, out streamids, out warnings);

            var result = new ReportResult(bytes, mimeType);

            return result;
        }

        public class CustomReportCredentials : IReportServerCredentials
        {
            private string _userName;
            private string _passWord;
            private string _domainName;

            public CustomReportCredentials(string userName, string passWord, string domainName)
            {
                _userName = userName;
                _passWord = passWord;
                _domainName = domainName;
            }

            public System.Security.Principal.WindowsIdentity ImpersonationUser
            {
                get { return null; }
            }

            public ICredentials NetworkCredentials
            {
                get { return new NetworkCredential(_userName, _passWord, _domainName); }
            }

            public bool GetFormsCredentials(out Cookie authCookie, out string user, out string password,
                out string authority)
            {
                authCookie = null;
                user = password = authority = null;
                return false;
            }

        }
    }

    public enum ReportType
    {
        PDF,
        Excel,
        Web
    }
}
