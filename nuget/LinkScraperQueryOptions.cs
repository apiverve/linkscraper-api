using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.LinkScraper
{
    /// <summary>
    /// Query options for the Link Scraper API
    /// </summary>
    public class LinkScraperQueryOptions
    {
        /// <summary>
        /// The URL of the web page to scrape links from
        /// </summary>
        [JsonProperty("url")]
        public string Url { get; set; }

        /// <summary>
        /// Maximum number of links to scrape and return
        /// </summary>
        [JsonProperty("maxlinks")]
        public double Maxlinks { get; set; }

        /// <summary>
        /// Include query strings in the scraped links
        /// </summary>
        [JsonProperty("includequery")]
        public bool? Includequery { get; set; }
    }
}
