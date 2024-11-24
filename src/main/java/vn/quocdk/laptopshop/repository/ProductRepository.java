package vn.quocdk.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.quocdk.laptopshop.domain.Product;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    Product save(Product product);

    Product findById(long id);

    List<Product> findAll();

    void deleteById(Long id);

    List<Product> findTop4ByPurpose(String purpose);
}
