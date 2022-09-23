package tw.group5.commodity.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.group5.commodity.model.Commodity;
import tw.group5.commodity.service.CommodityService;


//商品新增
@Controller
@SessionAttributes(names = {"commodityAdministrationDemonstration"})
@RequestMapping(path = "/group5")
public class CommodityOnShelfController {

	private static final String SAVE_DIR = "commodityImages"; //儲存路徑
	
	private List<Commodity> commodityAdministrationDemonstration;
	
	@Autowired
	private CommodityService cService;
	
	@RequestMapping(path = "/commodity_on_shelf.action", method = RequestMethod.POST)
	public String processAction(@RequestParam("commodityNo")Integer commodityNo, @RequestParam("commodityType")String commodityType,  @RequestParam("commodityName")String commodityName, 
			                    @RequestParam("commodityStyle")String commodityStyle, @RequestParam("commodityPrice")int commodityPrice, @RequestParam("commodityInventory")int commodityInventory,
			                    @RequestParam("image1")MultipartFile image1, @RequestParam("image2")MultipartFile image2, @RequestParam("image3")MultipartFile image3, @RequestParam("image4")MultipartFile image4, @RequestParam("image5")MultipartFile image5, 
			                    @RequestParam("commodityDescription")String commodityDescription, HttpServletRequest request, Model m) throws IOException, ServletException {
		
		//判斷是否上架
		boolean onShelf = false;
		
		if (request.getParameter("onShelfButton") != null) {
			onShelf = true;
		}else {
			onShelf = false;
		}
		
		
		
		//照片存取及其路徑
		String severPath = request.getServletContext().getRealPath("");
				
		String savePath = severPath + SAVE_DIR;
				 
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
		   fileSaveDir.mkdir();   //不存在就建資料夾
	    }
	    System.out.println(savePath);
			     
			     
	    MultipartFile[] parts = {image1, image2, image3, image4, image5};
	    for (int i=0 ; i < parts.length ; i++) {
			if (parts[i] != null) {
				int iName = i+1;
				String fileName = commodityNo+"_"+"image"+iName+".jpg";
				File file = new File(savePath + File.separator +fileName);
				parts[i].transferTo(file);
				System.out.println(fileName);
			}	
		}
	    
	    String image1Path = savePath + File.separator + commodityNo+"_"+"image1"+".jpg";
		String image2Path = savePath + File.separator + commodityNo+"_"+"image2"+".jpg";
	    String image3Path = savePath + File.separator + commodityNo+"_"+"image3"+".jpg";
		String image4Path = savePath + File.separator + commodityNo+"_"+"image4"+".jpg";
		String image5Path = savePath + File.separator + commodityNo+"_"+"image5"+".jpg";
		
		Commodity newCommodity = new Commodity(commodityNo, commodityType, commodityName, commodityStyle, commodityPrice, commodityInventory, 
				                               image1 != null ? image1Path : null, 
				                               image2 != null ? image2Path : null, 
				                               image3 != null ? image3Path : null, 
				                               image4 != null ? image4Path : null, 
				                               image5 != null ? image5Path : null, 
				                               commodityDescription, onShelf);
		
		//裝結果訊息的Map
		HashMap<String, String> resultMessageMap = new HashMap<String,String>();
		//將Map放入request
		m.addAttribute("resultMessageMap", resultMessageMap);
				
						
		//將Model放入資料庫
		if (cService.insert(newCommodity)!=null) {
		   resultMessageMap.put("resultMessage","新增一筆商品完成!!");
		}else {
		   resultMessageMap.put("resultMessage","新增失敗，請檢查商品編號是否有重複");
		}
		
		
		
		commodityAdministrationDemonstration = cService.findAll();
		m.addAttribute("commodityAdministrationDemonstration", commodityAdministrationDemonstration);
		
		return "redirect:commodity_administration";
		//commodity/commodity_administration
	}
	
}
