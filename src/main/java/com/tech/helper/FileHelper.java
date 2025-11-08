package com.tech.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class FileHelper {
    public static boolean deleteFile(String path){
        boolean f = false;
        try {
            File file = new File(path);
            file.delete();
            f=true;
        }
        catch (Exception fileNotFoundException){
            fileNotFoundException.getStackTrace();
        }
        return f;
    }
    public static boolean saveFile(InputStream ins, String path) {
        try (FileOutputStream fos = new FileOutputStream(path)) {

            byte[] buffer = new byte[1024];
            int bytesRead;

            while ((bytesRead = ins.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }

            fos.flush();
            return true;

        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

}
