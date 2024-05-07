package com.sofftem.servlet;

import com.google.gson.Gson;
import com.sofftem.bean.Live;
import com.sofftem.bean.Music;
import com.sofftem.service.impl.LivaServiceImpl;
import com.sofftem.service.impl.MusicServiceImpl;
import com.sofftem.utils.BaseServlet;
import com.sofftem.utils.Page;
import com.sofftem.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/PodcastsServlet")
public class PodcastsServlet extends BaseServlet {
    protected void searchLivePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String livename = req.getParameter("livename");
        Integer genre_id = WebUtils.parseInt(req.getParameter("genre_id"), 0);
//        System.out.println("livename = " + livename + " id=" + genre_id);
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), 9);
        Page<Live> page = new LivaServiceImpl().page(pageNo, pageSize, livename, genre_id);
        System.out.println("page = " + page);
        resp.setContentType("application/json;charset=utf-8");
        resp.getWriter().print(new Gson().toJson(page));
    }

    protected void toPodcasts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Music> musicNews = new MusicServiceImpl().NewMusic();
        req.setAttribute("musicNews", musicNews);
//        System.out.println("musicNews = " + musicNews);
        req.getRequestDispatcher("/pages/podcasts.jsp").forward(req, resp);
    }
}
