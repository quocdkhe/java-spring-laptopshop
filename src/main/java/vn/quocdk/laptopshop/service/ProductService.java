package vn.quocdk.laptopshop.service;

import org.springframework.stereotype.Service;
import vn.quocdk.laptopshop.domain.Product;
import vn.quocdk.laptopshop.repository.ProductRepository;

import java.util.List;

@Service
public class ProductService {

    ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product handleSaveProduct(Product product) {
        return productRepository.save(product);
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public void deleteProductById(long id) {
        productRepository.deleteById(id);
    }

    public Product getProductById(long id) {
        return productRepository.findById(id);
    }

    public List<Product> getTop4OfficeLaptop(){
        return productRepository.findTop4ByPurpose("Văn phòng");
    }

    public List<Product> getTop4GamingLaptop(){
        return productRepository.findTop4ByPurpose("Gaming");
    }

    public List<Product> getTop4ThinLaptop(){
        return productRepository.findTop4ByPurpose("Mỏng nhẹ");
    }

    public List<Product> getTop4BusinessLaptop(){
        return productRepository.findTop4ByPurpose("Doanh nhân");
    }
}
