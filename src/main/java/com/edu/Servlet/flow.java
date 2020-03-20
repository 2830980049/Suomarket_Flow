package com.edu.Servlet;

import com.alibaba.fastjson.JSON;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/flow")
public class flow extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext context = req.getServletContext();
        List<String> timeList = (List)context.getAttribute("timeList");
        List<Integer> valueList = (List)context.getAttribute("valueList");
        resp.setContentType("text/html;charset=utf-8");
        Map map = new HashMap();
        map.put("timeList",timeList);
        map.put("valueList",valueList);
        String json = JSON.toJSONString(map);
        System.out.println(json);
        resp.getWriter().println(json);
    }
}
