package com.sofftem.servlet;

import com.google.gson.Gson;
import com.sofftem.bean.Album;
import com.sofftem.bean.Artist;
import com.sofftem.bean.Event;
import com.sofftem.bean.Live;
import com.sofftem.dao.impl.ArtistDaoImpl;
import com.sofftem.service.impl.AlbumServiceImpl;
import com.sofftem.service.impl.ArtistServiceImpl;
import com.sofftem.service.impl.EventServiceImpl;
import com.sofftem.service.impl.LivaServiceImpl;
import com.sofftem.utils.BaseServlet;
import com.sofftem.utils.Page;
import com.sofftem.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/ArtistServlet")
public class ArtistServlet extends BaseServlet {
    protected void searchPage(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json;charset=utf-8");
        String art_name = req.getParameter("art_name");
        Integer genre_id = WebUtils.parseInt(req.getParameter("genre_id"), 0);
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), 18);
        Page<Artist> page = new ArtistServiceImpl().page(pageNo, pageSize, art_name, genre_id);
        System.out.println("page = " + page);
        resp.getWriter().print(new Gson().toJson(page));
    }

    protected void searchLives(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json;charset=utf-8");
        Integer art_id = WebUtils.parseInt(req.getParameter("art_id"), 0);
        List<Live> lives = new LivaServiceImpl().queryLivesByArtId(art_id);
//        System.out.println("lives = " + lives);
        resp.getWriter().print(new Gson().toJson(lives));
    }

    protected void searchAlbum(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), 12);
        Page<Album> page = new AlbumServiceImpl().page(pageNo, pageSize, null, 0);
//        System.out.println("page = " + page);
        resp.setContentType("application/json;charset=utf-8");
        resp.getWriter().print(new Gson().toJson(page));
    }

    protected void toArtist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int art_id = WebUtils.parseInt(req.getParameter("id"), 0);
        Artist artist = new ArtistDaoImpl().queryArtistById(art_id);
        List<Album> albums = new AlbumServiceImpl().queryAlbumsByArtId(art_id);
        List<Event> events = new EventServiceImpl().queryEvents();
        List<Live> lives = new LivaServiceImpl().queryLivesByArtId(art_id);
        req.setAttribute("artist", artist);
        req.setAttribute("albums", albums);
        req.setAttribute("events", events);
        req.setAttribute("lives", lives);
        req.getRequestDispatcher("/pages/pag/artist.jsp").forward(req, resp);
    }

}