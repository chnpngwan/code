package com.model;

import java.util.List;

public class Song {
    private Integer songId;

    private String songTitle;

    private String songImg;

    private String songInfo;
    
    private String songBfl;
    

    public Integer getSongId() {
        return songId;
    }

    public void setSongId(Integer songId) {
        this.songId = songId;
    }

    public String getSongTitle() {
        return songTitle;
    }

    public void setSongTitle(String songTitle) {
        this.songTitle = songTitle == null ? null : songTitle.trim();
    }

    public String getSongImg() {
        return songImg;
    }

    public void setSongImg(String songImg) {
        this.songImg = songImg == null ? null : songImg.trim();
    }

    public String getSongInfo() {
        return songInfo;
    }

    public void setSongInfo(String songInfo) {
        this.songInfo = songInfo == null ? null : songInfo.trim();
    }

	public String getSongBfl() {
		return songBfl;
	}

	public void setSongBfl(String songBfl) {
		this.songBfl = songBfl;
	}

    
}