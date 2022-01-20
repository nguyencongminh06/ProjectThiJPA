package phuxuan.cntt.k17.nguyencongminh.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import phuxuan.cntt.k17.nguyencongminh.entity.Customer;
import phuxuan.cntt.k17.nguyencongminh.entity.Province;

@Repository("customerRepository")
public interface CustomerRepository extends JpaRepository<Customer, Integer> {
	List<Customer> findAllByProvince(Province province); 
}