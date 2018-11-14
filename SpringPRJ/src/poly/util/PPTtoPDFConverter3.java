/*package poly.util;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.imageio.ImageIO;
import org.apache.poi.hslf.model.Slide;
import org.apache.poi.hslf.usermodel.SlideShow;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xslf.usermodel.XMLSlideShow;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfWriter;


public class PPTtoPDFConverter3{
	
	public static String PPTtoPDFConverter(String fileName) throws IOException,DocumentException {
		System.out.println("start");
		System.out.println(fileName);
		String filePath="C:\\Users\\data12\\Desktop\\";	

		//String filePPT="C:\\Users\\data12\\Desktop\\han.ppt";
		//1. ppt 파일을 불러옴
	//	XMLSlideShow ppt =new XMLSlideShow(inputStream)
		FileInputStream inputStream = new FileInputStream(filePath+fileName);
		SlideShow ppt=new SlideShow(inputStream);
		inputStream.close();
		//2. 이미지 그리기
		Dimension pageSize=ppt.getPageSize();
		Slide[] slide = ppt.getSlides();
		
		for(int i=0 ; i<slide.length; i++) {
			BufferedImage image = new BufferedImage(pageSize.width,pageSize.height,BufferedImage.TYPE_INT_RGB);
			Graphics2D graphics =image.createGraphics();
			graphics.setPaint(Color.white); //이미지 영역을 클리어
			graphics.fill(new Rectangle2D.Float(0,0,pageSize.width,pageSize.height));
			
			slide[i].draw(graphics);
			
			File dir = new File(filePath+"tempImg/");
			//폴더여부 확인
			if(!dir.isDirectory()) {
				dir.mkdirs();
			}
			
			FileOutputStream fos =new FileOutputStream(dir+"temp"+(i+1)+".png");
			ImageIO.write(image,"png", fos);
		
		}
		//3.IMAGE에서 PDF
		Document document = new Document();
		File dir = new File(filePath+"presentationPDF/");
		if(!dir.isDirectory()) {
			dir.mkdirs();
		}
		String pdfFileName="presentationPDF/"+UUID.randomUUID().toString();
		PdfWriter.getInstance(document,new FileOutputStream(filePath+pdfFileName));
		document.open();
		System.out.println("pdf위치"+pdfFileName);
		for(int i = 1 ; i<=slide.length;i++) {
			String imagePath = filePath+"tempImg/temp"+i+".png";
			Image image = Image.getInstance(imagePath);
			document.add(image);
			
			
			//4. Image 삭제 
			File file =new File(imagePath);
			file.delete();
		}
		document.close();
		return pdfFileName;
		
		
	}


}
*/