package ir.tooka.service;

import ir.tooka.model.entity.User;
import ir.tooka.model.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service

public class UserService {
    @Autowired
    private UserRepository userRepository;

    @Transactional
    public void registerNewUser(User user) {
        user = userRepository.save(user);
        System.out.println(user.toString());
    }
}