package vn.quocdk.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import vn.quocdk.laptopshop.domain.Product;
import vn.quocdk.laptopshop.service.ProductService;

@Controller
public class ItemController {

    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        return "client/product/detail";
    }
}
