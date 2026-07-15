declare module '@apiverve/linkscraper' {
  export interface linkscraperOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface linkscraperResponse {
    status: string;
    error: string | null;
    data: LinkScraperData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface LinkScraperData {
      url:               null | string;
      linkCount:         number | null;
      externalLinkCount: number | null;
      internalLinkCount: number | null;
      links:             Link[];
      uniqueDomains:     (null | string)[];
      maxLinksReached:   boolean | null;
  }
  
  interface Link {
      text:     null | string;
      href:     null | string;
      external: boolean | null;
  }

  export default class linkscraperWrapper {
    constructor(options: linkscraperOptions);

    execute(callback: (error: any, data: linkscraperResponse | null) => void): Promise<linkscraperResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: linkscraperResponse | null) => void): Promise<linkscraperResponse>;
    execute(query?: Record<string, any>): Promise<linkscraperResponse>;
  }
}
