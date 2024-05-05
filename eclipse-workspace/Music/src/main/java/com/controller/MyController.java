package com.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.MusicMapper;
import com.dao.SongMapper;
import com.dao.UserMusicMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.model.Music;
import com.model.Song;
import com.model.User;
import com.model.UserMusic;
import com.service.UserService;

import net.sf.json.JSONArray;

@Controller
public class MyController {
	@Resource
	private UserService userService;
	@Resource
	private SongMapper songMapper;
	@Resource
	private MusicMapper musicMapper;
	@Resource
	private UserMusicMapper userMusicMapper;
	
	
//	登录
	@RequestMapping("login")
	public String login(String username,String password,HttpServletRequest request,Model model) {
		// TODO Auto-generated method stub
		User user=userService.selectUserByUP(username,password);
		if(user!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			return "redirect:/index.do";
		}else {
			model.addAttribute("loginMsg","用户名或密码错误！");
			return "login";
		}
		
	}
//	注册
	@RequestMapping("register")
	public String register(String username,String password,String Okpassword,Model model) {
		// TODO Auto-generated method stub
		List<User> users=userService.selectUserAll();
		for(User user:users) {
			if( username.equals(user.getUsername())) {
				model.addAttribute("loginMsg","已有该用户名请更换一个！");
				return "register";
			}
		}
		User user=new User(null, username, password, null);
		int row=userService.addUser(user);
		if(row>0) {
			return "redirect:/login.jsp";
		}else {
			model.addAttribute("loginMsg","注册失败！");
			return "register";
		}
	}
	
	
	@RequestMapping(value = "UserJson",method = RequestMethod.POST)
	@ResponseBody
	public JSONArray UserJson(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user=(User) session.getAttribute("user");
		JSONArray users=JSONArray.fromObject(user);
		return users;
	}
	@RequestMapping("index")
	public String index(Model model) {
		// TODO Auto-generated method stub
		List<Song> songs=songMapper.selectSongAll();
		model.addAttribute("songs",songs);
		return "index";
	}	
	@RequestMapping("MusicBySongID")
	public String MusicBySongID(int songid,Model model,HttpServletRequest request,@RequestParam(defaultValue = "1")int page) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page,10);
		List<Music> musics=musicMapper.selectMusicBysongID(songid);
		
		Song song=songMapper.selectSongById(songid);
		HttpSession session = request.getSession();
		User user=(User) session.getAttribute("user");
		List<UserMusic> userMusics=userMusicMapper.selectUmByUId(user.getUserId());
		int j=(page*10)-10;
		PageInfo<Music> pageInfo = new PageInfo<Music>(musics,10);
			for(int i=0;i<musics.size();i++) {
				musics.get(i).setIndex(j);
				j++;
		}
	    model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("userMusics",userMusics);
		model.addAttribute("song",song);
		model.addAttribute("musics",musics);
		return "SongMusic";
	}
	@RequestMapping("MusicController")
	public String MusicController(int songId,Model model,String musicXH,HttpServletRequest request) {
		if(musicXH!=null) {
			model.addAttribute("musicXH",musicXH);
		}
		// TODO Auto-generated method stub
		List<Music> musics=musicMapper.selectMusicBysongID(songId);
		Song song=songMapper.selectSongById(songId);
		HttpSession session = request.getSession();
		User user=(User) session.getAttribute("user");
		List<UserMusic> userMusics=userMusicMapper.selectUmByUId(user.getUserId());
		model.addAttribute("song",song);
		model.addAttribute("userMusics",userMusics);
		model.addAttribute("musics",musics);
		return "MusicController";
	}
	@RequestMapping("getMusicBySongId")
	@ResponseBody
	public JSONArray getMusicBySongId(int songid) {
		// TODO Auto-generated method stub
		List<Music> musics=musicMapper.selectMusicBysongID(songid);
		JSONArray jsonArray=JSONArray.fromObject(musics);
		return jsonArray;
	}
	@RequestMapping("delUM")
	@ResponseBody
	public JSONArray delUM(int musicId,HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user=(User) session.getAttribute("user");
		UserMusic userMusic=new UserMusic();
		userMusic.setMusicId(musicId);
		userMusic.setUserId(user.getUserId());
		int row= userMusicMapper.delUMByUm(userMusic);
		JSONArray jsonArray=null;
		if(row>0) {
			jsonArray=JSONArray.fromObject("[{'flag':'true'}]");
			return jsonArray;
		}else {
			jsonArray=JSONArray.fromObject("[{'flag':'false'}]");
			return jsonArray;
		}
	}
	@RequestMapping("addUM")
	@ResponseBody
	public JSONArray addUM(int musicId,HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user=(User) session.getAttribute("user");
		UserMusic userMusic=new UserMusic();
		userMusic.setMusicId(musicId);
		userMusic.setUserId(user.getUserId());
		int row= userMusicMapper.addUM(userMusic);
		JSONArray jsonArray=null;
		if(row>0) {
			jsonArray=JSONArray.fromObject("[{'flag':'true'}]");
			return jsonArray;
		}else {
			jsonArray=JSONArray.fromObject("[{'flag':'false'}]");
			return jsonArray;
		}
	}
	@RequestMapping("MV")
	public String MV(Model model,int musicId ) {
		// TODO Auto-generated method stub
		Music music=musicMapper.selectMusicById(musicId);
		model.addAttribute("music",music);
		return "MVView";
	}
	@RequestMapping("MyCenter")
	public String MyCenter(Model model,HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user=(User) session.getAttribute("user");
		model.addAttribute("user",user);
		List<Music> musics=musicMapper.selectMusicListByuId(user.getUserId());
		model.addAttribute("musics",musics);
		return "MyCenter";
		
	}
	@RequestMapping("MyMusicController")
	public String MyMusicController(Model model,String musicXH,HttpServletRequest request) {
		if(musicXH!=null) {
			model.addAttribute("musicXH",musicXH);
		}
		
		HttpSession session = request.getSession();
		User user=(User) session.getAttribute("user");
		List<Music> musics=musicMapper.selectMusicListByuId(user.getUserId());
		// TODO Auto-generated method stub
		List<UserMusic> userMusics=userMusicMapper.selectUmByUId(user.getUserId());
		model.addAttribute("musics",musics);
		model.addAttribute("user",user);
		model.addAttribute("userMusics",userMusics);
		return "MyMusicController";
	}
	@RequestMapping("getMusicByUserId")
	@ResponseBody
	public JSONArray getMusicByUserId(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user=(User) session.getAttribute("user");
		List<Music> musics=musicMapper.selectMusicListByuId(user.getUserId());
		JSONArray jsonArray=JSONArray.fromObject(musics);
		return jsonArray;
	}
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("user", null);
		return "redirect:/login.jsp";
	}
	@RequestMapping("ss")
	public String ss(Model model,String text,HttpServletRequest request) {

		HttpSession session = request.getSession();
		User user=(User) session.getAttribute("user");
		// TODO Auto-generated method stub
		List<Music> musics=musicMapper.selectlike(text);
		List<UserMusic> userMusics=userMusicMapper.selectUmByUId(user.getUserId());
		model.addAttribute("musics",musics);
		model.addAttribute("userMusics",userMusics);
		model.addAttribute("text",text);
		return "ssMusic";
	}
	@RequestMapping("ssmusic")
	public String ssmusic(Model model,String musicXH,String text,HttpServletRequest request) {
		// TODO Auto-generated method stub
		if(musicXH!=null) {
			model.addAttribute("musicXH",musicXH);
		}
		
		HttpSession session = request.getSession();
		User user=(User) session.getAttribute("user");
		List<Music> musics=musicMapper.selectlike(text);
		// TODO Auto-generated method stub
		List<UserMusic> userMusics=userMusicMapper.selectUmByUId(user.getUserId());
		model.addAttribute("musics",musics);
		model.addAttribute("user",user);
		model.addAttribute("text",text);
		model.addAttribute("userMusics",userMusics);
		return "LikeMusic";
	}
	@RequestMapping("getMusicByText")
	@ResponseBody
	public JSONArray getMusicByText(String text) {
		// TODO Auto-generated method stub
		List<Music> musics=musicMapper.selectlike(text);
		JSONArray jsonArray=JSONArray.fromObject(musics);
		return jsonArray;
	}
}
