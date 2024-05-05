package entity;

/**
 * @author ChnpngWng
 *
 * @date   Mar 3, 20238:41:16 AM
 */
public class Experience {
	private int id;
	private String title;
	private String content;
	private String image1;
	private String image2;
	private String image3;
	/**
	 * 
	 */
	public Experience() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param id
	 * @param title
	 * @param content
	 * @param image1
	 * @param image2
	 * @param image3
	 */
	public Experience(int id, String title, String content, String image1, String image2, String image3) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
	}
	@Override
	public String toString() {
		return "Experience [id=" + id + ", title=" + title + ", content=" + content + ", image1=" + image1 + ", image2="
				+ image2 + ", image3=" + image3 + "]";
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
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the image1
	 */
	public String getImage1() {
		return image1;
	}
	/**
	 * @param image1 the image1 to set
	 */
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	/**
	 * @return the image2
	 */
	public String getImage2() {
		return image2;
	}
	/**
	 * @param image2 the image2 to set
	 */
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	/**
	 * @return the image3
	 */
	public String getImage3() {
		return image3;
	}
	/**
	 * @param image3 the image3 to set
	 */
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	
}
