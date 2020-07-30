package com.projectk.requester.implementations.loggedinUserControllers;

import com.projectk.entities.Faculty;
import com.projectk.entities.enums.FacultyCategory;
import com.projectk.requester.implementations.services.ServiceResult;
import com.projectk.requester.implementations.services.interfaces.FacultyService;
import com.projectk.requester.interfaces.loggedinUserRequesters.FacultyRegisterRequester;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class FacultyRegistrationController implements FacultyRegisterRequester {
    private FacultyService facultyService;

    @Autowired
    public FacultyRegistrationController(FacultyService facultyService) {
        this.facultyService = facultyService;
    }

    @Override
    @GetMapping("/addfaculty")
    public Object displayFacultyRegistration() {
        return "facultyAdd";
    }

    @Override
    @PostMapping("/addfaculty")
    public Object executeFacultyRegistration(@RequestParam int code,
                                             @RequestParam String category,
                                             @RequestParam int uniId,
                                             @RequestParam String name,
                                             @RequestParam String dean,
                                             @RequestParam long price,
                                             @RequestParam String description,
                                             @RequestParam String webPage) {
        ServiceResult serviceResult = facultyService.addFaculty(new Faculty.Builder()
                .facultyId(code)
                .category(FacultyCategory.valueOf(category))
                .universityId(uniId)
                .name(name)
                .deanInfo(dean)
                .price(price)
                .description(description)
                .webpage(webPage)
                .build());
        return new ModelAndView(serviceResult.getViewName(), serviceResult.getModelMap());
    }
}
