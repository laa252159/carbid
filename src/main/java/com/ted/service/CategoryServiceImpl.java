package com.ted.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ted.model.Category;
import com.ted.repository.CategoryRepository;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryRepository categoryRepository;

	public List<Category> getAllCategories() {
		
		return categoryRepository.findAll();
		
	}

	public String getMenuHtml() {
		
		String html = "";
		
		List<Category> categories = categoryRepository.getTopCategories();
		
		for(Category category : categories) {
			
			/* Top Categories start */
			html += "<li class=\"dropdown mega-dropdown\">\r\n   <a href=\"#\" class=\"dropdown-toggle bottom-color\" data-toggle=\"dropdown\">"
					+ category.getName()
					+ "<span class=\"caret\"></span></a>\r\n   <ul class=\"dropdown-menu mega-dropdown-menu\">\r\n      <li class=\"col-sm-3\">\r\n         <ul>\r\n            <li class=\"dropdown-header\">Search in "
					+ category.getName()
					+ "</li>\r\n            <div id=\"recentAuctions\">\r\n                <form class=\"navbar-center\" role=\"search\" action=\"/Auctioner/auctions\">\r\n                    <div class=\"form-group\">\r\n                        <div class=\"input-group\">\r\n                            <input type=\"text\" name=\"searchString\" class=\"form-control\" placeholder=\"Search\">\r\n                            <span class=\"input-group-btn\">\r\n                                <button class=\"btn btn-default\" type=\"submit\"><span class=\"glyphicon glyphicon-search\"></span></button>\r\n                            </span>\r\n                            <input type=\"hidden\" name=\"categoryId\" value=\""
					+ category.getCategoryId()
					+ "\">\r\n                            <input type=\"hidden\" name=\"page\" value=\"1\">\r\n                        </div>\r\n                    </div>\r\n                </form>\r\n                </div>\r\n            <li class=\"divider\"></li>\r\n            <li><a href=\"/Auctioner/auctions?categoryId="
					+ category.getCategoryId()
					+ "\">View all Auctions<span class=\"glyphicon glyphicon-chevron-right pull-right\"></span></a></li>\r\n         </ul>\r\n      </li>\r\n      <div class=\"col-9 pre-scrollabler\">";
			
			List<Category> categories2 = category.getCategories();
			
			Integer row = 4;							// Every fourth category add row div
			Integer div = 0;							// Every fourth category add </div>
			for(Category category2 : categories2) {
				
				/* Add row every 4 categories */
				if(row == 4) {
					html += "<div class=\"row\">";
					row = 0;
				}
				
				/* Second Category Start HTML */
				html += "<li class=\"col-sm-3\"><ul>"
						+"<li class=\"dropdown-header hvr-grow\"><a href=\"/Auctioner/auctions?categoryId=" + category2.getCategoryId() + "\"><i class=\"glyphicon glyphicon-chevron-right\"></i>" + category2.getName() + "</a>"
						+"</li>";
				
				
				List<Category> categories3 = category2.getCategories();
				
				for(Category category3 : categories3) {
					
					/* Third Category HTML */
					html += "<li><a class=\"hvr-grow\" href=\"/Auctioner/auctions?categoryId=" + category3.getCategoryId() + "\">"
							+category3.getName()
							+"</a></li>";
					
				}
				
				/* Second Category End HTML */
				html += "</ul>\r\n                                    </li>";
				
				/* Close row every 4 categories */
				if(div == 4) {
					html += "</div>";
					div = 0;
				}
				
				row++;
				div++;
			}
			
			/* Top Categories End */
			html += "</div>\r\n                     </div>\r\n                  </ul>\r\n               </li>";
					
		}
		
		
		return html;
		
	}

	public List<Category> getParentCategories(Category category) {
		
		ArrayList<Category> categories = new ArrayList<Category>();
		categories.add(category);

		while(category.getCategory() != null) {
			category = category.getCategory();
			categories.add(category);
		}
		
		return categories;
	}
	

}
