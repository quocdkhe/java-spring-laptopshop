package vn.quocdk.laptopshop.controller.admin;

import java.util.List;

import jakarta.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import jakarta.servlet.ServletContext;
import vn.quocdk.laptopshop.domain.User;
import vn.quocdk.laptopshop.service.FileService;
import vn.quocdk.laptopshop.service.UserService;

@Controller
public class UserController {

    private final UserService userService;
    private final FileService fileService;
    private final PasswordEncoder passwordEncoder;

    public UserController(
            FileService fileService,
            UserService userService, ServletContext servletContext,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.fileService = fileService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        model.addAttribute("eric", "test");
        model.addAttribute("hoidanit", "from controller with model");
        return "hello";
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/create") // GET
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model,
                                 @ModelAttribute("newUser") @Valid User user,
                                 BindingResult newUserBindingResult,
                                 @RequestParam("imageFile") MultipartFile file
    ) {

        // validate
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String avatar = this.fileService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setAvatar(avatar);
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName(user.getRole().getName()));
        // save user
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/update/{id}") // GET
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("user", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model,
                                 @ModelAttribute("user") User user,
                                 @RequestParam("imageFile") MultipartFile file) {

        User currentUser = userService.getUserById(user.getId());

        currentUser.setAddress(user.getAddress());
        currentUser.setFullName(user.getFullName());
        currentUser.setPhone(user.getPhone());
        currentUser.setRole(userService.getRoleByName(user.getRole().getName()));
        if (!file.isEmpty()) {
            // Delete old avatar file
            String currentAvatar = currentUser.getAvatar();
            fileService.handleDeleteImage(currentAvatar, "avatar");
            String newAvatar = fileService.handleSaveUploadFile(file, "avatar");
            currentUser.setAvatar(newAvatar);
        }
        this.userService.handleSaveUser(currentUser);

        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("user", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("user") User user) {
        User toDelete = userService.getUserById(user.getId());
        String avatar = toDelete.getAvatar();
        fileService.handleDeleteImage(avatar, "avatar");
        userService.deleteAUser(toDelete.getId());
        return "redirect:/admin/user";
    }
}
