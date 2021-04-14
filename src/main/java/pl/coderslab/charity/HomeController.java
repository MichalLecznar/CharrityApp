package pl.coderslab.charity;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;
import java.util.stream.Collectors;


@Controller
public class HomeController {

    private final DonationRepository donationRepository;
    private final InstitutionRepository institutionRepository;

    public HomeController(DonationRepository donationRepository, InstitutionRepository institutionRepository) {
        this.donationRepository = donationRepository;
        this.institutionRepository = institutionRepository;
    }

    @RequestMapping("/")
    public String homeAction(Model model) {
        Page<Institution> institutions = this.institutionRepository.findAll(PageRequest.of(0, 4));
        List<Institution> institutionsToList = institutions.stream().collect(Collectors.toList());
        model.addAttribute("institutions", institutionsToList);
        return "index";
    }

    @ModelAttribute("sumOfAllDonationsBugs")
    public Integer sumOfDonationsBugs() {
        Integer bags = this.donationRepository.quantityOfBags();
        return bags == null ? 0 : bags;
    }

    @ModelAttribute("allDonations")
    public Long allDonations() {
        return this.donationRepository.count();
    }


}
