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
    public static  boolean saveFile(InputStream ins , String path){
        boolean e = false;
        try{
          byte[] b =  new byte[ins.available()];
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(b);
            fos.flush();
            fos.close();
            e=true;
        }catch (Exception f){
            f.getStackTrace();
        }
        return e;
    }
}
