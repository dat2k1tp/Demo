package com.spring.utilities;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadFileUtils {
	public File handleUploadFile(MultipartFile uploadedFile,String fileName) {
		String folderPath="D:\\New folder\\ASSIGNMENT_JAVA5\\src\\main\\webapp\\views\\storage";
		File myUploadFolder =new File(folderPath);
		//kiem tra thu muc co ton tai k ? neu k thi tao moi
		if(!myUploadFolder.exists()) {
			myUploadFolder.mkdirs();
		}
		
		//luu file
		File savedFile=null;
		try {
			
			
		savedFile = new File(myUploadFolder,fileName);
		uploadedFile.transferTo(savedFile);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return savedFile;
	}
}
