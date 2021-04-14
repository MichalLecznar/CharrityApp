package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;

@Controller
public class InstitutionController {

    private final InstitutionRepository institutionRepository;

    public InstitutionController(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    @GetMapping("/add")
    public String add(Model m) {
        m.addAttribute("institution", new Institution());
        return "addinstitution";
    }

    @PostMapping("/add")
    public String postAdd(Institution institution) {
        this.institutionRepository.save(institution);
        return "redirect:/";
    }

    @GetMapping("/list")
    public String adminlist(Model m) {
        List<Institution> institutions = this.institutionRepository.findAll();
        m.addAttribute("institutions", institutions);
        return "listofinstitutions";
    }
}
