package ir.tooka.controller;

import ir.tooka.model.entity.User;
import ir.tooka.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

@Controller
@PropertySource("classpath:message.properties")
public class UserController {
    @Autowired
    public UserService userService;
    @Autowired
    Environment env;

    @GetMapping(value = "/register")
    public ModelAndView showRegisterPage() {
        ModelAndView register = new ModelAndView("register");
        register.addObject("user", new User());
        return register;
    }

    @PostMapping(value = "/registerProcess")
    public ModelAndView registerProcess(@ModelAttribute User user, @RequestParam("file") MultipartFile file) {
        String message;
        String fileContentType = file.getContentType();
        if (fileContentType != null && fileContentType.contains("image")) {
            int maxSize = Integer.parseInt(env.getProperty("Picture.Max.Size"));
            if (file.getSize() <= maxSize) {
                try {
                    byte[] pictureBytes = file.getBytes();
                    user.setProfilePicture(pictureBytes);
                    userService.registerNewUser(user);
                    message = env.getProperty("Registration.Successful");
                } catch (IOException e) {
                    message = env.getProperty("Upload.Failed");
                }
            } else
                message = env.getProperty("Picture.Size.Error");
        } else
            message = env.getProperty("Invalid.File.Type");
        ModelAndView registerPage = new ModelAndView("register");
        registerPage.addObject("message", message);
        return registerPage;
    }
}