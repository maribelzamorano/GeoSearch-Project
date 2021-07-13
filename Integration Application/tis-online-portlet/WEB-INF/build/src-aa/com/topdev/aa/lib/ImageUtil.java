/**
 * @author SvenBrand
 * erstellt am 09.07.2009
 */

package com.topdev.aa.lib;

import java.awt.image.BufferedImage;
import java.awt.image.DataBufferInt;
import java.awt.image.RenderedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

import javax.imageio.IIOException;
import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageOutputStream;

public class ImageUtil
{
	static String fileName;
	public static String scaleImage(String name, File file, int twidth) throws Exception
	{   
		fileName = name;
		scaleImage(fileName, file, twidth, -1);
		return fileName;
	}  
  
	/**
	 * Skalieren von Bildern
	 * Die Höhe des Bildes wird relativ zur Breite berechnet. Die Ausmaße des Bildes bleiben also gleich.
	* @param is - Bilddaten als Datenstrom
	* @param twidth - Die gewünschte Breite des Bildes
	* @return Bilddaten des bearbeiteten Bildes als Datenstrom
	* @throws Exception
	*/
	public static InputStream scaleImage(String name, InputStream is,int twidth) throws Exception 
	{	    
		fileName = name;
		return scaleImage(fileName, is, twidth, -1);
	}
   
	/**
	* Skalieren von Bildern
	* @param file - Die zu bearbeitende Datei
	* @param twidth - Breite
	* @param theight - Höhe
	* @return Dateiname
	* @throws Exception
	*/
	public static String scaleImage(String name, File file, int twidth,int theight) throws Exception
	{    
		fileName = name;
		InputStream is = new FileInputStream(file);
		InputStream tempis = scaleImage(fileName, is, twidth, theight);
		is.close();
		writeImage(tempis, file);		
		return fileName; 
	}
    
	/**
	* Skalieren von Bildern
	* @param is - Die zu bearbeitende Datei als Datenstrom
	* @param twidth - Breite
	* @param theight - Höhe
	* @return Bilddaten als Datenstrom
	* @throws Exception
	*/
	public static InputStream scaleImage(String name, InputStream is,int twidth,int theight) throws Exception 
	{								
		fileName = name;
		BufferedImage img = ImageIO.read(is);
		int width = img.getWidth(null);
		int height = img.getHeight(null);
		
		// Pixel zugreifbar machen...PixelGrabber ist viel zu langsam
		BufferedImage sdest = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
		sdest.getGraphics().drawImage(img,0,0,null);
		DataBufferInt data = (DataBufferInt) (sdest.getRaster().getDataBuffer());
		int[] pixels = data.getData();
		
		BufferedImage dest = null;
		// Nur skalieren, wenn das Quellbild nicht dieselbe Breite wie das Zielbild hat
		if( width > twidth)
		{
			// Höhe anhand der Breite des Bildes berechnen
			if (theight == -1) theight = (int)(height/((float)width/(float)twidth)); 
			
			// Zielbild erzeugen
			dest = new BufferedImage(twidth,theight,BufferedImage.TYPE_INT_RGB);
			DataBufferInt tdata = (DataBufferInt) (dest.getRaster().getDataBuffer());
			int[] dPixels = tdata.getData();		
			
			float idx = (float) width / (float) twidth;
			float idy = (float) height / (float) theight;
	    
			idx += 0.005;
			idy += 0.005;
	    
			float px = 0;
			float py = 0;
	
			for (int y = 0;y < theight;y++)
			{
				int yp = y * twidth;
				for (int x = 0;x < twidth;x++) 
				{
					int colr = 0;
					int colg = 0;
					int colb = 0;
					int adds = 0;
	
					// Ziemlich maue Interpolation anwenden...
					for (int ix = 0;ix < idx;ix++) 
					{
						for (int iy = 0;iy < idy;iy++) 
						{
							int pos = ((int) (px)) + ix + ((int) (py) + iy) * width;
							if (pos >= pixels.length) pos = pixels.length - 1;
							
							int pix = pixels[pos];
							int r = (pix & 0x00ff0000) >> 16;
							int g = (pix & 0x0000ff00) >> 8;
							int b = pix & 0x000000ff;
							colr += r;
							colg += g;
							colb += b;
							adds++;
						}
					}
	
					// Ergebnispixel schreiben...
					dPixels[yp + x] = (colr / adds) << 16 | (colg / adds) << 8 | (colb / adds);
					px += idx;
					if (px >= width) 
					{
						px = 0;
						py += idy;
					}
				}
			}        
		}		
		else dest = img;		
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		int pos = fileName.lastIndexOf(".");
		String suffix = fileName.substring(pos+1);		
		if (suffix != "jpg")
		{
			suffix = "jpg";
			fileName = fileName.substring(0, pos)+"."+suffix;			
		}
		
		ImageIO.write(dest, suffix, baos);				
		byte[] bytes = baos.toByteArray();				
		return new ByteArrayInputStream(bytes);
  }
  
	public static String getFileName()
	{
		return fileName;
	}
	  /**
	   * Schreibt das Bild mit dem gewünschten Dateinamen auf HD
	   * @param image - Bilddaten
	   * @param file - Dateiname
	   * @throws Exception
	   * @throws IIOException
	   */
	public static void writeImage(InputStream stream, File file) throws Exception, IIOException
	{
		int pos = fileName.lastIndexOf(".");
		String suffix = fileName.substring(pos+1);
		
		BufferedImage image = ImageIO.read(stream);
		Iterator<ImageWriter> itty = ImageIO.getImageWritersBySuffix(suffix);
		if (itty.hasNext()) 
		{
			ImageWriter iw = (ImageWriter) itty.next();
			ImageWriteParam iwp = iw.getDefaultWriteParam();
			iwp.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
			iwp.setCompressionQuality(0.95f);
			ImageOutputStream ios = null;
          
			try
			{
				file.delete();
				ios = ImageIO.createImageOutputStream(file);
			}
			catch (IOException e) { throw new IIOException("writeImage: OutputStream fehlgeschlagen", e); }			

			iw.setOutput(ios);          
			iw.write(null,new IIOImage((RenderedImage) image,null,null),iwp);
			image.flush();			
			ios.close();
		}
		else throw new RuntimeException("writeImage: Keinen Writer gefunden!");       
	}
}