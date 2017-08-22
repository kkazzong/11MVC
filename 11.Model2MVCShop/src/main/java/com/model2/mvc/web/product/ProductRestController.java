package com.model2.mvc.web.product;

import java.io.File;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	public ProductRestController() {
		System.out.println(":: ProductRESTController default CONSTRUCTOR ::");
	}
	
	/*@RequestMapping(value="json/addProduct", method=RequestMethod.POST)
	public Product addProduct(@RequestBody Product product) throws Exception {
		
		System.out.println(">>>[From Client]<<<");
		System.out.println(product);
		
		if(product.getManuDate() != null) {
			product.setManuDate(product.getManuDate().replaceAll("-", ""));
		}
		productService.addProduct(product);
		
		Product returnProduct = productService.getProduct(product.getProdNo());

		System.out.println(">>>>[To Client]<<<<");
		System.out.println(returnProduct);
		
		return returnProduct;
	}*/
	
	@RequestMapping(value="json/addProduct", method=RequestMethod.POST)
	public Product addProduct(@RequestParam(value="json") String json,
													/*@RequestParam(value="multipart") MultipartFile multipartFile,
													@RequestParam(value="multipart2") MultipartFile multipartFile2,*/
													MultipartRequest request,
													HttpSession session) throws Exception {
		
		System.out.println(">>>[From Client]<<<");
		System.out.println(json);
		//System.out.println(multipartFile.getOriginalFilename());
		//System.out.println(multipartFile2.getOriginalFilename());
		List<MultipartFile> fileList = request.getFiles("multipart");
		
		
		ObjectMapper objectMapper = new ObjectMapper();
		Product product = objectMapper.readValue(URLDecoder.decode(json,"UTF-8"), Product.class);
		System.out.println(product);
		
		///////////////////////////////////////////////////��������//////////////////////////////////////////////////////
		String path = session.getServletContext().getInitParameter("saveDirectory");
		System.out.println(path);
		
		//String fileName = multipartFile.getOriginalFilename();
		//String fileName2 = multipartFile2.getOriginalFilename();
		//System.out.println(fileName);
		List<String> fileNameList = new ArrayList<String>();
		for(MultipartFile multipartFile : fileList) {
			String fileName = multipartFile.getOriginalFilename();
			System.out.println(fileName);
			File file = new File(path, fileName);
			multipartFile.transferTo(file);
			fileNameList.add(fileName);
		}
		
		//File file = new File(path, fileName);
		//multipartFile.transferTo(file);
		
		//File file2 = new File(path, fileName2);
		//multipartFile2.transferTo(file2);
		///////////////////////////////////////////////////��������//////////////////////////////////////////////////////
		
		if(product.getManuDate() != null) {
			product.setManuDate(product.getManuDate().replaceAll("-", ""));
		}
		
		//List<String> fileList = new ArrayList<String>();
		//fileList.add(fileName);
		//fileList.add(fileName2);
		//product.setFileName(fileList);
		product.setFileName(fileNameList);
		
		productService.addProduct(product);
		
		Product returnProduct = productService.getProduct(product.getProdNo());

		System.out.println(">>>>[To Client]<<<<");
		System.out.println(returnProduct);
		
		return returnProduct;
	}
	
	@RequestMapping(value="json/getProduct/{prodNo}", method=RequestMethod.GET)
	public Product getProduct(@PathVariable int prodNo) throws Exception {
		
		System.out.println(">>[From Client]<<");
		System.out.println("prodNo : "+prodNo);
		
		//if(menu.equals("search")) {
			
			Product returnProduct = productService.getProduct(prodNo);
			System.out.println(">>>>[To Client]<<<<");
			System.out.println(returnProduct);
			
			return returnProduct; 
			
		//} else if(menu.equals("manage")) {
			
			//tmp
			//return this.updateProductView();
			
		//}
		//return null;
	}
	
//	@RequestMapping(value="json/listProduct/*", method=RequestMethod.GET)
	@RequestMapping(value="json/listProduct")
//	public Map listProduct(/*@PathVariable String menu*/) throws Exception {
	public Map listProduct(@RequestBody(required=false) Search search) throws Exception {
		
		System.out.println(">>[From Client]<<");
		System.out.println(search);
		/*
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		*/
		if(search != null) {
			System.out.println("json/listProduct POST");
			if(search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
		} else {
			search = new Search();
			if(search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
		}
		Map<String, Object> map = productService.getProductList(search);
		
		Page page = new Page(search.getCurrentPage(), (Integer)map.get("totalCount"), pageUnit, pageSize);
		map.put("resultPage", page);
		
		System.out.println(">>[To Client]<<");
		System.out.println(map.get("totalCount"));
		System.out.println(map.get("productList"));
		System.out.println(map.get("resultPage"));
		
		return map;
	}
	
	@RequestMapping(value="json/listProductAuto", method=RequestMethod.POST)
//	public Map listProduct(/*@PathVariable String menu*/) throws Exception {
	public List<Product> listProductAuto(@RequestBody(required=false) Search search) throws Exception {
		
		System.out.println(">>[From Client]<<");
		System.out.println(search);
		/*
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		*/
		if(search != null) {
			System.out.println("json/listProductAuto POST");
			if(search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
		} else {
			search = new Search();
			if(search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
		}
		Map<String, Object> map = productService.getProductList(search);
		List<Product> list = (List<Product>)map.get("productList");
		
		Page page = new Page(search.getCurrentPage(), (Integer)map.get("totalCount"), pageUnit, pageSize);
		System.out.println(page);
		
		System.out.println(">>[To Client]<<");
		System.out.println(list);
		
		return list;
	}
	
	@RequestMapping(value="json/updateProduct/{prodNo}", method=RequestMethod.GET)
	public Product updateProductView(@PathVariable int prodNo) throws Exception {
		
		//int prodNo = 10001;
		Product returnProduct = productService.getProduct(prodNo);
		
		System.out.println(">>>>[To Client]<<<<");
		System.out.println(returnProduct);
		
		return returnProduct;
	}
	
	@RequestMapping(value="json/updateProduct", method=RequestMethod.POST)
//	public Product updateProduct(@RequestBody Product product) throws Exception {
	public Product updateProduct(@RequestParam(value="json") String json,
														 MultipartRequest request,
														 HttpSession session) throws Exception {	
		
		System.out.println(">>>[From Client]<<<");
		//System.out.println(product);
		System.out.println(json);
		
		ObjectMapper objectMapper = new ObjectMapper();
		Product product = objectMapper.readValue(URLDecoder.decode(json, "UTF-8"), Product.class);
		System.out.println(product);
		
		List<MultipartFile> fileList = request.getFiles("multipart");
		List<String> fileNameList = new ArrayList<String>();
		
		String path = session.getServletContext().getInitParameter("saveDirectory");
		
		
		for(MultipartFile multipartFile:fileList) {
			String fileName = multipartFile.getOriginalFilename();
			System.out.println(fileName);
			File file = new File(path,fileName);
			multipartFile.transferTo(file);
			fileNameList.add(fileName);
		}
		
		
		//product.setManuDate(product.getManuDate().replaceAll("-", ""));
		if(product.getManuDate() != null) {
			product.setManuDate(product.getManuDate().replaceAll("-", ""));
		}
		product.setFileName(fileNameList);
		
		productService.updateProduct(product);
		
		Product returnProduct = productService.getProduct(product.getProdNo());
		
		System.out.println(">>>>[To Client]<<<<");
		System.out.println(returnProduct);
		
		return returnProduct;
	}
	
	/*@RequestMapping(value="json/deleteProduct/{prodNo}", method=RequestMethod.GET)
	public int deleteProduct(@PathVariable int prodNo) throws Exception {
		
		System.out.println(">>>[From Client]<<<");
		System.out.println("prodNo : "+prodNo);
		
		int complete = productService.deleteProduct(prodNo);
		
		System.out.println(">>>>[To Client]<<<<");
		System.out.println("�����Ǿ��� : "+complete);
		
		return complete;
	}*/
	
	@RequestMapping(value="json/deleteProduct/{prodNo}", method=RequestMethod.GET)
	public Map deleteProduct(@PathVariable int prodNo,HttpSession session) throws Exception {
		
		System.out.println(">>>[From Client]<<<");
		System.out.println("prodNo : "+prodNo);
		
		if (productService.getProduct(prodNo).getFileName() != null) {
			List<String> fileList = productService.getProduct(prodNo).getFileName();
			for (String fileName : fileList) {
				System.out.println("�����̸� : " + fileName);
				String path = session.getServletContext()
						.getRealPath(session.getServletContext().getInitParameter("saveDirectory"));
				System.out.println(path);
//				String realPath = session.getServletContext().getRealPath(path);
//				System.out.println(realPath);
				File files = new File(path, fileName.trim());
				System.out.println(files.getAbsolutePath());
				files.delete();
			}
		}
		
		int complete = productService.deleteProduct(prodNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("complete", complete);
		if(complete == 1) {
			map.put("message", "�����Ǿ����ϴ�");
		} else {
			map.put("message", "��������");
		}
		System.out.println(">>>>[To Client]<<<<");
		System.out.println("�����Ǿ��� : "+map.get("message"));
		
		return map;
	}
}
