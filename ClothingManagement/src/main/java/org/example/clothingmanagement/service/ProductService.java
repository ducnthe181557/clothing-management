package org.example.clothingmanagement.service;

import org.example.clothingmanagement.entity.Category;
import org.example.clothingmanagement.entity.Product;
import org.example.clothingmanagement.entity.ProductDetail;
import org.example.clothingmanagement.repository.ProductDAO;

import java.util.*;

public class ProductService {
    private final ProductDAO pd = new ProductDAO();
    private final CategoryService cs = new CategoryService();
    private final ProductDetailService pds = new ProductDetailService();

    public HashMap<Product, String> getAllProductsWithPagination(int page, int pageSize) {
        List<Product> products = pd.getProductsWithPagination(page, pageSize);
        List<Category> categories = cs.selectAll();
        HashMap<Product, String> map = new HashMap<>();
        for (Product product : products) {
            // take the first productDetail of a product
            if (pds.findTheFirstProductDetailOfProductId(product.getId()).isPresent()) {
                ProductDetail productDetail = pds.findTheFirstProductDetailOfProductId(product.getId()).get();
                product.setUrlImage(productDetail.getImage());
            } else {
                product.setUrlImage("errorImage-NoDataFound");
            }
            for (Category category : categories) {
                if (product.getCategoryId() == category.getCategoryID()) {
                    map.put(product, category.getCategoryName());
                }
            }
        }
        return map;
    }

    public HashMap<Product, String> searchProducts(String nameSearch, int page, int pageSize){
        List<Product> products = pd.searchProducts(nameSearch, page, pageSize);
        List<Category> categories = cs.selectAll();
        HashMap<Product, String> map = new HashMap<>();
        for (Product product : products) {
            // take the first productDetail of a product
            if (pds.findTheFirstProductDetailOfProductId(product.getId()).isPresent()) {
                ProductDetail productDetail = pds.findTheFirstProductDetailOfProductId(product.getId()).get();
                product.setUrlImage(productDetail.getImage());
            } else {
                product.setUrlImage("errorImage-NoDataFound");
            }
            for (Category category : categories) {
                if (product.getCategoryId() == category.getCategoryID()) {
                    map.put(product, category.getCategoryName());
                }
            }
        }
        return map;
    }

    public List<Product> getAllProducts() {
        return pd.getAllProducts();
    }

    public boolean addProduct(Product product) {
        return pd.addProduct(product);
    }

    public boolean deleteProduct(String id) {
        return pd.deleteProduct(id);
    }

    public boolean recoverProduct(String id) {
        return pd.recoverProduct(id);
    }


    public Optional<Product> getProductById(String id) {
        return pd.getProductById(id);
    }

    public Product getProductByProductID(String productID) throws Exception {
        return pd.getProductByProductID(productID);
    }


//    public HashMap<Product, String> searchProducts(String txt) throws Exception {
//        return pd.searchProducts(txt);

    //}
    public List<Map<String, Object>> getAllProductProductDetail() throws Exception {
        return pd.getAllProductProductDetail();
    }

    public List<Map<String, Object>> getListPodetailByPoID(String poID) throws Exception {
        return pd.getListPodetailByPoID(poID);
    }

//    public static void main (String[] args) {
//        ProductService ps = new ProductService();
//        HashMap<Product> products = ps.searchProducts("spring",1,5);
//        for (Product product : products) {
//            System.out.println(product);
//        }
//    }


}

