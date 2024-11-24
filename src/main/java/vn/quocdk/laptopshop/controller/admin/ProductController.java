package vn.quocdk.laptopshop.controller.admin;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.quocdk.laptopshop.domain.Product;
import vn.quocdk.laptopshop.repository.ProductRepository;
import vn.quocdk.laptopshop.service.FileService;
import vn.quocdk.laptopshop.service.ProductService;

import java.util.List;

@Controller
public class ProductController {

    private final ProductService productService;
    private final FileService fileService;
    private final ProductRepository productRepository;

    public ProductController(ProductService productService, FileService fileService,
            ProductRepository productRepository) {
        this.productService = productService;
        this.fileService = fileService;
        this.productRepository = productRepository;
    }

    @GetMapping("/admin/product")
    public String getProductListPage(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        return "admin/product/show";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetailPage(@PathVariable long id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String postCreateProductPage(Model model,
            @ModelAttribute("newProduct") @Valid Product product,
            BindingResult bindingResult,
            @RequestParam("imageFile") MultipartFile imageFile) {
        if (bindingResult.hasErrors()) {
            System.out.println(bindingResult.getAllErrors());
            return "admin/product/create";
        }
        String productImage = fileService.handleSaveUploadFile(imageFile, "product");
        product.setImage(productImage);
        productService.handleSaveProduct(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("product", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("product") Product product) {
        Product toDelete = productService.getProductById(product.getId());
        String image = toDelete.getImage();
        fileService.handleDeleteImage(image, "product");
        productService.deleteProductById(product.getId());
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product currentProduct = productService.getProductById(id);
        model.addAttribute("product", currentProduct);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(Model model,
            @ModelAttribute("product") @Valid Product product, BindingResult bindingResult,
            @RequestParam("imageFile") MultipartFile imageFile) {
        if (bindingResult.hasErrors()) {
            System.out.println(bindingResult.getAllErrors());
            return "admin/product/update";
        }

        String currentImage = product.getImage();
        if (!imageFile.isEmpty()) {
            fileService.handleDeleteImage(currentImage, "product");
            String newImage = fileService.handleSaveUploadFile(imageFile, "product");
            product.setImage(newImage);
        }

        productService.handleSaveProduct(product);
        return "redirect:/admin/product";
    }

}
