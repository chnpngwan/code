package com.sofftem.servlet;

import com.sofftem.bean.Comment;
import com.sofftem.bean.Replay;
import com.sofftem.bean.User;
import com.sofftem.service.CommentService;
import com.sofftem.service.ReplayService;
import com.sofftem.service.impl.CommentServiceImpl;
import com.sofftem.service.impl.ReplayServiceImpl;
import com.sofftem.utils.BaseServlet;
import com.sofftem.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CommentServlet")
public class CommentServlet extends BaseServlet {
    CommentService commentService = new CommentServiceImpl();
    ReplayService replayService=new ReplayServiceImpl();

    protected void addComment(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        int ablumid = WebUtils.parseInt(req.getParameter("ablumid"), 0);
        String comment = req.getParameter("comment");
        commentService.addComment(new Comment(null, user.getId(), comment, 0, 0, ablumid, null, null, null, null));
        resp.sendRedirect("AlbumServlet?action=toRelease&id=" + ablumid);
    }

    protected void addReplay(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        int ablumid = WebUtils.parseInt(req.getParameter("ablumid"), 0);
        int commentid = WebUtils.parseInt(req.getParameter("commentid"), 0);
        System.out.println("ablumid = " + ablumid);
        System.out.println("ablumid = " + commentid);
        String comment = req.getParameter("comment");
        replayService.addReplay(new Replay(null, user.getId(),commentid, comment, 0, 0, null,null,null));
        resp.sendRedirect("AlbumServlet?action=toRelease&id=" + ablumid);
    }
}
