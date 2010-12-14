package com.enation.eop.utils;

import java.io.File;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.enation.eop.EopSetting;
import com.enation.eop.context.EopContext;
import com.enation.framework.image.IThumbnailCreator;
import com.enation.framework.image.ThumbnailCreatorFactory;
import com.enation.framework.util.DateUtil;
import com.enation.framework.util.FileUtil;
import com.enation.framework.util.StringUtil;

public class UploadUtil {
	
	private UploadUtil(){
		
	}
	
	/**
	 * 上传图片<br/>
	 * 图片会被上传至用户上下文的attacment文件夹的subFolder子文件夹中<br/>
	 * 
	 * @param file  图片file对象
	 * @param fileFileName 上传的图片原名
	 * @param subFolder  子文件夹名
	 * @return 
	 * @since 上传后的本地路径，如:fs:/attachment/goods/2001010101030.jpg<br/>
	 * 
	 */
	public static String upload(File file,String fileFileName,String subFolder ) {
		
		if(file==null || fileFileName==null) throw new IllegalArgumentException("file or filename object is null");
		if(subFolder == null)throw new IllegalArgumentException("subFolder is null");
		String fileName = null;
		String filePath = "";
 
		String ext = FileUtil.getFileExt(fileFileName);
		fileName = DateUtil.toString(new Date(), "yyyyMMddHHmmss") + StringUtil.getRandStr(4) + "." + ext;
		
		filePath =  EopSetting.IMG_SERVER_PATH +EopContext.getContext().getContextPath()+  "/attachment/";
		if(subFolder!=null){
			filePath+=subFolder +"/";
		}
		
		String path  = EopSetting.FILE_STORE_PREFIX+ "/attachment/" +(subFolder==null?"":subFolder)+ "/"+fileName;
	 
		filePath += fileName;
		FileUtil.createFile(file, filePath);
	 
		return path;
	}
	
	
	public static String replacePath(String path){
		
		if(StringUtil.isEmpty(path)) return path;
		//if(!path.startsWith(EopSetting.FILE_STORE_PREFIX)) return path;
		
		return     path.replaceAll(EopSetting.FILE_STORE_PREFIX, EopSetting.IMG_SERVER_DOMAIN+EopContext.getContext().getContextPath() );
	}
	
	/**
	 * 上传图片并生成缩略图
	 * 图片会被上传至用户上下文的attacment文件夹的subFolder子文件夹中<br/>
	 * 
	 * @param file  图片file对象
	 * @param fileFileName 上传的图片原名
	 * @param subFolder  子文件夹名
	 * @param width 缩略图的宽
	 * @param height 缩略图的高
	 * @return 上传后的图版全路径，如:http://static.eop.com/user/1/1/attachment/goods/2001010101030.jpg<br/>
	 * 返回值为大小为2的String数组，第一个元素为上传后的原图全路径，第二个无缩略图全路径
	 */
	public static String[] upload(File file,String fileFileName,String subFolder,int width,int height ){
		if(file==null || fileFileName==null) throw new IllegalArgumentException("file or filename object is null");
		if(subFolder == null)throw new IllegalArgumentException("subFolder is null");
		String fileName = null;
		String filePath = "";
		String [] path = new String[2];
 
		String ext = FileUtil.getFileExt(fileFileName);
		fileName = DateUtil.toString(new Date(), "yyyyMMddHHmmss") + StringUtil.getRandStr(4) + "." + ext;
		
		filePath =  EopSetting.IMG_SERVER_PATH+ getContextFolder()+ "/attachment/";
		if(subFolder!=null){
			filePath+=subFolder +"/";
		}
		
		path[0]  = EopSetting.IMG_SERVER_DOMAIN+ getContextFolder()+ "/attachment/" +(subFolder==null?"":subFolder)+ "/"+fileName;
		filePath += fileName;
		FileUtil.createFile(file, filePath);
		String thumbName= getThumbPath(filePath,"_thumbnail");
		 
		IThumbnailCreator thumbnailCreator = ThumbnailCreatorFactory.getCreator( filePath, thumbName);
		thumbnailCreator.resize(width, height);	
		path[1] = getThumbPath(path[0], "_thumbnail");
		return path;
	}
	
	
	
	
	/**
	 * 删除某个上传的文件
	 * @param filePath 文件全路径如：http://static.eop.com/user/1/1/attachment/goods/2001010101030.jpg
	 */
	public static void deleteFile(String filePath){
		filePath =filePath.replaceAll(EopSetting.IMG_SERVER_DOMAIN, EopSetting.IMG_SERVER_PATH);
		FileUtil.delete(filePath);		
	}
	
	
	
	/**
	 * 删除某个上传的文件
	 * @param filePath 文件全路径如：http://static.eop.com/user/1/1/attachment/goods/2001010101030.jpg
	 */
	public static void deleteFileAndThumb(String filePath){
		filePath =filePath.replaceAll(EopSetting.IMG_SERVER_DOMAIN, EopSetting.IMG_SERVER_PATH);
		FileUtil.delete(filePath);		
		FileUtil.delete(getThumbPath(filePath,"_thumbnail"));		
	}
	
	
	private static String getContextFolder(){
		 
		return EopContext.getContext().getContextPath();
	}
	
	/**
	 * 转换图片的名称
	 * @param filePath  如：http://static.eop.com/user/1/1/attachment/goods/2001010101030.jpg
	 * @param shortName 
	 * @return
	 */
	public static  String getThumbPath(String filePath, String shortName) {
		String pattern = "(.*)([\\.])(.*)";
		String thumbPath = "$1" + shortName + "$2$3";

		Pattern p = Pattern.compile(pattern, 2 | Pattern.DOTALL);
		Matcher m = p.matcher(filePath);
		if (m.find()) {
			String s = m.replaceAll(thumbPath);

			return s;
		}
		return null;
	}	
	
	
	public static void main(String[] args){
	 System.out.println(getThumbPath("http://static.eop.com/user/1/1/attachment/goods/2001010101030.jpg","_thumbnail"));	
	 System.out.println(getThumbPath("/user/1/1/attachment/goods/2001010101030.jpg","_thumbnail"));	
	 
	 System.out.println(getThumbPath("a.b.c.d.jpg","aa"));	
	 System.out.println(getThumbPath("a.b.c.d.jpgbbb241223#$","_mm"));	
	}
	
}
