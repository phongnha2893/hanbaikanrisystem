package com.isosoken.phongnha.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.Map;

public class JspPaginationSupportTag extends SimpleTagSupport {

    private static final Logger LOGGER = LoggerFactory.getLogger(JspPaginationSupportTag.class);

    private String url;
    private int currentPage;
    private int totalPages;
    private int maxLinks = 10;

    public static final String PAGINATION_LIST_CLASS_NAME = "pagination";
    public static final String CURRENT_PAGE_CLASS_NAME = "page-current";

    public static final String PREV_LINK_CLASS_NAME = "page-pre";
    public static final String NEXT_LINK_CLASS_NAME = "page-next";
    public static final String FIRST_LINK_CLASS_NAME = "page-first";
    public static final String LAST_LINK_CLASS_NAME = "page-last";
    public static final String PAGE_LINK_CLASS_NAME = "page-link";


    public static final String ICON_PREV_FONTAWESOME = "<i class=\"fas fa-angle-left\"></i>";
    public static final String ICON_NEXT_FONTAWESOME = "<i class=\"fas fa-angle-right\"></i>";
    public static final String ICON_FIRST_FONTAWESOME = "<i class=\"fas fa-backward\"></i>";
    public static final String ICON_LAST_FONTAWESOME = "<i class=\"fas fa-forward\"></i>";

    public String getUrl() { return this.url; }
    public void setUrl(String url) throws UnsupportedEncodingException { this.url = encodeUrl(url); }

    public int getCurrentPage() { return currentPage; }
    public void setCurrentPage(int currentPage) { this.currentPage = currentPage; }

    public int getTotalPages() { return totalPages; }

    public void setTotalPages(int totalPages) { this.totalPages = totalPages; }
    public int getMaxLinks() { return maxLinks; }

    public void setMaxLinks(int maxLinks) { this.maxLinks = maxLinks; }

    private Writer getWriter() {
        JspWriter out = getJspContext().getOut();
        return out;
    }

    @Override
    public void doTag() throws JspException {
        Writer out = getWriter();
        try {
            out.write(String.format("<ul class=\"%s\">", PAGINATION_LIST_CLASS_NAME));
            if (totalPages == 1) {
                out.write(writePageLink(1, "1", CURRENT_PAGE_CLASS_NAME, PAGE_LINK_CLASS_NAME));
                out.write("</ul>");
                return;
            }

            if (!isFirstPage()) {
                if (totalPages > maxLinks) {
                    out.write(writePageLink(1, ICON_FIRST_FONTAWESOME, FIRST_LINK_CLASS_NAME, PAGE_LINK_CLASS_NAME));
                }
                out.write(writePageLink(currentPage - 1, ICON_PREV_FONTAWESOME, PREV_LINK_CLASS_NAME, PAGE_LINK_CLASS_NAME));
            }

            for (int i = getPageStart(); i < getPageEnd() + 1; i++) {
                if (i == currentPage) {
                    out.write(writePageLink(i, String.valueOf(i), CURRENT_PAGE_CLASS_NAME, PAGE_LINK_CLASS_NAME));
                } else {
                    out.write(writeNotCurrentPageLink(i));
                }
            }

            if (!isLastPage()) {
                out.write(writePageLink(currentPage + 1, ICON_NEXT_FONTAWESOME, NEXT_LINK_CLASS_NAME, PAGE_LINK_CLASS_NAME));
                if (totalPages > maxLinks) {
                    out.write(writePageLink(totalPages, ICON_LAST_FONTAWESOME, LAST_LINK_CLASS_NAME, PAGE_LINK_CLASS_NAME));
                }
            }
            out.write("</ul>");
        } catch (IOException e) {
            LOGGER.error(e.toString(), e);
            throw new JspException(e.toString());
        }
    }

    private boolean isFirstPage() {
        return !(currentPage > 1);
    }

    private boolean isLastPage() {
        return currentPage == totalPages;
    }

    private int getPageStart() {
        int pageStart = currentPage - (maxLinks / 2);
        if (pageStart > totalPages - maxLinks + 1) pageStart = totalPages - maxLinks + 1;
        if (pageStart < 1) pageStart = 1;
        return pageStart;
    }

    private int getPageEnd() {
        int pageEnd = getPageStart() + maxLinks - 1;
        if (pageEnd > totalPages) pageEnd = totalPages;
        return pageEnd;
    }

    private String writeNotCurrentPageLink(int page) {
        return writePageLink(page, String.valueOf(page), null, PAGE_LINK_CLASS_NAME);
    }

    private String writePageLink(int page, String text, String className, String pageLinkClassName) {
        StringBuilder link = new StringBuilder("<li");
        if (!StringUtils.isEmpty(className)) {
            link.append(" class=\"");
            link.append(className);
            link.append("\"");
        }
        link.append(">")
                .append("<a href=\"")
                .append(url.replace("##", String.valueOf(page)))
                .append("\"")
                .append(" class=\"")
                .append(pageLinkClassName)
                .append("\">")
                .append(text)
                .append("</a>")
                .append("</li>");
        return link.toString();
    }

    public String encodeUrl(String url) throws UnsupportedEncodingException {
        String listParam = url.substring(url.indexOf("?") + 1);
        if (StringUtils.isEmpty(listParam)) return url;
        Map<String, String> params = splitQuery(listParam);
        StringBuilder urlBuilder = new StringBuilder();
        urlBuilder.append(url.substring(0, url.indexOf("?") + 1));
        int idx = 0;
        for (String k : params.keySet()) {
            idx++;
            urlBuilder.append(k).append("=").append(params.get(k));
            if (idx != params.size()) urlBuilder.append("&");
        }
        return urlBuilder.toString();
    }

    public Map<String, String> splitQuery(String url) throws UnsupportedEncodingException {
        Map<String, String> query_pairs = new LinkedHashMap<String, String>();
        String[] pairs = url.split("&");
        for (String pair : pairs) {
            int idx = pair.indexOf("=");
            if ("page".equals(pair.substring(0, idx))) {
                query_pairs.put(pair.substring(0, idx), pair.substring(idx + 1));
            } else {
                query_pairs.put(URLEncoder.encode(pair.substring(0, idx), "UTF-8"), URLEncoder.encode(pair.substring(idx + 1), "UTF-8"));
            }
        }
        return query_pairs;
    }

}
