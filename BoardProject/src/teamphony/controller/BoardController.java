package teamphony.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import teamphony.domain.BoardVO;
import teamphony.service.facade.BoardService;
import teamphony.util.MediaUtils;

@Controller
@RequestMapping("board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private static final String uploadPath = "C:\\upload";
	@Autowired
	private BoardService service;
	
	
	
	@RequestMapping(value="/register.do" , method= RequestMethod.GET)
	public String registerGet(MultipartFile file, BoardVO board, Model model) throws Exception{
			
		
			System.out.println("board.getFiles().length= " + board.getFiles().length);
			service.regist(board);
			model.addAttribute("result", "success");
			
			return "/board/success";
		}
		
		
	
	@RequestMapping(value="/register.do" , method= RequestMethod.POST)
	public String registerPost(BoardVO board, Model model, RedirectAttributes rttr) throws Exception{
		System.out.println("===================register================");
		System.out.println(board.toString());	
		service.regist(board);
		model.addAttribute("result", "success");
		
		
//		rttr.addFlashAttribute("message", "SUCCESS");
		return "redirect:/board/listAll.do";
		
	}
	
	@RequestMapping(value="/listAll.do" , method= RequestMethod.GET)
	public String listAll(Model model) throws Exception{
		
		List<BoardVO> list = service.listAll();
		model.addAttribute("list",list);
		model.addAttribute("message", "SUCCESS");
		
		
		return "board/listAll";
	}
	
	@RequestMapping(value="/read.do" , method= RequestMethod.GET)
	public String read(@RequestParam("bno") int bno, Model model) throws Exception{
		System.out.println("bno= " + bno);
		model.addAttribute(service.read(bno));

		return "board/detail";
		
	}
	
	@RequestMapping(value="/modify.do" , method= RequestMethod.GET)
	public String modifyGet(@RequestParam("bno") int bno, Model model) throws Exception{

		model.addAttribute(service.read(bno));

		return "board/modify";
		
	}
	
	@RequestMapping(value="/modify.do" , method= RequestMethod.POST)
	public String modifyPost(BoardVO boardVO, Model model) throws Exception{
		
		System.out.println("=========modifyController============");
		System.out.println(boardVO);
		service.modify(boardVO);
		
		return "redirect:/board/listAll.do";
		
	}
	
	@RequestMapping(value="/remove.do" , method= RequestMethod.POST)
	public String removePost(@RequestParam("bno") int bno, Model model) throws Exception{
		
		service.remove(bno);
		
		return "redirect:/board/listAll.do";
		
	}
	
	
	@RequestMapping(value="/uploadForm.do" , method= RequestMethod.GET)
	public String uploadForm(@RequestParam("bno") int bno, Model model) throws Exception{
		
		
		return "redirect:/board/listAll.do";
		
	}
	
	
	@RequestMapping(value="/uploadForm.do" , method= RequestMethod.POST)
	public String uploadFormPost(MultipartFile file, Model model) throws Exception{
		
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		
		model.addAttribute("savedName", savedName);
		
		System.out.println("savedName= " + savedName);
		System.out.println("=======================================================================================");
		
		return savedName;
		
	}
	
	
	public String uploadFile(String oirginalName, byte[] fileData)throws Exception{
		
		System.out.println("oirginalName= " + oirginalName);
		System.out.println("==========================================================================================");
		System.out.println("fileData= " + fileData);
		System.out.println("==========================================================================================");
		
		UUID uuid = UUID.randomUUID();
		
		String savedName = uuid.toString() + "_" + oirginalName;
		
		String savedPath =calcPath(uploadPath);
		System.out.println("savedPath= " + savedPath);
		System.out.println("==========================================================================================");
		
		File target = new File(uploadPath + savedPath, savedName); 
		
		System.out.println("target= " + target);
		System.out.println("===========================================================================================");
		FileCopyUtils.copy(fileData, target);
		
		
		
		
		return savedName;
	}
	
	private static String calcPath(String uploadPath){
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		
		String monthPath = yearPath + File.separator + new  DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath =monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		return datePath;
		
	}
	
	
	private static void makeDir(String uploadPath, String... paths){
		
//		if(new File(paths[paths.length-1]).exists()){
//			return;
		
		for(String path : paths){
			File dirPath = new File(uploadPath + path);
			
			if(! dirPath.exists()){
				dirPath.mkdir();
			}
		}
	}
	
	@ResponseBody
	@RequestMapping("/displayFile.do")
	public ResponseEntity<byte[]> displayFile(String fileName)throws Exception{
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		
		try{
			String formatName =fileName.substring(fileName.lastIndexOf("_") + 1);
			System.out.println("formatName= " + formatName );
			System.out.println("===========================================================================================");
			MediaType mediaType = MediaUtils.getMediaType(formatName);
			System.out.println("mediaType=" + mediaType );
			System.out.println("===========================================================================================");
			
			HttpHeaders headers = new HttpHeaders();
			
			
			in = new FileInputStream(uploadPath + fileName);
			
			
			if(mediaType != null){
				headers.setContentType(mediaType);
			}else{
				
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(mediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; fileName=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
				
				System.out.println("fileName" + fileName );
				System.out.println("===========================================================================================");
			}
			
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		}catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;
	}
	
	
	@RequestMapping("/getAttach.do/{bno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("bno")int bno)throws Exception{
		
		return service.getAttach(bno);
	}
	
	
	
	

}
