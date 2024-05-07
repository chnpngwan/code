package com.sofftem.servlet;

import com.sofftem.utils.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends BaseServlet {
    protected void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
