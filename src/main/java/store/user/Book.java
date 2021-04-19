package store.user;

public class Book {
	private String Title;
	private String Description;
	private String Image;
	private String Author;
	private double Price;
	
	public Book(String title, String description, String image, String author,double price) {
		this.Title=title;
		this.Description=description;
		this.Image=image;
		this.Author=author;
		this.Price=price;
	}
	
	public double getPrice() {
		return Price;
	}
	public void setPrice(double Price) {
		this.Price = Price;
	}
 
	public String getTitle() {
		return Title;
	}
	public void setTitle(String Title) {
		this.Title = Title;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String Description) {
		this.Description = Description;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String Image) {
		this.Image = Image;
	}
	public String getAuthor() {
		return Author;
	}
	public void setAuthor(String Author) {
		this.Author = Author;
	}
 
}
