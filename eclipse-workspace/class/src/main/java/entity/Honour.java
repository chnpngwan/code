package entity;

/**
 * @author ChnpngWng
 *
 * @date   Mar 3, 20238:42:05 AM
 */
public class Honour {
	private int id;
	private String title;
	private String personnel;
	private String time;
	private String image;
	/**
	 * 
	 */
	public Honour() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param id
	 * @param title
	 * @param personnel
	 * @param time
	 * @param image
	 */
	public Honour(int id, String title, String personnel, String time, String image) {
		super();
		this.id = id;
		this.title = title;
		this.personnel = personnel;
		this.time = time;
		this.image = image;
	}
	@Override
	public String toString() {
		return "Honour [id=" + id + ", title=" + title + ", personnel=" + personnel + ", time=" + time + ", image="
				+ image + "]";
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the personnel
	 */
	public String getPersonnel() {
		return personnel;
	}
	/**
	 * @param personnel the personnel to set
	 */
	public void setPersonnel(String personnel) {
		this.personnel = personnel;
	}
	/**
	 * @return the time
	 */
	public String getTime() {
		return time;
	}
	/**
	 * @param time the time to set
	 */
	public void setTime(String time) {
		this.time = time;
	}
	/**
	 * @return the image
	 */
	public String getImage() {
		return image;
	}
	/**
	 * @param image the image to set
	 */
	public void setImage(String image) {
		this.image = image;
	}
	
}
