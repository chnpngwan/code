package com.model;

public class Music {
    private Integer musicId;

    private String musicName;

    private String musicImg;

    private String musicSrc;

    private String musicLyric;

    private String musicPeople;

    private String musicVideo;
    
    private int index;
    
    public Integer getMusicId() {
        return musicId;
    }

    public void setMusicId(Integer musicId) {
        this.musicId = musicId;
    }

    public String getMusicName() {
        return musicName;
    }

    public void setMusicName(String musicName) {
        this.musicName = musicName == null ? null : musicName.trim();
    }

    public String getMusicImg() {
        return musicImg;
    }

    public void setMusicImg(String musicImg) {
        this.musicImg = musicImg == null ? null : musicImg.trim();
    }

    public String getMusicSrc() {
        return musicSrc;
    }

    public void setMusicSrc(String musicSrc) {
        this.musicSrc = musicSrc == null ? null : musicSrc.trim();
    }

    public String getMusicLyric() {
        return musicLyric;
    }

    public void setMusicLyric(String musicLyric) {
        this.musicLyric = musicLyric == null ? null : musicLyric.trim();
    }

    public String getMusicPeople() {
        return musicPeople;
    }

    public void setMusicPeople(String musicPeople) {
        this.musicPeople = musicPeople == null ? null : musicPeople.trim();
    }

	public String getMusicVideo() {
		return musicVideo;
	}

	public void setMusicVideo(String musicVideo) {
		this.musicVideo = musicVideo;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}
	
    
}