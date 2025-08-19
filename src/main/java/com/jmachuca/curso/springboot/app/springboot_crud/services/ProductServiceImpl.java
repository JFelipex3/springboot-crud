package com.jmachuca.curso.springboot.app.springboot_crud.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jmachuca.curso.springboot.app.springboot_crud.entities.Product;
import com.jmachuca.curso.springboot.app.springboot_crud.repositories.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;
    
    @Override
    @Transactional(readOnly = true)
    public List<Product> findAll() {
        return (List<Product>) productRepository.findAll();
    }
    
    @Override
    @Transactional(readOnly = true)
    public Optional<Product> findById(Long id) {
        return productRepository.findById(id);
    }
    
    @Override
    @Transactional
    public Product save(Product product) {
        return productRepository.save(product);
    }
    
    @Override
    @Transactional
    public Optional<Product> delete(Product product) {
        Optional<Product> productOptional = productRepository.findById(product.getId());

        productOptional.ifPresent(prod -> {
            productRepository.delete(prod);
        });

        return productOptional;
    }
}
