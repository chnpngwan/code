package entity;

/**
 * @author ChnpngWng
 *
 * @date   Mar 3, 20238:42:56 AM
 */
public class Main {
	private String title;
	private String image;
	/**
	 * 
	 */
	public Main() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param title
	 * @param image
	 */
	public Main(String title, String image) {
		super();
		this.title = title;
		this.image = image;
	}
	@Override
	public String toString() {
		return "Main [title=" + title + ", image=" + image + "]";
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
