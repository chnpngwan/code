package com.sofftem.servlet;

import com.google.gson.Gson;
import com.sofftem.bean.Imga;
import com.sofftem.bean.Produce;
import com.sofftem.service.impl.ImgaServiceImpl;
import com.sofftem.service.impl.ProduceServiceImpl;
import com.sofftem.utils.BaseServlet;
import com.sofftem.utils.Page;
import com.sofftem.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

@WebServlet("/ProduceServlet")
public class ProduceServlet extends BaseServlet {
    protected void searchProducePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=utf-8");
        String pname = req.getParameter("pname");
        Integer genre_id = WebUtils.parseInt(req.getParameter("genre_id"), 0);
//        System.out.println("pname = " + pname + genre_id);
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), 8);
        Page<Produce> page = new ProduceServiceImpl().page(pageNo, pageSize, pname, genre_id);
//        System.out.println("page = " + page);
        resp.getWriter().print(new Gson().toJson(page));
    }

    protected void toProduce(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int p_id = WebUtils.parseInt(req.getParameter("id"), 0);
        Produce produce = new ProduceServiceImpl().queryProduceById(p_id);
        List<Produce> produces = new ProduceServiceImpl().queryProduceGenreId(produce.getGenre_id());
        for (int i = 0; i < produces.size(); i++) {
            Produce p = produces.get(i);
            if (Objects.equals(p.getId(), produce.getId())) {
                produces.remove(i);
                break;
            }
        }
        List<Imga> imgas = new ImgaServiceImpl().queryImgaByPid(produce.getImga_id());
        req.setAttribute("produce", produce);
        req.setAttribute("produces", produces);
        req.setAttribute("imgas", imgas);
//        System.out.println("produce = " + produce);
//        System.out.println("imgas = " + imgas);
//        System.out.println("produces = " + produces);
        req.getRequestDispatcher("/pages/pag/product.jsp").forward(req, resp);
    }
}
