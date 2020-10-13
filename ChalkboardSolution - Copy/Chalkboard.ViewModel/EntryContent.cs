using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Chalkboard.ViewModel
{
    public class EntryContent
    {
        public CoverPage CoverPage { get; set; }
        public Page[] Pages { get; set; }
    }

    public class CoverPage
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public string Author { get; set; }
        public string[] ImageFileNames { get; set; }
        [JsonIgnore]
        public HttpPostedFileBase[] Images { get; set; }

    }

    public class Page
    {
        public string PageTitle { get; set; }
        public string PageContent { get; set; }
        public string[] PageImageFileNames { get; set; }
        [JsonIgnore]
        public HttpPostedFileBase[] Images { get; set; }
        public int PageNo { get; set; }
    }
}
