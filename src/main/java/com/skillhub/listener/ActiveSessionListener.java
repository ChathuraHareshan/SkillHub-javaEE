package com.skillhub.listener;

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;


@WebListener
public class ActiveSessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        ServletContext ctx = session.getServletContext();
        synchronized (ctx) {
            Integer count = (Integer) ctx.getAttribute("activeSessionCount");
            if (count == null) count = 0;
            ctx.setAttribute("activeSessionCount", count + 1);
        }
        ctx.log("Session created: " + session.getId());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        ServletContext ctx = session.getServletContext();
        synchronized (ctx) {
            Integer count = (Integer) ctx.getAttribute("activeSessionCount");
            if (count == null || count <= 0) {
                count = 1;
            }
            ctx.setAttribute("activeSessionCount", count - 1);
        }
        ctx.log("Session destroyed: " + session.getId());
    }
}
