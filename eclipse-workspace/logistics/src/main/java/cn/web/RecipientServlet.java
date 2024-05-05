package cn.web;

import cn.pojo.Recipient;
import cn.service.RecipientService;
import cn.service.impl.RecipientServiceImpl;
import cn.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/client/recipientServlet")
public class RecipientServlet extends BaseServlet{

    private RecipientService recipientService = new RecipientServiceImpl();



    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Recipient recipient = WebUtils.copyParamToBean(req.getParameterMap(), new Recipient());
        recipientService.addRecipient(recipient);
        resp.sendRedirect(req.getContextPath() + "/client/recipientServlet?action=list");
    }

    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int rid = WebUtils.parseInt(req.getParameter("id"),0);
        recipientService.deleteRecipientById(rid);
        resp.sendRedirect(req.getContextPath() + "/client/recipientServlet?action=list");
    }


    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Recipient recipient = WebUtils.copyParamToBean(req.getParameterMap(), new Recipient());
        recipientService.updateRecipient(recipient);
        resp.sendRedirect(req.getContextPath() + "/client/recipientServlet?action=list");
    }


    protected void getRecipient(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int rid = WebUtils.parseInt(req.getParameter("id"),0);
        Recipient recipient = recipientService.queryRecipientById(rid);
        req.setAttribute("recipients",recipient);
        req.getRequestDispatcher("/page/edit/recipient_edit.jsp").forward(req,resp);
    }

    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Recipient> recipients = recipientService.queryRecipients();

        req.setAttribute("recipients",recipients);

        req.getRequestDispatcher("/page/client/recipient.jsp").forward(req,resp);
    }
}
