package vn.quocdk.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.quocdk.laptopshop.domain.Role;
import vn.quocdk.laptopshop.domain.User;
import vn.quocdk.laptopshop.domain.dto.RegisterDTO;
import vn.quocdk.laptopshop.repository.RoleRepository;
import vn.quocdk.laptopshop.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository,
                       RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public User handleSaveUser(User user) {
        User eric = this.userRepository.save(user);
        return eric;
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteAUser(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        user.setPhone(registerDTO.getPhone());
        user.setAddress(registerDTO.getAddress());
        return user;
    }

    public boolean checkExistedEmail(String email) {
        return userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

}
