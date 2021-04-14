package pl.coderslab.charity.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Entity
public class Donation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotNull(message = "Pole nie może byc puste")
    @Min(value = 1, message = "Minimalna wartość musi wynosić 1")
    private Integer quantity;

    @NotEmpty(message = "Pole nie może byc puste")
    @ManyToMany
    private List<Category> categories;

    @NotNull(message = "Pole nie może byc puste")
    @ManyToOne
    private Institution institution;

    @NotBlank(message = "Pole nie może byc puste")
    private String street;

    @NotBlank(message = "Pole nie może byc puste")
    private String city;

    @NotBlank(message = "Pole nie może byc puste")
    private String zipCode;

    @NotNull(message = "Pole nie może byc puste")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate pickUpDate;

    @NotNull(message = "Pole nie może byc puste")
    @DateTimeFormat(pattern = "HH:mm")
    private LocalTime pickUpTime;

    @Size(max = 255, message = "Maksymalnie 255 znaków")
    private String pickUpComment;

    public Donation() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }

    public Institution getInstitution() {
        return institution;
    }

    public void setInstitution(Institution institution) {
        this.institution = institution;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public LocalDate getPickUpDate() {
        return pickUpDate;
    }

    public void setPickUpDate(LocalDate pickUpDate) {
        this.pickUpDate = pickUpDate;
    }

    public LocalTime getPickUpTime() {
        return pickUpTime;
    }

    public void setPickUpTime(LocalTime pickUpTime) {
        this.pickUpTime = pickUpTime;
    }

    public String getPickUpComment() {
        return pickUpComment;
    }

    public void setPickUpComment(String pickUpComment) {
        this.pickUpComment = pickUpComment;
    }
}
