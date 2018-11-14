package poly.util;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.imageio.ImageIO;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xslf.usermodel.XMLSlideShow;
import org.apache.poi.xslf.usermodel.XSLFSlide;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfWriter;


public class PPTtoPDFConverter{
	
	public static String PPTtoPDFConverter(String fileName) throws IOException,DocumentException, InvalidFormatException {
		System.out.println("start");
		String filePath="C:\\Users\\data12\\git\\SpringPRJ\\WebContent\\presentationPDF\\";	
		FileInputStream inputStream = new FileInputStream(filePath+fileName);
		XMLSlideShow ppt=new XMLSlideShow(OPCPackage.open(inputStream));
		inputStream.close();
		Dimension pgsize=ppt.getPageSize();
		float scale=1;
		int width = (int) (pgsize.width * scale);
		int height = (int) (pgsize.height * scale);
		
		int i = 1 ;
		int totalSildes=ppt.getSlides().length;
		System.out.println(totalSildes);
		
		for(XSLFSlide slide:ppt.getSlides()) {
			BufferedImage img = new BufferedImage(pgsize.width,pgsize.height,BufferedImage.TYPE_INT_RGB);
			Graphics2D graphics = img.createGraphics();
			graphics.fill(new Rectangle2D.Float(0,0,pgsize.width,pgsize.height));
			graphics.setRenderingHint(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);
			graphics.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
            graphics.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
            graphics.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
            graphics.setColor(Color.white);
            graphics.clearRect(0, 0, width, height);
            graphics.scale(scale, scale);
            slide.draw(graphics);
            FileOutputStream out = new FileOutputStream("C:\\Users\\data12\\git\\SpringPRJ\\WebContent\\presentationPDF\\"+fileName+i+".png");
            javax.imageio.ImageIO.write(img, "png", out);
            out.close();
            i++;
		
		}
		
	Document document = new Document();
		File dir=new File(filePath);
		if(!dir.isDirectory()) {
			dir.mkdirs();
		}
		String pdfFileName=fileName+".pdf";
		PdfWriter.getInstance(document,new FileOutputStream(filePath+pdfFileName));
		
		
		document.open();
		System.out.println("pdf위치"+pdfFileName);
		for(int j =1;j<= ppt.getSlides().length;j++ ) {
			String imagePath=filePath+fileName+j+".png";
			Image image = Image.getInstance(imagePath);
			document.add(image);
			//4. 이미지 삭제 
			File file = new File(imagePath);
			file.delete();
		}
		
		//5.ppt 파일 삭제
		File file= new File(filePath+fileName);
		file.delete();
		document.close();
	
		
		return pdfFileName;
	}


}
