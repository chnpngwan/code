package com.sofftem.servlet;

import com.google.gson.Gson;
import com.sofftem.bean.*;
import com.sofftem.dao.impl.ArtistDaoImpl;
import com.sofftem.service.impl.*;
import com.sofftem.utils.BaseServlet;
import com.sofftem.utils.Page;
import com.sofftem.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(value = "/AlbumServlet")
public class AlbumServlet extends BaseServlet {
    protected void searchAlbumPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String albumOrartname = req.getParameter("albumOrartname");
        Integer genre_id = WebUtils.parseInt(req.getParameter("genre_id"), 0);
//        System.out.println("genre_id + albumOrartname = " + genre_id + albumOrartname);
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), 12);
        Page<Album> page = new AlbumServiceImpl().page(pageNo, pageSize, albumOrartname, genre_id);
//        System.out.println("albumpage = " + page);
        resp.setContentType("application/json;charset=utf-8");
        resp.getWriter().print(new Gson().toJson(page));
    }

    protected void searchAlbumCommentPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer album_id = WebUtils.parseInt(req.getParameter("album_id"), 0);
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), 12);
        Page<Comment> page = new CommentServiceImpl().page(pageNo, pageSize, album_id);
//        System.out.println("page = " + page);
        resp.setContentType("application/json;charset=utf-8");
        resp.getWriter().print(new Gson().toJson(page));
    }

    protected void updateCommentZan(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String info = req.getParameter("info");
        int id = WebUtils.parseInt(req.getParameter("id"), 0);
        int msg = new CommentServiceImpl().updateZanCount(info, id);
        resp.setContentType("application/json;charset=utf-8");
        resp.getWriter().print(new Gson().toJson(msg));
    }

    protected void updateReplayZan(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String info = req.getParameter("info");
        int id = WebUtils.parseInt(req.getParameter("id"), 0);
        int msg = new ReplayServiceImpl().updateZanCount(info, id);
        resp.setContentType("application/json;charset=utf-8");
        resp.getWriter().print(new Gson().toJson(msg));
    }


    protected void toRelease(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = WebUtils.parseInt(req.getParameter("id"), 0);
        Album album = new AlbumServiceImpl().queryAlbumById(id);
        List<Music> musics = new MusicServiceImpl().queryMusicByAlbumId(album.getId());
//        System.out.println("album = " + album);
        Integer genreId = album.getGenre_id();
        Page<Album> albumPage = new AlbumServiceImpl().page(1, 10, null, genreId);
        req.setAttribute("album", album);
        req.setAttribute("musics", musics);
        req.setAttribute("albumPage", albumPage.getItems());
        System.out.println("albumPage = " + albumPage);
        req.getRequestDispatcher("/pages/pag/release.jsp").forward(req, resp);
    }

    protected void toArtist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        int art_id = WebUtils.parseInt(req.getParameter("id"), 0);
        Artist artist = new ArtistDaoImpl().queryArtistById(art_id);
        List<Album> albums = new AlbumServiceImpl().queryAlbumsByArtId(art_id);
        List<Event> events = new EventServiceImpl().queryEvents();
        req.setAttribute("artist", artist);
        req.setAttribute("albums", albums);
        req.setAttribute("events", events);
        req.getRequestDispatcher("/pages/pag/artist.jsp").forward(req, resp);
    }

    //    protected void showMusic(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        int album_id = WebUtils.parseInt(req.getParameter("id"), 0);
//        List<Music> musics = new MusicServiceImpl().queryMusicByAlbumId(album_id);
//        System.out.println("musics = " + musics);
//        resp.setContentType("application/json;charset=utf-8");
//        resp.getWriter().print(new Gson().toJson(musics));
//    }
    protected void toReleases(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Music> musicNews = new MusicServiceImpl().NewMusic();
        req.setAttribute("musicNews", musicNews);
//        System.out.println("musicNews = " + musicNews);
        req.getRequestDispatcher("/pages/releases.jsp").forward(req, resp);
    }
}
