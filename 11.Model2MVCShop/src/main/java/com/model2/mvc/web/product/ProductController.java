package com.model2.mvc.web.product;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.review.ReviewService;

@Controller
@RequestMapping("/product/*") // /product/~~~ ����
public class ProductController {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("reviewServiceImpl")
	ReviewService reviewService;

	@Value("#{commonProperties['pageUnit']}")
	private int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	private int pageSize;

	public ProductController() {
		System.out.println(">> productController default constructor <<");
	}

	// @RequestMapping("addProduct.do")
	/*
	 * @RequestMapping(value="addProduct", method=RequestMethod.POST) public
	 * ModelAndView addProduct(@ModelAttribute("product") Product product)
	 * throws Exception {
	 * 
	 * System.out.println("@ addProduct @"); System.out.println(product);
	 * 
	 * product.setManuDate(product.getManuDate().replaceAll("-", ""));
	 * productService.addProduct(product);
	 * 
	 * ModelAndView modelAndView = new ModelAndView();
	 * modelAndView.setViewName("/product/addProduct.jsp");
	 * 
	 * return modelAndView; }
	 */

	/*
	 *
	 *
	 * ���� ���ε� (����)
	 *
	 *
	 * @RequestMapping(value="addProduct", method=RequestMethod.POST) public
	 * ModelAndView addProduct(HttpSession session, HttpServletRequest request,
	 * HttpServletResponse response) throws Exception {
	 * 
	 * System.out.println("@ addProduct @");
	 * 
	 * ModelAndView modelAndView = new ModelAndView();
	 * 
	 * if(FileUpload.isMultipartContent(request)) {
	 * C:\\Users\\1\\git\\07MVC\\07.Model2MVCShop(URI,pattern)\\WebContent\\
	 * images\\uploadFiles\\ // String temDir =
	 * "c:\\workspace\\07.Model2MVCShop(URI,pattern)\\WebContent\\images\\uploadFiles\\";
	 * String temDir =
	 * "C:\\Users\\1\\git\\07MVC\\07.Model2MVCShop(URI,pattern)\\WebContent\\images\\uploadFiles\\";
	 * C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core
	 * C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\
	 * wtpwebapps\\07.Model2MVCShop(URI,pattern)\\images\\uploadFiles\\ //
	 * String temDir =
	 * "C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\07.Model2MVCShop(URI,pattern)\\images\\uploadFiles\\";
	 * String path = session.getServletContext().getRealPath("/");
	 * System.out.println(path); DiskFileUpload fileUpload = new
	 * DiskFileUpload(); fileUpload.setRepositoryPath(temDir);
	 * fileUpload.setSizeMax(1024 * 1024 * 10); fileUpload.setSizeThreshold(1024
	 * * 100);
	 * 
	 * if(request.getContentLength() < fileUpload.getSizeMax()) {
	 * 
	 * Product product = new Product();
	 * 
	 * StringTokenizer token = null;
	 * 
	 * List fileItemList = fileUpload.parseRequest(request); int size =
	 * fileItemList.size();
	 * 
	 * for(int i = 0; i < size; i++) {
	 * 
	 * FileItem fileItem = (FileItem)fileItemList.get(i);
	 * 
	 * if(fileItem.isFormField()) { //�Ķ����
	 * 
	 * if(fileItem.getFieldName().equals("manuDate")) { //menuDate '-'ó��
	 * 
	 * token = new StringTokenizer(fileItem.getString("euc-kr"), "-"); String
	 * manuDate = token.nextToken() + token.nextToken() + token.nextToken();
	 * product.setManuDate(manuDate);
	 * 
	 * } else if(fileItem.getFieldName().equals("prodName")) {
	 * product.setProdName(fileItem.getString("euc-kr")); } else
	 * if(fileItem.getFieldName().equals("prodDetail")) {
	 * product.setProdDetail(fileItem.getString("euc-kr")); } else
	 * if(fileItem.getFieldName().equals("price")) {
	 * product.setPrice(Integer.parseInt(fileItem.getString("euc-kr"))); }
	 * 
	 * } else { //��������
	 * 
	 * if(fileItem.getSize() > 0) {
	 * 
	 * int idx = fileItem.getName().lastIndexOf("\\");
	 * 
	 * if(idx == -1) { // Unix,,,.? idx = fileItem.getName().lastIndexOf("/"); }
	 * 
	 * String fileName = fileItem.getName().substring(idx+1);
	 * product.setFileName(fileName); try { File uploadedFile = new File(temDir,
	 * fileName); fileItem.write(uploadedFile); } catch(IOException e) {
	 * System.out.println(e); } } } }
	 * 
	 * productService.addProduct(product);
	 * 
	 * // ModelAndView modelAndView = new ModelAndView();
	 * modelAndView.addObject("product", product);
	 * modelAndView.setViewName("/product/addProduct.jsp");
	 * 
	 * } else { //size ū ���
	 * 
	 * int overSize = (request.getContentLength() / 1000000);
	 * 
	 * System.out.println("<script>alert('����ũ��� 1MB�Դϴ�.. �ø��� ���� �뷮 ũ��� "
	 * +overSize+"MB�Դϴ�</script>"); }
	 * 
	 * } else {
	 * 
	 * System.out.println("���ڵ� Ÿ���� multipart/form-data�� �ƴմϴ�");
	 * 
	 * }
	 * 
	 * 
	 * 
	 * modelAndView.setViewName("/product/addProduct.jsp"); return modelAndView;
	 * }
	 */

	@RequestMapping(value = "addProduct", method = RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute("product") Product product, MultipartRequest request,
			/* @RequestParam("uploadFile") MultipartFile multipartFile, */
			HttpSession session) throws Exception {

		List<MultipartFile> fileList = request.getFiles("uploadFile");
		System.out.println(fileList.size());

		List<String> fileNameList = new ArrayList<String>();

		if (fileList != null) {
			for (MultipartFile multipartFile : fileList) {
				// System.out.println(files.getOriginalFilename());
				// session.getServletContext().getInitParameter("saveDirectory");
				if (multipartFile.getOriginalFilename() != "") {
//					String path = session.getServletContext()
//							.getRealPath(session.getServletContext().getInitParameter("saveDirectory"));
					String path = session.getServletContext().getInitParameter("saveDirectory");
					System.out.println("path : : "+path);
					
					// session���� ���� realPath (���¥�⿡ ����..)
					String realPath = session.getServletContext().getRealPath(path);

					// System.out.println(realPath);
					// client�� ���ε��� ������ �̸�
					String fileName = multipartFile.getOriginalFilename();
					fileNameList.add(fileName);
					// File file = new File(realPath, fileName);
					File file = new File(path, fileName);
					System.out.println(file.getAbsolutePath());
					
					multipartFile.transferTo(file);
				}
			}
		}
		product.setFileName(fileNameList);
		product.setManuDate(product.getManuDate().replaceAll("-", ""));
		System.out.println(product);

		productService.addProduct(product);

		/*
		 * 
		 * 
		 * // ���������� ������ if (!multipartFile.isEmpty()) { web.xml�� ����� ������ �����
		 * ��ġ�� // //
		 * session.getServletContext().getInitParameter("saveDirectory"); String
		 * path = session.getServletContext().getInitParameter("saveDirectory");
		 * // // session���� ���� realPath (���¥�⿡ ����..) String realPath =
		 * session.getServletContext().getRealPath(path); // //
		 * System.out.println(realPath); // // client�� ���ε��� ������ �̸� String
		 * fileName = multipartFile.getOriginalFilename();
		 * 
		 * product.setFileName(fileName); File file = new File(realPath,
		 * fileName); if (file.exists()) { System.out.println("����������");
		 * System.out.println("filePath : " + file.getAbsolutePath()); } else {
		 * System.out.println("���� �������� ����"); } multipartFile.transferTo(file); }
		 */

		return new ModelAndView("/product/addProduct.jsp", "product", product);
	}

	// @RequestMapping("listProduct.do")
	// @RequestMapping(value="listProduct/{menu}")
	@RequestMapping(value = "listProduct")
	public ModelAndView listProduct(@RequestParam(required=false) String menu,  @ModelAttribute("search") Search search)
			throws Exception {

		System.out.println("@ listProduct @");
		System.out.println(search);

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = productService.getProductList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);

		System.out.println(resultPage);

		ModelAndView modelAndView = new ModelAndView();
		 modelAndView.addObject("menu", menu);
		modelAndView.addObject("list", map.get("productList"));
		modelAndView.addObject("resultPage", resultPage);
//		modelAndView.setViewName("/product/listProduct.jsp");
		modelAndView.setViewName("/product/listProductScroll.jsp");

		return modelAndView;
	}

	// @RequestMapping("getProduct.do")
	// @RequestMapping(value="getProduct/{prodNo}/{menu}")
	@RequestMapping(value = "getProduct")
	public ModelAndView getProduct(@RequestParam("prodNo") int prodNo, @RequestParam("menu") String menu,
			/*
			 * @PathVariable String menu,
			 * 
			 * @PathVariable int prodNo,
			 */
			/* Cookie cookie, */
			HttpServletResponse response, @CookieValue(value = "history", required = false) Cookie cookie)
			throws Exception {

		System.out.println("@ getProduct  @");

		Product product = productService.getProduct(prodNo);

		if (cookie == null) {
			System.out.println("��Ű����");
			Cookie history = new Cookie("history", prodNo + ",");
			System.out.println("��Ű�� path :" + history.getPath());
			// history.setPath("/");
			response.addCookie(history);
		} else {
			System.out.println("��Ű����");
			String value = prodNo + ",";
			// for(int i = 0; i < cookies.length; i++) {
			// if(cookies[i].getName().equals("history")) {
			// value = cookies[i].getValue()+prodNo+",";
			value = cookie.getValue() + prodNo + ",";
			System.out.println("��Ű�� path :" + cookie.getPath());
			System.out.println("@@@@cookie@@@:" + value);
			Cookie history = new Cookie("history", value);
			history.setPath("/");
			response.addCookie(history);
			// }
			// }
			// response.addCookie(new Cookie("history", value));
		}

		/*
		 * 
		 * CookieGenerator CookieGenerator cookieGenerator = new
		 * CookieGenerator(); cookieGenerator.setCookieName("history");
		 * cookieGenerator.setCookiePath("/");
		 * cookieGenerator.addCookie(response, prodNo+","); Cookie[] cookies =
		 * request.getCookies(); for(int i = 0; i < cookies.length; i++) {
		 * System.out.println(cookies[i].getName()); }
		 */

		/*
		 * 
		 * Original if(history == null) { System.out.println("��Ű����"); Cookie
		 * cookie = new Cookie("history", prodNo+",");
		 * response.addCookie(cookie); } else { System.out.println("��Ű�ֿ�");
		 * response.addCookie(new Cookie("history", history+prodNo+",")); }
		 */

		/*
		 * 
		 * request, response
		 * 
		 * 
		 * Cookie[] cookies = request.getCookies(); if(cookies == null) { Cookie
		 * cookie = new Cookie("history", prodNo+","); cookie.setMaxAge(-1);
		 * response.addCookie(cookie); } else { String value = prodNo+",";
		 * for(int i = 0; i < cookies.length; i++) {
		 * if(cookies[i].getName().equals("history")) { value =
		 * cookies[i].getValue()+prodNo+",";
		 * System.out.println("@@@@cookie@@@:"+value); } }
		 * response.addCookie(new Cookie("history", value)); }
		 */

		String viewName = null;
		if (menu.equals("manage")) {
			viewName = "/product/updateProduct"; // ��ǰ����
		} else {
			viewName = "/product/getProduct.jsp"; // ��ǰ�󼼺���
		}

		ModelAndView modelAndView = new ModelAndView();
		//modelAndView.addObject("reviewList", reviewService.getReviewList(prodNo));
		modelAndView.addObject("menu", menu);
		modelAndView.addObject("product", product);
		modelAndView.setViewName(viewName);
		return modelAndView;
	}

	// @RequestMapping("updateProductView.do")
	@RequestMapping(value = "updateProduct", method = RequestMethod.GET)
	public ModelAndView updateProductView(@RequestParam("prodNo") int prodNo, @RequestParam("menu") String menu
	/*
	 * @PathVariable int prodNo,
	 * 
	 * @PathVariable String menu
	 */) throws Exception {

		System.out.println("@ updateProductView(GET) @");

		Product product = productService.getProduct(prodNo);

		ModelAndView modelAndView = new ModelAndView();
		// modelAndView.addObject("menu", menu);
		modelAndView.addObject("product", product);
		modelAndView.setViewName("/product/updateProduct.jsp");

		return modelAndView;
	}

	// @RequestMapping("updateProduct.do")
	@RequestMapping(value = "updateProduct", method = RequestMethod.POST)
	public ModelAndView updateProduct(@ModelAttribute("product") Product product, MultipartRequest request,
			HttpSession session) throws Exception {

		System.out.println("@ updateProduct(POST) @");
		List<MultipartFile> fileList = request.getFiles("uploadFile");
		System.out.println(fileList.size());

		List<String> fileNameList = new ArrayList<String>();
		if (fileList != null) {
			for (MultipartFile multipartFile : fileList) {
				// System.out.println(files.getOriginalFilename());
				// session.getServletContext().getInitParameter("saveDirectory");
				if (multipartFile.getOriginalFilename() != "") {
//					String path = session.getServletContext()
//							.getRealPath(session.getServletContext().getInitParameter("saveDirectory"));
					String path = session.getServletContext().getInitParameter("saveDirectory");
					System.out.println(path);
					// session���� ���� realPath (���¥�⿡ ����..)
					String realPath = session.getServletContext().getRealPath(path);

					// System.out.println(realPath);
					// client�� ���ε��� ������ �̸�
					String fileName = multipartFile.getOriginalFilename();
					System.out.println("fileName : " + fileName);

					fileNameList.add(fileName);
					// File file = new File(realPath, fileName);
					File file = new File(path, fileName);
					/*
					 * if (file.canWrite()) { System.out.println("����������");
					 * System.out.println("filePath : " +
					 * file.getAbsolutePath()); } else {
					 * System.out.println("���� �������� ����"); }
					 */
					if(!file.exists()) {
						System.out.println("����ҿ� ���� ����");
						multipartFile.transferTo(file);
					}
					// }
				}
			}
		}
		product.setFileName(fileNameList);
		System.out.println(product);

		product.setManuDate(product.getManuDate().replaceAll("-", ""));
		productService.updateProduct(product);
		product = productService.getProduct(product.getProdNo());

		ModelAndView modelAndView = new ModelAndView();
		// modelAndView.addObject("menu", "manage");
		modelAndView.addObject("product", product);
		modelAndView.setViewName("/product/getProduct.jsp?menu=manage");

		return modelAndView;
	}

	@RequestMapping(value = "deleteProduct")
	public ModelAndView deleteProduct(@RequestParam("prodNo") int prodNo, HttpSession session) throws Exception {

		// ��������ҿ��� ���������
		if (productService.getProduct(prodNo).getFileName() != null) {
			List<String> fileList = productService.getProduct(prodNo).getFileName();
			for (String fileName : fileList) {
				System.out.println("�����̸� : " + fileName);
//				String path = session.getServletContext()
//						.getRealPath(session.getServletContext().getInitParameter("saveDirectory"));
				String path = session.getServletContext().getInitParameter("saveDirectory");
				System.out.println(path);
				String realPath = session.getServletContext().getRealPath(path);
				System.out.println(realPath);
				File files = new File(path, fileName.trim());
				System.out.println(files.getAbsolutePath());
				files.delete();
			}
		}
		System.out.println("deleteProduct");
		productService.deleteProduct(prodNo);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/product/listProduct?menu=manage");

		return modelAndView;
	}
	

	
}
