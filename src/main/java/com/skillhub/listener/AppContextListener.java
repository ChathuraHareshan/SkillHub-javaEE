package com.skillhub.listener;

import com.skillhub.data.DataStore;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class AppContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        DataStore store = DataStore.getInstance();
        sce.getServletContext().setAttribute("dataStore", store);
        sce.getServletContext().setAttribute("activeSessionCount", 0);
        sce.getServletContext().log("SkillHub Portal: application context initialised, demo data loaded.");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        sce.getServletContext().log("SkillHub Portal: application context is shutting down.");
    }
}
