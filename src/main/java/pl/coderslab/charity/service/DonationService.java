package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.repository.DonationRepository;

import java.util.List;

@Service
@Transactional
public class DonationService {

    private final DonationRepository donationRepository;

    public DonationService(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    public void create(Donation donation){
        this.donationRepository.save(donation);
    }

    public Donation read(Integer id){
        // optional
        return this.donationRepository.findById(id).orElse(null);
    }

    public List<Donation> readAll(){
        return this.donationRepository.findAll();
    }

    public void delete(Integer id){
        this.donationRepository.deleteById(id);
    }


}
