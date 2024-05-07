package com.sofftem.servlet;

import com.sofftem.bean.*;
import com.sofftem.service.impl.*;
import com.sofftem.utils.BaseServlet;
import com.sofftem.utils.Page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/FirstServlet")
public class FirstServlet extends BaseServlet {
    protected void toFirstjsp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Page<Artist> pageArtist = new ArtistServiceImpl().page(1, 12, null, 0);
        Page<Live> pageLive = new LivaServiceImpl().page(1, 9, null, 0);
        Page<Produce> pageProduce = new ProduceServiceImpl().page(1, 8, null, 0);
        Page<Event> pageEvent = new EventServiceImpl().page(1, 6, null, "upcoming");
        MusicServiceImpl musicService = new MusicServiceImpl();
        List<Music> hotmusic = musicService.HotMusic();
        List<Music> newmusic = musicService.NewMusic();
        Page<Live> livePage=new LivaServiceImpl().page(1,5,null,0);
        req.setAttribute("Events", pageEvent);
        req.setAttribute("Artists", pageArtist);
        req.setAttribute("Lives", pageLive);
        req.setAttribute("Produces", pageProduce);
        req.setAttribute("hotmusic", hotmusic);
        req.setAttribute("newmusic", newmusic);
        req.setAttribute("lives", livePage);
        req.getRequestDispatcher("/pages/first.jsp").forward(req, resp);
    }
}
