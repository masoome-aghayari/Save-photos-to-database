package ir.tooka.model.repository;

import ir.tooka.model.entity.User;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.Repository;

@org.springframework.stereotype.Repository
public interface UserRepository extends Repository<User, Integer>, JpaSpecificationExecutor<User> {
    User save(User user);
}