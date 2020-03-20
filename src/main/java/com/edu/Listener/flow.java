package com.edu.Listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class flow implements ServletRequestListener, ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        List<String> timeList = new ArrayList<String>();
        List<Integer> valueList = new ArrayList<Integer>();

        sce.getServletContext().setAttribute("timeList",timeList);
        sce.getServletContext().setAttribute("valueList",valueList);
        System.out.println("请求分析统计已初始化");
    }

    @Override
    public void requestInitialized(ServletRequestEvent sre) {
        HttpServletRequest request = (HttpServletRequest)sre.getServletRequest();
        String url = request.getRequestURI();
        if(url.endsWith("/flow") || url.endsWith("flow.do"))
            return;
        List<String> timeList = (List)sre.getServletContext().getAttribute("timeList");
        List<Integer> valueList = (List)sre.getServletContext().getAttribute("valueList");
        Date date = new Date();
        SimpleDateFormat sfd = new SimpleDateFormat("HH:mm");
        String time = sfd.format(date);
        if(timeList.indexOf(time) == -1){
            timeList.add(time);
            valueList.add(1);
            sre.getServletContext().setAttribute("timeList",timeList);
            sre.getServletContext().setAttribute("valueList",valueList);
        }
        else{
            int index = timeList.indexOf(time);
            int value = valueList.get(index);
            valueList.set(index,value + 1);
            sre.getServletContext().setAttribute("valueList",valueList);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
    @Override
    public void requestDestroyed(ServletRequestEvent servletRequestEvent) {

    }
}
