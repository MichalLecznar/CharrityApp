package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.charity.entity.Donation;

public interface DonationRepository extends JpaRepository<Donation, Integer> {

    @Query(value = "SELECT SUM (d.quantity) FROM Donation d ")
    Integer quantityOfBags();
}
